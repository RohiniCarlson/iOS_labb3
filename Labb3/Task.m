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

-(instancetype)initWithName:(NSString*)name andDate:(NSString*)dateEntry {
    self = [super init];
    if (self) {
        self.taskId = _id++;
        self.name = name;
        self.taskDate = dateEntry;
        self.completed = YES;
        self.taskPriority = Normal;
    }
    return self;
}

-(NSString*)description {
    return [NSString stringWithFormat:@"%@  -  %@",self.taskDate,self.name];
}

@end
