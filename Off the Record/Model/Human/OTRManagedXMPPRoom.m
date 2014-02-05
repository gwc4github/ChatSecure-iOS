#import "OTRManagedXMPPRoom.h"
#import "XMPPJID.h"

@interface OTRManagedXMPPRoom ()

// Private interface goes here.

@end


@implementation OTRManagedXMPPRoom

- (NSString *)roomDomain
{
    [[XMPPJID jidWithString:self.roomJID] domain];
}

- (NSString *)roomName
{
    [[XMPPJID jidWithString:self.roomJID] user];
}

+ (instancetype)fetchRoomWithJID:(NSString *)JIDString
{
    return [OTRManagedXMPPRoom MR_findFirstByAttribute:OTRManagedXMPPRoomAttributes.roomJID withValue:JIDString];
}

@end
