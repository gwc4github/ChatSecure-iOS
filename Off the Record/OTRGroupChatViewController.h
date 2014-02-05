//
//  OTRGroupChatViewController.h
//  Off the Record
//
//  Created by David Chiles on 2/4/14.
//  Copyright (c) 2014 Chris Ballinger. All rights reserved.
//

#import "OTRBaseChatViewController.h"

@class OTRManagedXMPPRoom;

@interface OTRGroupChatViewController : OTRBaseChatViewController

@property (nonatomic,strong) OTRManagedXMPPRoom * managedRoom;


@end
