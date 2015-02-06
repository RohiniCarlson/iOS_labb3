//
//  TaskDetail.h
//  Labb3
//
//  Created by it-högskolan on 2015-02-04.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TaskDetail : UIViewController

@property (nonatomic) NSInteger taskIndex;

@property (nonatomic) NSMutableArray*
tasks;

@property (nonatomic) AppDelegate *delegate;

@end
