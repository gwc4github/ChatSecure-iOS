// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoomStatusMessage.h instead.

#import <CoreData/CoreData.h>
#import "OTRManagedStatusMessage.h"

extern const struct OTRManagedXMPPRoomStatusMessageAttributes {
} OTRManagedXMPPRoomStatusMessageAttributes;

extern const struct OTRManagedXMPPRoomStatusMessageRelationships {
	__unsafe_unretained NSString *roomBuddy;
} OTRManagedXMPPRoomStatusMessageRelationships;

extern const struct OTRManagedXMPPRoomStatusMessageFetchedProperties {
} OTRManagedXMPPRoomStatusMessageFetchedProperties;

@class OTRManagedXMPPRoomBuddy;


@interface OTRManagedXMPPRoomStatusMessageID : NSManagedObjectID {}
@end

@interface _OTRManagedXMPPRoomStatusMessage : OTRManagedStatusMessage {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OTRManagedXMPPRoomStatusMessageID*)objectID;





@property (nonatomic, strong) OTRManagedXMPPRoomBuddy *roomBuddy;

//- (BOOL)validateRoomBuddy:(id*)value_ error:(NSError**)error_;





@end

@interface _OTRManagedXMPPRoomStatusMessage (CoreDataGeneratedAccessors)

@end

@interface _OTRManagedXMPPRoomStatusMessage (CoreDataGeneratedPrimitiveAccessors)



- (OTRManagedXMPPRoomBuddy*)primitiveRoomBuddy;
- (void)setPrimitiveRoomBuddy:(OTRManagedXMPPRoomBuddy*)value;


@end
