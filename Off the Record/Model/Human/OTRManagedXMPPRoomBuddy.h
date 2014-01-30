#import "_OTRManagedXMPPRoomBuddy.h"

@interface OTRManagedXMPPRoomBuddy : _OTRManagedXMPPRoomBuddy {}

+ (instancetype)fetchWithJID:(NSString *)JIDString inRoom:(OTRManagedXMPPRoom *)room;

@end
