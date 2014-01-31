#import "OTRManagedXMPPRoomInvite.h"


@interface OTRManagedXMPPRoomInvite ()

// Private interface goes here.

@end


@implementation OTRManagedXMPPRoomInvite

+ (instancetype)fetchRoomInviteWithJIDString:(NSString *)jidString
{
    return [OTRManagedXMPPRoomInvite MR_findFirstByAttribute:OTRManagedXMPPRoomInviteAttributes.roomJID withValue:jidString];
}

@end
