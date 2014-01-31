// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OTRManagedXMPPRoom.h instead.

#import <CoreData/CoreData.h>


extern const struct OTRManagedXMPPRoomAttributes {
	__unsafe_unretained NSString *isJoined;
	__unsafe_unretained NSString *lastMessageDate;
	__unsafe_unretained NSString *myNickname;
	__unsafe_unretained NSString *myRoomJID;
	__unsafe_unretained NSString *roomJID;
	__unsafe_unretained NSString *roomSubject;
} OTRManagedXMPPRoomAttributes;

extern const struct OTRManagedXMPPRoomRelationships {
	__unsafe_unretained NSString *roomBuddies;
	__unsafe_unretained NSString *roomMessages;
} OTRManagedXMPPRoomRelationships;

extern const struct OTRManagedXMPPRoomFetchedProperties {
} OTRManagedXMPPRoomFetchedProperties;

@class OTRManagedXMPPRoomBuddy;
@class OTRManagedXMPPRoomMessage;








@interface OTRManagedXMPPRoomID : NSManagedObjectID {}
@end

@interface _OTRManagedXMPPRoom : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OTRManagedXMPPRoomID*)objectID;





@property (nonatomic, strong) NSNumber* isJoined;



@property BOOL isJoinedValue;
- (BOOL)isJoinedValue;
- (void)setIsJoinedValue:(BOOL)value_;

//- (BOOL)validateIsJoined:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* lastMessageDate;



//- (BOOL)validateLastMessageDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* myNickname;



//- (BOOL)validateMyNickname:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* myRoomJID;



//- (BOOL)validateMyRoomJID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* roomJID;



//- (BOOL)validateRoomJID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* roomSubject;



//- (BOOL)validateRoomSubject:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *roomBuddies;

- (NSMutableSet*)roomBuddiesSet;




@property (nonatomic, strong) NSSet *roomMessages;

- (NSMutableSet*)roomMessagesSet;





@end

@interface _OTRManagedXMPPRoom (CoreDataGeneratedAccessors)

- (void)addRoomBuddies:(NSSet*)value_;
- (void)removeRoomBuddies:(NSSet*)value_;
- (void)addRoomBuddiesObject:(OTRManagedXMPPRoomBuddy*)value_;
- (void)removeRoomBuddiesObject:(OTRManagedXMPPRoomBuddy*)value_;

- (void)addRoomMessages:(NSSet*)value_;
- (void)removeRoomMessages:(NSSet*)value_;
- (void)addRoomMessagesObject:(OTRManagedXMPPRoomMessage*)value_;
- (void)removeRoomMessagesObject:(OTRManagedXMPPRoomMessage*)value_;

@end

@interface _OTRManagedXMPPRoom (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveIsJoined;
- (void)setPrimitiveIsJoined:(NSNumber*)value;

- (BOOL)primitiveIsJoinedValue;
- (void)setPrimitiveIsJoinedValue:(BOOL)value_;




- (NSDate*)primitiveLastMessageDate;
- (void)setPrimitiveLastMessageDate:(NSDate*)value;




- (NSString*)primitiveMyNickname;
- (void)setPrimitiveMyNickname:(NSString*)value;




- (NSString*)primitiveMyRoomJID;
- (void)setPrimitiveMyRoomJID:(NSString*)value;




- (NSString*)primitiveRoomJID;
- (void)setPrimitiveRoomJID:(NSString*)value;




- (NSString*)primitiveRoomSubject;
- (void)setPrimitiveRoomSubject:(NSString*)value;





- (NSMutableSet*)primitiveRoomBuddies;
- (void)setPrimitiveRoomBuddies:(NSMutableSet*)value;



- (NSMutableSet*)primitiveRoomMessages;
- (void)setPrimitiveRoomMessages:(NSMutableSet*)value;


@end
