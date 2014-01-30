#import "OTRManagedXMPPRoomBuddy.h"


@interface OTRManagedXMPPRoomBuddy ()

// Private interface goes here.

@end


@implementation OTRManagedXMPPRoomBuddy

+ (instancetype)fetchWithJID:(NSString *)JIDString inRoom:(OTRManagedXMPPRoom *)room;
{
    NSPredicate * jidPredicate = [NSPredicate predicateWithFormat:@"%K == %@",OTRManagedXMPPRoomBuddyAttributes.jid,JIDString];
    NSPredicate * roomPredicate = [NSPredicate predicateWithFormat:@"%K == %@",OTRManagedXMPPRoomBuddyRelationships.room,room];
    NSPredicate * compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[jidPredicate,roomPredicate]];
    
    return [OTRManagedXMPPRoomBuddy MR_findFirstWithPredicate:compoundPredicate];
}

@end
