//
//  AddNewTask.m
//  Labb3
//
//  Created by it-högskolan on 2015-02-05.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import "AddNewTask.h"
#import "Task.h"

@interface AddNewTask ()

@property (weak, nonatomic) IBOutlet UITextField *dateTask;

@property (weak, nonatomic) IBOutlet UITextField *titleTask;

@property (weak, nonatomic) IBOutlet UITextView *commentsTask;

@property (weak, nonatomic) IBOutlet UISegmentedControl *completedTask;

@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityTask;

@property Task *task;

@property BOOL taskCompletion;

@property priority prio;

@end

@implementation AddNewTask

- (void)viewDidLoad {
    [super viewDidLoad];
    self.completedTask.selectedSegmentIndex = 1;
    self.priorityTask.selectedSegmentIndex = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)completedTaskSegmentedControlPressed:(id)sender {
    if (self.completedTask.selectedSegmentIndex == 0) {
        self.taskCompletion = YES;
    } else {
        self.taskCompletion = NO;
    }
}

- (IBAction)priorityTaskSegmentedControlPressed:(id)sender {
    if (self.priorityTask.selectedSegmentIndex == 0) {
        self.prio = High;
    } else if (self.priorityTask.selectedSegmentIndex == 1) {
        self.prio = Normal;
    } else {
        self.prio = Low;
    }
}

- (IBAction)saveNewButtonPressed:(id)sender {
    self.task = [[Task alloc] initWithTitle:self.titleTask.text andDate:self.dateTask.text];
    self.task.taskComments = self.commentsTask.text;
    self.task.completed = self.taskCompletion;
    self.task.taskPriority = self.prio;
    [self.tasks addObject:self.task];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
