// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPBuddy.m instead.

#import "_OTRManagedXMPPBuddy.h"

const struct OTRManagedXMPPBuddyAttributes OTRManagedXMPPBuddyAttributes = {
};

const struct OTRManagedXMPPBuddyRelationships OTRManagedXMPPBuddyRelationships = {
	.resources = @"resources",
};

const struct OTRManagedXMPPBuddyFetchedProperties OTRManagedXMPPBuddyFetchedProperties = {
};

@implementation OTRManagedXMPPBuddyID
@end

@implementation _OTRManagedXMPPBuddy

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OTRManagedXMPPBuddy" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OTRManagedXMPPBuddy";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OTRManagedXMPPBuddy" inManagedObjectContext:moc_];
}

- (OTRManagedXMPPBuddyID*)objectID {
	return (OTRManagedXMPPBuddyID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic resources;

	
- (NSMutableSet*)resourcesSet {
	[self willAccessValueForKey:@"resources"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"resources"];
  
	[self didAccessValueForKey:@"resources"];
	return result;
}
	






@end
