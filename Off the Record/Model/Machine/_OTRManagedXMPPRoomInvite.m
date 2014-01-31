// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoomInvite.m instead.

#import "_OTRManagedXMPPRoomInvite.h"

const struct OTRManagedXMPPRoomInviteAttributes OTRManagedXMPPRoomInviteAttributes = {
	.date = @"date",
	.message = @"message",
	.roomJID = @"roomJID",
};

const struct OTRManagedXMPPRoomInviteRelationships OTRManagedXMPPRoomInviteRelationships = {
	.toAccount = @"toAccount",
};

const struct OTRManagedXMPPRoomInviteFetchedProperties OTRManagedXMPPRoomInviteFetchedProperties = {
};

@implementation OTRManagedXMPPRoomInviteID
@end

@implementation _OTRManagedXMPPRoomInvite

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OTRManagedXMPPRoomInvite" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OTRManagedXMPPRoomInvite";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OTRManagedXMPPRoomInvite" inManagedObjectContext:moc_];
}

- (OTRManagedXMPPRoomInviteID*)objectID {
	return (OTRManagedXMPPRoomInviteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic date;






@dynamic message;






@dynamic roomJID;






@dynamic toAccount;

	






@end
