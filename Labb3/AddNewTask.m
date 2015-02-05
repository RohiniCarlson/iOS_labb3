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

@property priority taskPriority;

@end

@implementation AddNewTask

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        self.taskPriority = High;
    } else if (self.priorityTask.selectedSegmentIndex == 1) {
        self.taskPriority = Normal;
    } else {
        self.taskPriority = Low;
    }
}


- (IBAction)saveNewButtonPressed:(id)sender {
    /*[[self.tasks objectAtIndex:self.taskIndex] setTaskDate:self.dateTask.text];
    
    [[self.tasks objectAtIndex:self.taskIndex] setTaskTitle:self.titleTask.text];
    
    [[self.tasks objectAtIndex:self.taskIndex] setTaskComments:self.commentsTask.text];
    
    [[self.tasks objectAtIndex:self.taskIndex] setCompleted:self.taskCompletion];
    
    [[self.tasks objectAtIndex:self.taskIndex] setTaskPriority:self.taskPriority];
    
    self.task = [[Task alloc] init];
    
    [self.animals addObject:self.addAnimalName.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];*/
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
