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

@property (weak, nonatomic) IBOutlet UITextField *dateTask;

@property (weak, nonatomic) IBOutlet UITextField *titleTask;

@property (weak, nonatomic) IBOutlet UITextView *commentsTask;

@property (weak, nonatomic) IBOutlet UISegmentedControl *completedTask;

@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityTask;

@property Task *task;

@property BOOL taskCompletion;

@property priority taskPriority;

@end

@implementation TaskDetail

NSString *stringValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.task = self.tasks[self.taskIndex];
    self.dateTask.text = [self.task taskDate];
    [[self.commentsTask layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.commentsTask layer] setBorderWidth:0.5];
    self.commentsTask.text = [self.task taskComments];
    self.titleTask.text = [self.task taskTitle];
    if ([self.task completed]) {
        [self.completedTask setSelectedSegmentIndex:0];
    } else {
        [self.completedTask setSelectedSegmentIndex:1];
    }
    if ([self.task taskPriority] == High ) {
        [self.priorityTask setSelectedSegmentIndex:0];
    } else if ([self.task taskPriority] == Normal ) {
        [self.priorityTask setSelectedSegmentIndex:1];
    } else {
        [self.priorityTask setSelectedSegmentIndex:2];
    }
    self.delegate = [UIApplication sharedApplication].delegate;
}


- (IBAction)onTaskCompletionChanged:(id)sender {
    if (self.completedTask.selectedSegmentIndex == 0) {
        self.taskCompletion = YES;
    } else {
        self.taskCompletion = NO;
    }
}


- (IBAction)onTaskPriorityChanged:(id)sender {
    if (self.priorityTask.selectedSegmentIndex == 0) {
        self.taskPriority = High;
    } else if (self.priorityTask.selectedSegmentIndex == 1) {
        self.taskPriority = Normal;
    } else {
        self.taskPriority = Low;
    }
}


- (IBAction)saveChangesButtonPressed:(id)sender {
    
    [[self.tasks objectAtIndex:self.taskIndex] setTaskDate:self.dateTask.text];
    
    [[self.tasks objectAtIndex:self.taskIndex] setTaskTitle:self.titleTask.text];
    
    [[self.tasks objectAtIndex:self.taskIndex] setTaskComments:self.commentsTask.text];
    
    [[self.tasks objectAtIndex:self.taskIndex] setCompleted:self.taskCompletion];
    
    [[self.tasks objectAtIndex:self.taskIndex] setTaskPriority:self.taskPriority];
    self.delegate.tasks = self.tasks;
    
    [self dismissViewControllerAnimated:YES completion:nil];    
}


- (IBAction)cancelButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
