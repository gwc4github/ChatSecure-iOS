//
//  OTRBaseChatViewController.m
//  Off the Record
//
//  Created by David Chiles on 2/4/14.
//  Copyright (c) 2014 Chris Ballinger. All rights reserved.
//

#import "OTRBaseChatViewController.h"

#import "Strings.h"
#import "OTRUtilities.h"

#import "OTRTitleSubtitleView.h"
#import "DAKeyboardControl.h"
#import "OTRManagedMessage.h"
#import "OTRManagedEncryptionMessage.h"
#import "OTRManagedStatusMessage.h"
#import "OTRMessageTableViewCell.h"
#import "OTRStatusMessageCell.h"

static CGFloat const messageMarginTop = 7;
static CGFloat const messageMarginBottom = 10;
static NSTimeInterval const messageSentDateShowTimeInterval = 5*60; // 5 minutes

@interface OTRBaseChatViewController ()


@property (nonatomic,strong) OTRChatInputBar * chatInputBar;
@property (nonatomic,strong) NSMutableArray * showDateForRowArray;
@property (nonatomic,strong) UISwipeGestureRecognizer * swipeGestureRecognizer;
@property (nonatomic,strong) NSDate *previousShownSentDate;

@property (nonatomic) CGFloat previousTextViewContentHeight;

@end

@implementation OTRBaseChatViewController

- (id)init
{
    if (self = [super init]) {
        //set notification for when keyboard shows/hides
        self.title = CHAT_STRING;
        self.titleView = [[OTRTitleSubtitleView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        self.titleView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        self.navigationItem.titleView = self.titleView;
        self.showDateForRowArray = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    UIEdgeInsets insets = self.tableView.contentInset;
    insets.bottom = self.initialBarChatBarHeight;
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        //insets.top = [self.navigationController navigationBar].frame.size.height;
    }
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.contentInset = self.tableView.scrollIndicatorInsets = insets;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    
    self.previousTextViewContentHeight = messageFontSize+20;
    
    CGRect barRect = CGRectMake(0, self.view.frame.size.height-self.initialBarChatBarHeight, self.view.frame.size.width, self.initialBarChatBarHeight);
    
    self.chatInputBar = [[OTRChatInputBar alloc] initWithFrame:barRect withDelegate:self];
    
    [self.view addSubview:self.chatInputBar];
    self.view.keyboardTriggerOffset = self.chatInputBar.frame.size.height;
    
    self.swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom)];
    [self.view addGestureRecognizer:self.swipeGestureRecognizer];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    __weak OTRBaseChatViewController * chatViewController = self;
    __weak OTRChatInputBar * weakChatInputbar = self.chatInputBar;
    [self.view addKeyboardPanningWithActionHandler:^(CGRect keyboardFrameInView) {
        CGRect messageInputBarFrame = weakChatInputbar.frame;
        messageInputBarFrame.origin.y = keyboardFrameInView.origin.y - messageInputBarFrame.size.height;
        weakChatInputbar.frame = messageInputBarFrame;
        
        UIEdgeInsets tableViewContentInset = chatViewController.tableView.contentInset;
        tableViewContentInset.bottom = chatViewController.view.frame.size.height-weakChatInputbar.frame.origin.y;
        chatViewController.tableView.contentInset = chatViewController.tableView.scrollIndicatorInsets = tableViewContentInset;
        [chatViewController scrollToBottomAnimated:NO];
    }];
    
    // KLUDGE: Work around keyboard visibility bug where chat input view is visible but keyboard is not
    if (self.view.keyboardFrameInView.size.height == 0 && self.chatInputBar.frame.origin.y < self.view.frame.size.height - self.chatInputBar.frame.size.height) {
        [self.chatInputBar.textView becomeFirstResponder];
    }
    // KLUDGE: If chatInputBar is beyond the bounds of the screen for some unknown reason, force it back into place
    if (self.chatInputBar.frame.origin.y > self.view.frame.size.height - self.chatInputBar.frame.size.height) {
        CGRect newFrame = self.chatInputBar.frame;
        newFrame.origin.y = self.view.frame.size.height - self.chatInputBar.frame.size.height;
        self.chatInputBar.frame = newFrame;
    }
}

///////////////////////////////////////////////////////////////
#pragma mark - other helpers
///////////////////////////////////////////////////////////////
-(void)handleSwipeFrom
{
    if (self.swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight && UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (CGFloat)initialBarChatBarHeight
{
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        return 40;
    }
    else{
        return 42;
    }
}

- (void)scrollToBottomAnimated:(BOOL)animated {
    NSInteger numberOfRows = [self.tableView numberOfRowsInSection:0];
    if (numberOfRows) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:numberOfRows-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:animated];
    }
}

- (BOOL)showDateForMessageAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < [self.showDateForRowArray count]) {
        return [self.showDateForRowArray[indexPath.row] boolValue];
    }
    else if (indexPath.row - [self.showDateForRowArray count] > 0)
    {
        [self showDateForMessageAtIndexPath:[NSIndexPath indexPathForItem:indexPath.row-1 inSection:indexPath.section]];
    }
    
    __block BOOL showDate = NO;
    if (indexPath.row < [[self.messagesFetchedResultsController sections][indexPath.section] numberOfObjects]) {
        id messageOrStatus = [self.messagesFetchedResultsController objectAtIndexPath:indexPath];
        if([messageOrStatus isKindOfClass:[OTRManagedChatMessage class]]) {
            //only OTRManagedMessage get dates
            
            OTRManagedChatMessage * currentMessage = (OTRManagedChatMessage *)messageOrStatus;
            
            if (!self.previousShownSentDate || [currentMessage.date timeIntervalSinceDate:_previousShownSentDate] > messageSentDateShowTimeInterval) {
                self.previousShownSentDate = currentMessage.date;
                showDate = YES;
            }
        }
    }
    
    
    [self.showDateForRowArray addObject:[NSNumber numberWithBool:showDate]];
    
    return showDate;
}


///////////////////////////////////////////////////////////////
#pragma mark - Table view data source
///////////////////////////////////////////////////////////////

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.messagesFetchedResultsController sections][section] numberOfObjects];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = 0;
    if (indexPath.row < [[self.messagesFetchedResultsController sections][indexPath.section] numberOfObjects])
    {
        BOOL showDate = [self showDateForMessageAtIndexPath:indexPath];
        id messageOrStatus = [self.messagesFetchedResultsController objectAtIndexPath:indexPath];
        if([messageOrStatus isKindOfClass:[OTRManagedMessage class]]) {
            
            OTRManagedMessage * message = (OTRManagedChatMessage *)messageOrStatus;
            height = [OTRMessageTableViewCell heightForMesssage:message.message showDate:showDate];
            
        }
        else {
            height = messageSentDateLabelHeight;
        }
    }
    else
    {
        //Composing messsage height
        CGSize messageTextLabelSize =[OTRMessageTableViewCell messageTextLabelSize:@"T"];
        height = messageTextLabelSize.height+messageMarginTop+messageMarginBottom;
        height = 35.0;
    }
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *messageCellIdentifier = @"messageCellIdentifier";
    static NSString *statusCellIdentifier = @"statusCellIdentifier";
    UITableViewCell * cell = nil;
    OTRManagedMessage * message = [self.messagesFetchedResultsController objectAtIndexPath:indexPath];
    if ([message isKindOfClass:[OTRManagedChatMessage class]]) {
        OTRManagedChatMessage *chatMessage = (OTRManagedChatMessage *)message;
        BOOL showDate = [self showDateForMessageAtIndexPath:indexPath];
        cell = [tableView dequeueReusableCellWithIdentifier:messageCellIdentifier];
        if (!cell) {
            cell = [[OTRMessageTableViewCell alloc] initWithMessage:chatMessage withDate:showDate reuseIdentifier:messageCellIdentifier];
        }
        else if([cell isKindOfClass:[OTRMessageTableViewCell class]]){
            ((OTRMessageTableViewCell*)cell).message = chatMessage;
            ((OTRMessageTableViewCell*)cell).showDate = showDate;
            
        }
    }
    else if ([message isKindOfClass:[OTRManagedStatusMessage class]] || [message isKindOfClass:[OTRManagedEncryptionMessage class]])
    {
        cell = [tableView dequeueReusableCellWithIdentifier:statusCellIdentifier];
        if (!cell) {
            cell = [[OTRStatusMessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:statusCellIdentifier];
            cell.userInteractionEnabled = NO;
        }
        
        NSString * cellText = nil;
        
        if ([message isKindOfClass:[OTRManagedStatusMessage class]]) {
            if (message.isIncomingValue) {
                cellText = [NSString stringWithFormat:INCOMING_STATUS_MESSAGE,message.message];
            }
            else{
                cellText = [NSString stringWithFormat:YOUR_STATUS_MESSAGE,message.message];
            }
        }
        else{
            cellText = message.message;
        }
        
        ((OTRStatusMessageCell *)cell).statusMessageLabel.text = cellText;
    }
    return cell;
}

///////////////////////////////////////////////////////////////
#pragma mark - FetchedResultsController
///////////////////////////////////////////////////////////////

- (NSFetchedResultsController *)messagesFetchedResultsController
{
    if (!_messagesFetchedResultsController) {
        _messagesFetchedResultsController = [OTRManagedMessage MR_fetchAllGroupedBy:nil
                                                                      withPredicate:nil
                                                                           sortedBy:nil
                                                                          ascending:YES
                                                                           delegate:self];
    }
    return _messagesFetchedResultsController;
}

///////////////////////////////////////////////////////////////
#pragma mark - FetchedResultsControllerDelegate
///////////////////////////////////////////////////////////////

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    if ([controller isEqual:self.messagesFetchedResultsController]) {
        [self.tableView beginUpdates];
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    if ([controller isEqual:self.messagesFetchedResultsController]) {
        switch(type) {
            case NSFetchedResultsChangeInsert:
            {
                [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationBottom];
            }
                break;
            case NSFetchedResultsChangeUpdate:
            {
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }
                break;
            case NSFetchedResultsChangeMove:
            {
                [self.tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
            }
                break;
            case NSFetchedResultsChangeDelete:
            {
                [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
            }
                break;
        }
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    if ([controller isEqual:self.messagesFetchedResultsController]) {
        [self.tableView endUpdates];
    }
}

@end
