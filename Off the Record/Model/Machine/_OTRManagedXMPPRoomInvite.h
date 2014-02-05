// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoomInvite.h instead.

#import <CoreData/CoreData.h>


extern const struct OTRManagedXMPPRoomInviteAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *message;
	__unsafe_unretained NSString *roomJID;
} OTRManagedXMPPRoomInviteAttributes;

extern const struct OTRManagedXMPPRoomInviteRelationships {
	__unsafe_unretained NSString *toAccount;
} OTRManagedXMPPRoomInviteRelationships;

extern const struct OTRManagedXMPPRoomInviteFetchedProperties {
} OTRManagedXMPPRoomInviteFetchedProperties;

@class OTRManagedXMPPAccount;





@interface OTRManagedXMPPRoomInviteID : NSManagedObjectID {}
@end

@interface _OTRManagedXMPPRoomInvite : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OTRManagedXMPPRoomInviteID*)objectID;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* message;



//- (BOOL)validateMessage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* roomJID;



//- (BOOL)validateRoomJID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) OTRManagedXMPPAccount *toAccount;

//- (BOOL)validateToAccount:(id*)value_ error:(NSError**)error_;





@end

@interface _OTRManagedXMPPRoomInvite (CoreDataGeneratedAccessors)

@end

@interface _OTRManagedXMPPRoomInvite (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveMessage;
- (void)setPrimitiveMessage:(NSString*)value;




- (NSString*)primitiveRoomJID;
- (void)setPrimitiveRoomJID:(NSString*)value;





- (OTRManagedXMPPAccount*)primitiveToAccount;
- (void)setPrimitiveToAccount:(OTRManagedXMPPAccount*)value;


@end
