//
//  OTRSubscriptionRequestsViewController.m
//  Off the Record
//
//  Created by David on 3/5/13.
//  Copyright (c) 2013 Chris Ballinger. All rights reserved.
//

#import "OTRSubscriptionRequestsViewController.h"
#import "OTRXMPPManagedPresenceSubscriptionRequest.h"
#import "OTRManagedXMPPAccount.h"
#import "Strings.h"
#import "OTRXMPPManager.h"
#import "OTRProtocolManager.h"
#import "OTRManagedXMPPRoomInvite.h"

static NSUInteger const subscriptionAlertViewTag = 222;
static NSUInteger const groupChatAlertViewTag    = 223;

@interface OTRSubscriptionRequestsViewController ()

@property (nonatomic,strong) OTRXMPPManagedPresenceSubscriptionRequest * currentSelectedRequest;
@property (nonatomic,strong) OTRManagedXMPPRoomInvite * currentSelectedRoomInvite;

@end

@implementation OTRSubscriptionRequestsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = SUBSCRIPTION_REQUEST_TITLE;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)];
    
}

-(void)doneButtonPressed:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self groupChatInvites].count && [self subscriptionRequests].count) {
        return 2;
    }
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray * sectionArray = [self arrayForSection:section];
    if ([sectionArray isEqual: [self groupChatInvites]]) {
        return @"Group Chat Invites";
    }
    else if([sectionArray isEqual:[self subscriptionRequests]]) {
        return SUBSCRIPTION_REQUEST_TITLE;
    }
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self arrayForSection:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSString * textLabelString = nil;
    NSString * detailTextLabelString = nil;
    NSArray * sectionArray = [self arrayForSection:indexPath.row];
    if ([sectionArray isEqual: [self groupChatInvites]]) {
        OTRManagedXMPPRoomInvite * invite = [[self groupChatInvites] objectAtIndex:indexPath.row];
        textLabelString = invite.roomJID;
        detailTextLabelString = invite.message;
    }
    else if([sectionArray isEqual:[self subscriptionRequests]]) {
        OTRXMPPManagedPresenceSubscriptionRequest * subRequest = [[self subscriptionRequests] objectAtIndex:indexPath.row];
        textLabelString = subRequest.jid;
        detailTextLabelString = subRequest.xmppAccount.username;
    }

    
    cell.textLabel.text = textLabelString;
    cell.detailTextLabel.text = detailTextLabelString;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray * sectionArray = [self arrayForSection:indexPath.row];
    if ([sectionArray isEqual: [self groupChatInvites]]) {
        self.currentSelectedRoomInvite = [sectionArray objectAtIndex:indexPath.row];
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:self.currentSelectedRoomInvite.roomJID
                                                                  delegate:self
                                                         cancelButtonTitle:CANCEL_STRING
                                                    destructiveButtonTitle:REJECT_STRING
                                                         otherButtonTitles:@"Join", nil];
        actionSheet.tag = groupChatAlertViewTag;
        [actionSheet showInView:self.view];
    }
    else if([sectionArray isEqual:[self subscriptionRequests]]) {
        self.currentSelectedRequest = [sectionArray objectAtIndex:indexPath.row];
        UIActionSheet * requestActionSheet = [[UIActionSheet alloc] initWithTitle:self.currentSelectedRequest.jid
                                                                         delegate:self
                                                                cancelButtonTitle:CANCEL_STRING
                                                           destructiveButtonTitle:REJECT_STRING
                                                                otherButtonTitles:ADD_STRING, nil];
        requestActionSheet.tag = subscriptionAlertViewTag;
        [requestActionSheet showInView:self.view];
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSFetchedResultsController *)subscriptionRequestsFetchedResultsController
{
    if(_subscriptionRequestsFetchedResultsController)
    {
        return _subscriptionRequestsFetchedResultsController;
    }
    
    _subscriptionRequestsFetchedResultsController = [OTRXMPPManagedPresenceSubscriptionRequest MR_fetchAllGroupedBy:nil withPredicate:nil sortedBy:OTRXMPPManagedPresenceSubscriptionRequestAttributes.jid ascending:YES delegate:self];
    
    return _subscriptionRequestsFetchedResultsController;
}

-(NSArray* )subscriptionRequests {
    NSPredicate * accountPredicate = [NSPredicate predicateWithFormat:@"self.xmppAccount.isConnected == YES"];
    return [[self.subscriptionRequestsFetchedResultsController fetchedObjects] filteredArrayUsingPredicate:accountPredicate];
}

- (NSArray *)groupChatInvites {
    NSArray * invites = [OTRManagedXMPPRoomInvite MR_findAllSortedBy:OTRManagedXMPPRoomInviteAttributes.date ascending:YES];
    return invites;
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}


-(NSArray *)arrayForSection:(NSUInteger)section
{
    if ([self groupChatInvites].count && [self subscriptionRequests].count) {
        if (section == 0) {
            return [self subscriptionRequests];
        }
        else {
            return [self groupChatInvites];
        }
    }
    else if([self groupChatInvites].count) {
        return [self groupChatInvites];
    }
    else if ([self subscriptionRequests].count) {
        return [self subscriptionRequests];
    }
    return nil;
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet.cancelButtonIndex != buttonIndex )
    {
        if (actionSheet.tag == groupChatAlertViewTag) {
            if (actionSheet.destructiveButtonIndex != buttonIndex) {
                //Join Room
                OTRXMPPManager * manager = (OTRXMPPManager *)[[OTRProtocolManager sharedInstance] protocolForAccount:self.currentSelectedRoomInvite.toAccount];
                XMPPRoom * room = [[XMPPRoom alloc] initWithRoomStorage:manager.xmppRoomStorage jid:[XMPPJID jidWithString:self.currentSelectedRoomInvite.roomJID]];
                [room activate:manager.xmppStream];
                
                [room joinRoomUsingNickname:@"THis cool Name" history:nil];
            }
            [self.currentSelectedRoomInvite MR_deleteEntity];
            [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
            [self.tableView reloadData];
        }
        else if (actionSheet.tag == subscriptionAlertViewTag)
        {
            OTRXMPPManager * manager = (OTRXMPPManager *)[[OTRProtocolManager sharedInstance] protocolForAccount:self.currentSelectedRequest.xmppAccount];
            XMPPJID *jid = [XMPPJID jidWithString:self.currentSelectedRequest.jid];
            
            if (actionSheet.destructiveButtonIndex == buttonIndex) {
                [manager.xmppRoster rejectPresenceSubscriptionRequestFrom:jid];
            }
            else
            {
                [manager.xmppRoster acceptPresenceSubscriptionRequestFrom:jid andAddToRoster:YES];
            }
            [self.currentSelectedRequest MR_deleteEntity];
            [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
            
        }
        
        
    }
    
    
}

@end
