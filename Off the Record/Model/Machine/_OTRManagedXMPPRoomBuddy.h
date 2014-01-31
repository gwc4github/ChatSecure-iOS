// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoomBuddy.h instead.

#import <CoreData/CoreData.h>


extern const struct OTRManagedXMPPRoomBuddyAttributes {
	__unsafe_unretained NSString *affiliation;
	__unsafe_unretained NSString *jid;
	__unsafe_unretained NSString *nickname;
	__unsafe_unretained NSString *role;
} OTRManagedXMPPRoomBuddyAttributes;

extern const struct OTRManagedXMPPRoomBuddyRelationships {
	__unsafe_unretained NSString *room;
	__unsafe_unretained NSString *roomMessages;
} OTRManagedXMPPRoomBuddyRelationships;

extern const struct OTRManagedXMPPRoomBuddyFetchedProperties {
} OTRManagedXMPPRoomBuddyFetchedProperties;

@class OTRManagedXMPPRoom;
@class OTRManagedXMPPRoomMessage;






@interface OTRManagedXMPPRoomBuddyID : NSManagedObjectID {}
@end

@interface _OTRManagedXMPPRoomBuddy : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OTRManagedXMPPRoomBuddyID*)objectID;





@property (nonatomic, strong) NSString* affiliation;



//- (BOOL)validateAffiliation:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* jid;



//- (BOOL)validateJid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* nickname;



//- (BOOL)validateNickname:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* role;



//- (BOOL)validateRole:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) OTRManagedXMPPRoom *room;

//- (BOOL)validateRoom:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *roomMessages;

- (NSMutableSet*)roomMessagesSet;





@end

@interface _OTRManagedXMPPRoomBuddy (CoreDataGeneratedAccessors)

- (void)addRoomMessages:(NSSet*)value_;
- (void)removeRoomMessages:(NSSet*)value_;
- (void)addRoomMessagesObject:(OTRManagedXMPPRoomMessage*)value_;
- (void)removeRoomMessagesObject:(OTRManagedXMPPRoomMessage*)value_;

@end

@interface _OTRManagedXMPPRoomBuddy (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAffiliation;
- (void)setPrimitiveAffiliation:(NSString*)value;




- (NSString*)primitiveJid;
- (void)setPrimitiveJid:(NSString*)value;




- (NSString*)primitiveNickname;
- (void)setPrimitiveNickname:(NSString*)value;




- (NSString*)primitiveRole;
- (void)setPrimitiveRole:(NSString*)value;





- (OTRManagedXMPPRoom*)primitiveRoom;
- (void)setPrimitiveRoom:(OTRManagedXMPPRoom*)value;



- (NSMutableSet*)primitiveRoomMessages;
- (void)setPrimitiveRoomMessages:(NSMutableSet*)value;


@end
