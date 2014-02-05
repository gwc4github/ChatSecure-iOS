//
//  OTRXMPPRoomStorage.m
//  Off the Record
//
//  Created by David Chiles on 1/29/14.
//  Copyright (c) 2014 Chris Ballinger. All rights reserved.
//

#import "OTRXMPPRoomStorage.h"

#import "OTRManagedXMPPRoom.h"
#import "OTRManagedXMPPRoomMessage.h"
#import "OTRManagedXMPPRoomBuddy.h"
#import "OTRManagedXMPPRoomStatusMessage.h"
#import "OTRProtocolManager.h"
#import "OTRXMPPManager.h"

#import "NSXMLElement+XEP_0203.h"

#import "OTRLog.h"

@interface OTRXMPPRoomStorage ()

@end

@implementation OTRXMPPRoomStorage

- (BOOL)isDuplicateMessage:(XMPPMessage *)message inRoom:(OTRManagedXMPPRoom *)managedRoom
{
    NSDate *remoteTimestamp = [message delayedDeliveryDate];
    
    //check unique ID
    NSString * uniqueId = [message elementID];
    if ([uniqueId length]) {
        if ([OTRManagedXMPPRoomMessage MR_findFirstByAttribute:OTRManagedChatMessageAttributes.uniqueID withValue:uniqueId]) {
            return YES;
        }
        return NO;
    }
    
    return NO;
}

- (void)insertMessage:(XMPPMessage *)message inRoom:(OTRManagedXMPPRoom *)managedRoom outgoing:(BOOL)outgoing
{
    OTRManagedXMPPRoomBuddy * roomBuddy = [OTRXMPPRoomStorage fetchOrCreateWithJIDString:message.fromStr inRoom:managedRoom];
    
    OTRManagedXMPPRoomMessage * managedMessage = [OTRManagedXMPPRoomMessage MR_createEntity];
    managedMessage.date = [NSDate date];
    managedMessage.uniqueID = message.elementID;
    managedMessage.room = managedRoom;
    managedMessage.fromBuddy = roomBuddy;
    managedMessage.message = [message body];
    managedMessage.isIncomingValue = !outgoing;
    
    
    if ([message delayedDeliveryDate]) {
        managedMessage.remoteTimestamp = [message delayedDeliveryDate];
    }
    
    
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
}

- (OTRManagedXMPPRoom *)fetchOrCreateWithXMPPRoom:(XMPPRoom *)xmppRoom
{
    OTRManagedXMPPRoom * room = [OTRManagedXMPPRoom fetchRoomWithJID:[xmppRoom.roomJID full]];
    if (!room) {
        room = [OTRManagedXMPPRoom MR_createEntity];
        room.account = [self.xmppManager.account MR_inThreadContext];
        
        room.roomJID = [xmppRoom.roomJID full];
        room.roomSubject = xmppRoom.roomSubject;
        room.isJoinedValue = xmppRoom.isJoined;
        room.myNickname = xmppRoom.myNickname;
        room.myRoomJID = [xmppRoom.myRoomJID full];
        
    }
    return room;
}

+ (OTRManagedXMPPRoomBuddy *)fetchOrCreateWithJIDString:(NSString *)jidString inRoom:(OTRManagedXMPPRoom *)managedRoom
{
    OTRManagedXMPPRoomBuddy * roomBuddy = [OTRManagedXMPPRoomBuddy fetchWithJID:jidString inRoom:managedRoom];
    if (!roomBuddy) {
        roomBuddy = [OTRManagedXMPPRoomBuddy MR_createEntity];
        roomBuddy.jid = jidString;
        roomBuddy.room = managedRoom;
    }
    return roomBuddy;
}


#pragma mark - XMPPRoomStorage protocol methods
/**
 * Configures the storage class, passing it's parent and parent's dispatch queue.
 *
 * This method is called by the init method of the XMPPRoom class.
 * This method is designed to inform the storage class of it's parent
 * and of the dispatch queue the parent will be operating on.
 *
 * A storage class may choose to operate on the same queue as it's parent,
 * as the majority of the time it will be getting called by the parent.
 * If both are operating on the same queue, the combination may run faster.
 *
 * Some storage classes support multiple xmppStreams,
 * and may choose to operate on their own internal queue.
 *
 * This method should return YES if it was configured properly.
 * It should return NO only if configuration failed.
 * For example, a storage class designed to be used only with a single xmppStream is being added to a second stream.
 * The XMPPCapabilites class is configured to ignore the passed
 * storage class in it's init method if this method returns NO.
 **/
- (BOOL)configureWithParent:(XMPPRoom *)aParent queue:(dispatch_queue_t)queue {
    
    OTRManagedXMPPRoom * managedRoom = [self fetchOrCreateWithXMPPRoom:aParent];
    
    if (!managedRoom) {
        return NO;
    }
    
    return YES;
}

/**
 * Updates and returns the occupant for the given presence element.
 * If the presence type is "available", and the occupant doesn't already exist, then one should be created.
 **/
- (void)handlePresence:(XMPPPresence *)presence room:(XMPPRoom *)room
{
    OTRManagedXMPPRoom * managedRoom = [self fetchOrCreateWithXMPPRoom:room];
    OTRManagedXMPPRoomBuddy * roomBuddy = [OTRXMPPRoomStorage fetchOrCreateWithJIDString:presence.fromStr inRoom:managedRoom];
    
    NSXMLElement *item = [[presence elementForName:@"x" xmlns:XMPPMUCAdminNamespace] elementForName:@"item"];
    
    
    roomBuddy.affiliation = [item attributeStringValueForName:@"affiliation"];;
    roomBuddy.role = [item attributeStringValueForName:@"role"];;
    roomBuddy.nickname = presence.from.resource;
    
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
}

/**
 * Stores or otherwise handles the given message element.
 **/
- (void)handleIncomingMessage:(XMPPMessage *)message room:(XMPPRoom *)room
{
    
    OTRManagedXMPPRoom * managedRoom = [self fetchOrCreateWithXMPPRoom:room];
    
    if (![self isDuplicateMessage:message inRoom:managedRoom]) {
        [self insertMessage:message inRoom:managedRoom outgoing:NO];
    }
    
    
}
- (void)handleOutgoingMessage:(XMPPMessage *)message room:(XMPPRoom *)room
{
    OTRManagedXMPPRoom * managedRoom = [self fetchOrCreateWithXMPPRoom:room];
    
    if (![self isDuplicateMessage:message inRoom:managedRoom]) {
        [self insertMessage:message inRoom:managedRoom outgoing:YES];
    }
}

/**
 * Handles leaving the room, which generally means clearing the list of occupants.
 **/
- (void)handleDidLeaveRoom:(XMPPRoom *)room
{
    DDLogInfo(@"%@ - @%@",THIS_METHOD,THIS_METHOD);
    OTRManagedXMPPRoom * managedRoom = [self fetchOrCreateWithXMPPRoom:room];
    managedRoom.isJoinedValue = NO;
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveOnlySelfAndWait];
}

/**
 * May be used if there's anything special to do when joining a room.
 **/
- (void)handleDidJoinRoom:(XMPPRoom *)room withNickname:(NSString *)nickname
{
    DDLogInfo(@"%@ - @%@",THIS_METHOD,THIS_METHOD);
    OTRManagedXMPPRoom * managedRoom = [self fetchOrCreateWithXMPPRoom:room];
    managedRoom.isJoinedValue = YES;
    managedRoom.myNickname = nickname;
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveOnlySelfAndWait];
    
}

@end
