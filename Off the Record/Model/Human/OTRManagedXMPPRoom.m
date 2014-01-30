#import "OTRManagedXMPPRoom.h"


@interface OTRManagedXMPPRoom ()

// Private interface goes here.

@end


@implementation OTRManagedXMPPRoom

+ (instancetype)fetchRoomWithJID:(NSString *)JIDString
{
    return [OTRManagedXMPPRoom MR_findFirstByAttribute:OTRManagedXMPPRoomAttributes.roomJID withValue:JIDString];
}

@end
