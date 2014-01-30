// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPBuddy.h instead.

#import <CoreData/CoreData.h>
#import "OTRManagedBuddy.h"

extern const struct OTRManagedXMPPBuddyAttributes {
} OTRManagedXMPPBuddyAttributes;

extern const struct OTRManagedXMPPBuddyRelationships {
	__unsafe_unretained NSString *resources;
} OTRManagedXMPPBuddyRelationships;

extern const struct OTRManagedXMPPBuddyFetchedProperties {
} OTRManagedXMPPBuddyFetchedProperties;

@class NSManagedObject;


@interface OTRManagedXMPPBuddyID : NSManagedObjectID {}
@end

@interface _OTRManagedXMPPBuddy : OTRManagedBuddy {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OTRManagedXMPPBuddyID*)objectID;





@property (nonatomic, strong) NSSet *resources;

- (NSMutableSet*)resourcesSet;





@end

@interface _OTRManagedXMPPBuddy (CoreDataGeneratedAccessors)

- (void)addResources:(NSSet*)value_;
- (void)removeResources:(NSSet*)value_;
- (void)addResourcesObject:(NSManagedObject*)value_;
- (void)removeResourcesObject:(NSManagedObject*)value_;

@end

@interface _OTRManagedXMPPBuddy (CoreDataGeneratedPrimitiveAccessors)



- (NSMutableSet*)primitiveResources;
- (void)setPrimitiveResources:(NSMutableSet*)value;


@end
