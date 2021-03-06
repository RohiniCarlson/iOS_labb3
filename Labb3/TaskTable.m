//
//  TaskTable.m
//  Labb3
//
//  Created by it-högskolan on 2015-02-03.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import "TaskTable.h"
#import "Task.h"
#import "TaskDetail.h"
#import "AddNewTask.h"
#import "AppDelegate.h"

@interface TaskTable ()

@end

@implementation TaskTable

-(NSMutableArray*)tasks {
    if (!_tasks) {
       _tasks = [[NSMutableArray alloc]init];
    }
    return _tasks;
}


- (void)viewWillAppear:(BOOL)animated {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.tasks = [delegate tasks];
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [self.tasks[indexPath.row]description];
        if ([self.tasks[indexPath.row]completed]) {
            cell.imageView.image = [UIImage imageNamed:@"taskdone"];
        } else {
            if ([self.tasks[indexPath.row]taskPriority] == High) {
                cell.imageView.image = [UIImage imageNamed:@"highprio"];
            } else if ([self.tasks[indexPath.row]taskPriority] == Low) {
                cell.imageView.image = [UIImage imageNamed:@"lowprio"];
            } else {
                cell.imageView.image = [UIImage imageNamed:@"todo"];
            }
        }
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.tasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } /*else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    } */  
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSInteger cellIndex;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if ([segue.identifier isEqualToString:@"Detail"]){
        TaskDetail *detailView = [segue destinationViewController];
        cellIndex =                     indexPath.row;
        detailView.taskIndex = cellIndex;
        detailView.tasks = self.tasks;
    } else if ([segue.identifier isEqualToString:@"Add"]){
        AddNewTask *addView = [segue destinationViewController];
        addView.tasks = self.tasks;
    } else {
        NSLog(@"You forgot the segue %@",segue);
    }
}

@end
