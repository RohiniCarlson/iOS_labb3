//
//  AddNewTask.h
//  Labb3
//
//  Created by it-högskolan on 2015-02-05.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AddNewTask : UIViewController

@property (nonatomic) NSMutableArray*
tasks;

@property (nonatomic) AppDelegate *delegate;

@end
