//
//  OTRRequestManager.h
//  Off the Record
//
//  Created by David Chiles on 1/29/14.
//  Copyright (c) 2014 Chris Ballinger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTRRequestManager : NSObject <NSFetchedResultsControllerDelegate>

@property (nonatomic,readonly) NSUInteger numberOfRequests;

@end
