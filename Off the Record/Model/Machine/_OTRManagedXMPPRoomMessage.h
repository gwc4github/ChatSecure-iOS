// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoomMessage.h instead.

#import <CoreData/CoreData.h>
#import "OTRManagedChatMessage.h"

extern const struct OTRManagedXMPPRoomMessageAttributes {
	__unsafe_unretained NSString *remoteTimestamp;
} OTRManagedXMPPRoomMessageAttributes;

extern const struct OTRManagedXMPPRoomMessageRelationships {
	__unsafe_unretained NSString *fromBuddy;
	__unsafe_unretained NSString *room;
} OTRManagedXMPPRoomMessageRelationships;

extern const struct OTRManagedXMPPRoomMessageFetchedProperties {
} OTRManagedXMPPRoomMessageFetchedProperties;

@class OTRManagedXMPPRoomBuddy;
@class OTRManagedXMPPRoom;



@interface OTRManagedXMPPRoomMessageID : NSManagedObjectID {}
@end

@interface _OTRManagedXMPPRoomMessage : OTRManagedChatMessage {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OTRManagedXMPPRoomMessageID*)objectID;





@property (nonatomic, strong) NSDate* remoteTimestamp;



//- (BOOL)validateRemoteTimestamp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) OTRManagedXMPPRoomBuddy *fromBuddy;

//- (BOOL)validateFromBuddy:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) OTRManagedXMPPRoom *room;

//- (BOOL)validateRoom:(id*)value_ error:(NSError**)error_;





@end

@interface _OTRManagedXMPPRoomMessage (CoreDataGeneratedAccessors)

@end

@interface _OTRManagedXMPPRoomMessage (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveRemoteTimestamp;
- (void)setPrimitiveRemoteTimestamp:(NSDate*)value;





- (OTRManagedXMPPRoomBuddy*)primitiveFromBuddy;
- (void)setPrimitiveFromBuddy:(OTRManagedXMPPRoomBuddy*)value;



- (OTRManagedXMPPRoom*)primitiveRoom;
- (void)setPrimitiveRoom:(OTRManagedXMPPRoom*)value;


@end
