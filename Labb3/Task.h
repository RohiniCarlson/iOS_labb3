//
//  Task.h
//  Labb3
//
//  Created by it-högskolan on 2015-02-02.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic) int taskId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *taskDate;
@property (nonatomic) BOOL completed;
typedef enum priority {
Low, // == 0 (by default)
Normal, // == 1
High // == 2
} priority;
@property (nonatomic) priority taskPriority;

-(instancetype)initWithName:(NSString*)name andDate:(NSString*)date;

@end
