//
//  OTRGroupChatViewController.m
//  Off the Record
//
//  Created by David Chiles on 2/4/14.
//  Copyright (c) 2014 Chris Ballinger. All rights reserved.
//

#import "OTRGroupChatViewController.h"
#import "OTRManagedXMPPRoom.h"
#import "OTRManagedXMPPRoomMessage.h"
#import "OTRManagedXMPPRoomBuddy.h"
#import "OTRXMPPManager.h"
#import "OTRProtocolManager.h"

@interface OTRGroupChatViewController ()

@end

@implementation OTRGroupChatViewController

@synthesize messagesFetchedResultsController = _messagesFetchedResultsController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)setManagedRoom:(OTRManagedXMPPRoom *)managedRoom
{
    if (![managedRoom isEqual:self.managedRoom]) {
        [self willChangeValueForKey:NSStringFromSelector(@selector(managedRoom))];
        _managedRoom = managedRoom;
        [self didChangeValueForKey:NSStringFromSelector(@selector(managedRoom))];
        self.messagesFetchedResultsController = nil;
    }
}

- (NSFetchedResultsController *)messagesFetchedResultsController
{
    if (!_messagesFetchedResultsController) {
        NSPredicate * roomPredicate = [NSPredicate predicateWithFormat:@"%K == %@",OTRManagedXMPPRoomMessageRelationships.room,self.managedRoom];
        _messagesFetchedResultsController = [OTRManagedXMPPRoomMessage MR_fetchAllGroupedBy:nil
                                                                                  withPredicate:roomPredicate
                                                                                       sortedBy:OTRManagedMessageAttributes.date
                                                                                      ascending:YES
                                                                                       delegate:self];
    }
    return _messagesFetchedResultsController;
}

//////////////////////////////////////////////////////////////////////////
#pragma - mark UITableViewDataSource Methods
/////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
#pragma - mark UITableViewDelegate Methods
//////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
#pragma - mark NSFetchedResultsControllerDelegate Methods
//////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
#pragma - mark OTRChatInputBarDelegate Methods
//////////////////////////////////////////////////////////////////////


- (void) sendButtonPressedForInputBar:(OTRChatInputBar *)inputBar
{
    OTRXMPPManager * xmppManager = (OTRXMPPManager *)[[OTRProtocolManager sharedInstance] protocolForAccount:self.managedRoom.account];
    [xmppManager sendGroupMessage:inputBar.textView.text toRoomJID:self.managedRoom.roomJID];
}
@end
