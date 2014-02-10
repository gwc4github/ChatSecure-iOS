#import "OTRManagedXMPPRoomMessage.h"
#import "OTRUtilities.h"

#import "OTRManagedXMPPRoomBuddy.h"


@interface OTRManagedXMPPRoomMessage ()



@end


@implementation OTRManagedXMPPRoomMessage

- (NSString *)fromBuddyDisplayName
{
    return self.fromBuddy.nickname;
}

+ (OTRManagedXMPPRoomMessage *)newMessage
{
    OTRManagedXMPPRoomMessage * managedMessage = [OTRManagedXMPPRoomMessage MR_createEntity];
    managedMessage.date = [NSDate date];
    managedMessage.uniqueID = [OTRUtilities uniqueString];
    
    return managedMessage;
}

@end
