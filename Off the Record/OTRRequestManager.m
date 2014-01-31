//
//  OTRRequestManager.m
//  Off the Record
//
//  Created by David Chiles on 1/29/14.
//  Copyright (c) 2014 Chris Ballinger. All rights reserved.
//

#import "OTRRequestManager.h"

#import "OTRManagedXMPPRoomInvite.h"
#import "OTRXMPPManagedPresenceSubscriptionRequest.h"

@interface OTRRequestManager ()

@property (nonatomic) NSUInteger numberOfRequests;

@property (nonatomic,strong) NSFetchedResultsController * xmppGroupChatInvitesFetchedResultsController;
@property (nonatomic,strong) NSFetchedResultsController * xmppBuddyRequestsFetchedResultsController;

@end

@implementation OTRRequestManager


- (id)init
{
    if(self = [super init]) {
        self.numberOfRequests = 0;
        
        self.xmppGroupChatInvitesFetchedResultsController = [OTRManagedXMPPRoomInvite MR_fetchAllGroupedBy:nil withPredicate:nil sortedBy:OTRManagedXMPPRoomInviteAttributes.date ascending:YES delegate:self];
        
        
        self.xmppBuddyRequestsFetchedResultsController = [OTRXMPPManagedPresenceSubscriptionRequest MR_fetchAllGroupedBy:nil withPredicate:nil sortedBy:OTRXMPPManagedPresenceSubscriptionRequestAttributes.date ascending:YES delegate:self];
        [self updateNumberOfRequests];
    }
    return self;
}

- (void)updateNumberOfRequests
{
    self.numberOfRequests = [self numberOfBuddyRequests] + [self numberOfGroupInvites];
}

- (NSUInteger)numberOfBuddyRequests
{
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"self.xmppAccount.isConnected == YES"];
    return [[[self.xmppBuddyRequestsFetchedResultsController fetchedObjects] filteredArrayUsingPredicate:predicate] count];
}

- (NSUInteger)numberOfGroupInvites
{
    return [[self.xmppGroupChatInvitesFetchedResultsController fetchedObjects] count];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeDelete:
        case NSFetchedResultsChangeInsert:
            [self updateNumberOfRequests];
            break;
        default:
            break;
    }
}
     
     



@end
