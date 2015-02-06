//
//  Task.h
//  Labb3
//
//  Created by it-högskolan on 2015-02-02.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject<NSCoding>

@property (nonatomic) NSString *taskTitle;

@property (nonatomic) NSString *taskDate;

@property (nonatomic) NSString *taskComments;

@property (nonatomic) BOOL completed;

typedef enum priority {
High, // == 0 (by default)
Normal, // == 1
Low // == 2
} priority;
@property (nonatomic) priority taskPriority;

-(instancetype)initWithTitle:(NSString*)name andDate:(NSString*)date;

-(NSString*)convertToStringBool:(BOOL) completedStatus;

-(NSString*)convertToStringEnum:(priority)whichPriority;

- (void)encodeWithCoder:(NSCoder *)encoder;

- (id)initWithCoder:(NSCoder *)decoder;

@end
