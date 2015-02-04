//
//  TaskDetail.m
//  Labb3
//
//  Created by it-högskolan on 2015-02-04.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import "TaskDetail.h"
#import "Task.h"

@interface TaskDetail ()

@property (weak, nonatomic) IBOutlet UILabel *taskDescription;

@property (weak, nonatomic) IBOutlet UILabel *priorityLevel;

@property (weak, nonatomic) IBOutlet UILabel *taskCompleted;

@end

@implementation TaskDetail

NSString *stringValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.taskDescription.text = [self.tasks[self.taskIndex] name];
    self.taskCompleted.text = [self convertToStringBool:([self.tasks[self.taskIndex] completed])];
    self.priorityLevel.text = [self convertToStringEnum:([self.tasks[self.taskIndex] taskPriority])];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
