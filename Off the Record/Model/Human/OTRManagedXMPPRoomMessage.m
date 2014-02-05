#import "OTRManagedXMPPRoomMessage.h"
#import "OTRUtilities.h"


@interface OTRManagedXMPPRoomMessage ()

// Private interface goes here.

@end


@implementation OTRManagedXMPPRoomMessage

+ (OTRManagedXMPPRoomMessage *)newMessage
{
    OTRManagedXMPPRoomMessage * managedMessage = [OTRManagedXMPPRoomMessage MR_createEntity];
    managedMessage.date = [NSDate date];
    managedMessage.uniqueID = [OTRUtilities uniqueString];
    
    return managedMessage;
}

@end
