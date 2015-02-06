//
//  Task.m
//  Labb3
//
//  Created by it-högskolan on 2015-02-02.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import "Task.h"

@implementation Task


-(instancetype)initWithTitle:(NSString*)taskTitle andDate:(NSString*) taskDate {
    self = [super init];
    if (self) {
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


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.taskTitle forKey:@"title"];
    [encoder encodeObject:self.taskDate forKey:@"taskdate"];
    [encoder encodeObject:self.taskComments forKey:@"comments"];
    [encoder encodeBool:self.completed forKey:@"completed"];
    [encoder encodeInteger:self.taskPriority forKey:@"priority"];
}


- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.taskTitle = [decoder decodeObjectForKey:@"title"];
        self.taskDate = [decoder decodeObjectForKey:@"taskdate"];
        self.taskComments = [decoder decodeObjectForKey:@"comments"];
        self.completed = [decoder decodeBoolForKey:@"completed"];
        self.taskPriority = [decoder decodeIntegerForKey:@"priority"];
    }
    return self;
}

@end
