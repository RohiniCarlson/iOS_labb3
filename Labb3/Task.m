//
//  Task.m
//  Labb3
//
//  Created by it-högskolan on 2015-02-02.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import "Task.h"

@implementation Task

int _id = 0;

-(instancetype)initWithTitle:(NSString*)taskTitle andDate:(NSString*) taskDate {
    self = [super init];
    if (self) {
        self.taskId = _id++;
        self.taskTitle = taskTitle;
        self.taskDate = taskDate;
        self.taskComments = @"";
        self.completed = NO;
        self.taskPriority = Normal;
    }
    return self;
}

-(NSString*)description {
    return [NSString stringWithFormat:@"%@  -  %@",self.taskDate,self.taskTitle];
}

-(NSString*)convertToStringBool:(BOOL)completedStatus {
    
    return completedStatus ? @"Yes" : @"No";
}

-(NSString*)convertToStringEnum:(priority)whichPriority {
    
    NSString *result;
    
    switch(whichPriority) {
        case Low:
            result = @"Low";
            break;
        case Normal:
            result = @"Normal";
            break;
        case High:
            result = @"High";
            break;
        default:
            result = @"Unknown";
    }
    return result;
}

@end
