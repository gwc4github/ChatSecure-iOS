// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoomMessage.m instead.

#import "_OTRManagedXMPPRoomMessage.h"

const struct OTRManagedXMPPRoomMessageAttributes OTRManagedXMPPRoomMessageAttributes = {
	.remoteTimestamp = @"remoteTimestamp",
};

const struct OTRManagedXMPPRoomMessageRelationships OTRManagedXMPPRoomMessageRelationships = {
	.fromBuddy = @"fromBuddy",
	.room = @"room",
};

const struct OTRManagedXMPPRoomMessageFetchedProperties OTRManagedXMPPRoomMessageFetchedProperties = {
};

@implementation OTRManagedXMPPRoomMessageID
@end

@implementation _OTRManagedXMPPRoomMessage

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OTRManagedXMPPRoomMessage" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OTRManagedXMPPRoomMessage";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OTRManagedXMPPRoomMessage" inManagedObjectContext:moc_];
}

- (OTRManagedXMPPRoomMessageID*)objectID {
	return (OTRManagedXMPPRoomMessageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic remoteTimestamp;






@dynamic fromBuddy;

	

@dynamic room;

	






@end
