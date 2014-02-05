// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoom.m instead.

#import "_OTRManagedXMPPRoom.h"

const struct OTRManagedXMPPRoomAttributes OTRManagedXMPPRoomAttributes = {
	.isJoined = @"isJoined",
	.lastMessageDate = @"lastMessageDate",
	.myNickname = @"myNickname",
	.myRoomJID = @"myRoomJID",
	.roomJID = @"roomJID",
	.roomSubject = @"roomSubject",
};

const struct OTRManagedXMPPRoomRelationships OTRManagedXMPPRoomRelationships = {
	.account = @"account",
	.roomBuddies = @"roomBuddies",
	.roomMessages = @"roomMessages",
};

const struct OTRManagedXMPPRoomFetchedProperties OTRManagedXMPPRoomFetchedProperties = {
};

@implementation OTRManagedXMPPRoomID
@end

@implementation _OTRManagedXMPPRoom

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OTRManagedXMPPRoom" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OTRManagedXMPPRoom";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OTRManagedXMPPRoom" inManagedObjectContext:moc_];
}

- (OTRManagedXMPPRoomID*)objectID {
	return (OTRManagedXMPPRoomID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"isJoinedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isJoined"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic isJoined;



- (BOOL)isJoinedValue {
	NSNumber *result = [self isJoined];
	return [result boolValue];
}

- (void)setIsJoinedValue:(BOOL)value_ {
	[self setIsJoined:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsJoinedValue {
	NSNumber *result = [self primitiveIsJoined];
	return [result boolValue];
}

- (void)setPrimitiveIsJoinedValue:(BOOL)value_ {
	[self setPrimitiveIsJoined:[NSNumber numberWithBool:value_]];
}





@dynamic lastMessageDate;






@dynamic myNickname;






@dynamic myRoomJID;






@dynamic roomJID;






@dynamic roomSubject;






@dynamic account;

	

@dynamic roomBuddies;

	
- (NSMutableSet*)roomBuddiesSet {
	[self willAccessValueForKey:@"roomBuddies"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"roomBuddies"];
  
	[self didAccessValueForKey:@"roomBuddies"];
	return result;
}
	

@dynamic roomMessages;

	
- (NSMutableSet*)roomMessagesSet {
	[self willAccessValueForKey:@"roomMessages"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"roomMessages"];
  
	[self didAccessValueForKey:@"roomMessages"];
	return result;
}
	






@end
