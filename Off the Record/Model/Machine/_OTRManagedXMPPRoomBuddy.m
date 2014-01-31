// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoomBuddy.m instead.

#import "_OTRManagedXMPPRoomBuddy.h"

const struct OTRManagedXMPPRoomBuddyAttributes OTRManagedXMPPRoomBuddyAttributes = {
	.affiliation = @"affiliation",
	.jid = @"jid",
	.nickname = @"nickname",
	.role = @"role",
};

const struct OTRManagedXMPPRoomBuddyRelationships OTRManagedXMPPRoomBuddyRelationships = {
	.room = @"room",
	.roomMessages = @"roomMessages",
};

const struct OTRManagedXMPPRoomBuddyFetchedProperties OTRManagedXMPPRoomBuddyFetchedProperties = {
};

@implementation OTRManagedXMPPRoomBuddyID
@end

@implementation _OTRManagedXMPPRoomBuddy

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OTRManagedXMPPRoomBuddy" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OTRManagedXMPPRoomBuddy";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OTRManagedXMPPRoomBuddy" inManagedObjectContext:moc_];
}

- (OTRManagedXMPPRoomBuddyID*)objectID {
	return (OTRManagedXMPPRoomBuddyID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic affiliation;






@dynamic jid;






@dynamic nickname;






@dynamic role;






@dynamic room;

	

@dynamic roomMessages;

	
- (NSMutableSet*)roomMessagesSet {
	[self willAccessValueForKey:@"roomMessages"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"roomMessages"];
  
	[self didAccessValueForKey:@"roomMessages"];
	return result;
}
	






@end
