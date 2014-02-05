#import "_OTRManagedXMPPRoom.h"

@interface OTRManagedXMPPRoom : _OTRManagedXMPPRoom {}


+ (instancetype)fetchRoomWithJID:(NSString *)JIDString;

@property (nonatomic,readonly) NSString * roomName;
@property (nonatomic,readonly) NSString * roomDomain;



@end
