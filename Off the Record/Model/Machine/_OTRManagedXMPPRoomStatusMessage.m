// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoomStatusMessage.m instead.

#import "_OTRManagedXMPPRoomStatusMessage.h"

const struct OTRManagedXMPPRoomStatusMessageAttributes OTRManagedXMPPRoomStatusMessageAttributes = {
};

const struct OTRManagedXMPPRoomStatusMessageRelationships OTRManagedXMPPRoomStatusMessageRelationships = {
	.roomBuddy = @"roomBuddy",
};

const struct OTRManagedXMPPRoomStatusMessageFetchedProperties OTRManagedXMPPRoomStatusMessageFetchedProperties = {
};

@implementation OTRManagedXMPPRoomStatusMessageID
@end

@implementation _OTRManagedXMPPRoomStatusMessage

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OTRManagedXMPPRoomStatusMessage" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OTRManagedXMPPRoomStatusMessage";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OTRManagedXMPPRoomStatusMessage" inManagedObjectContext:moc_];
}

- (OTRManagedXMPPRoomStatusMessageID*)objectID {
	return (OTRManagedXMPPRoomStatusMessageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic roomBuddy;

	






@end
