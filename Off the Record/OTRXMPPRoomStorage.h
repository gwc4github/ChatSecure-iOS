//
//  OTRXMPPRoomStorage.h
//  Off the Record
//
//  Created by David Chiles on 1/29/14.
//  Copyright (c) 2014 Chris Ballinger. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMPPRoom.h"

@class OTRManagedXMPPRoom;
@class OTRXMPPManager;

@interface OTRXMPPRoomStorage : NSObject <XMPPRoomStorage>

@property (nonatomic,weak) OTRXMPPManager * xmppManager;

- (OTRManagedXMPPRoom *)fetchOrCreateWithXMPPRoom:(XMPPRoom *)xmppRoom;

@end
