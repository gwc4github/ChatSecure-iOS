//
//  OTRBaseChatViewController.h
//  Off the Record
//
//  Created by David Chiles on 2/4/14.
//  Copyright (c) 2014 Chris Ballinger. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OTRChatInputBar.h"

@class OTRTitleSubtitleView;
@class OTRManagedChatMessage;

@interface OTRBaseChatViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate,OTRChatInputBarDelegate,UISplitViewControllerDelegate>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSFetchedResultsController * messagesFetchedResultsController;
@property (nonatomic,strong) OTRTitleSubtitleView * titleView;

- (BOOL)showUsernameForMessage:(OTRManagedChatMessage *)chatMessage;


@end
