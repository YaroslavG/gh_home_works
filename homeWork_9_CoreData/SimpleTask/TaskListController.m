//
//  TaskListController.m
//  SimpleTask
//
//  Created by Yaroslav Gorkun on 24.12.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import "TaskListController.h"
#import "TaskStore.h"
#import "Task.h"

@interface TaskListController ()

@property (nonatomic, assign) BOOL isEditing;
@property (nonatomic, strong) Task * task;

@end

@implementation TaskListController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"ToDo";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                              target:self
                                             action:@selector(addTask:)];
    
    
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[TaskStore sharedStore] allTasks].count;
}


- (void)addTask:(id)sender
{
    self.isEditing = NO;
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"New Task"
                                                 message:@"Edit a name for your new task"
                                                delegate:self
                                       cancelButtonTitle:@"Cancel"
                                       otherButtonTitles:@"Done", nil];
        av.alertViewStyle = UIAlertViewStylePlainTextInput;
        [av show];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.cancelButtonIndex != buttonIndex)
    {
        NSString *taskString = [alertView textFieldAtIndex:0].text;
        if (![taskString isEqualToString:@""])
        {
            Task * task = nil;
            if (self.isEditing)
            {
                task = self.task;
            }
            else
            {
                task = [[TaskStore sharedStore] createTask];
            }
            
            task.taskName = taskString;
            
            [self.tableView reloadData];
            

        }
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Task *task = [[TaskStore sharedStore].allTasks objectAtIndex:indexPath.row];
        [[TaskStore sharedStore] removeTask:task];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    Task *task = [[TaskStore sharedStore].allTasks objectAtIndex:indexPath.row];
    if ([task.completed isEqualToNumber:[NSNumber numberWithBool:YES]]) {
        NSLog(@"click");
        task.completed = [NSNumber numberWithBool:NO];
        self.navigationItem.leftBarButtonItem.enabled = NO;
    } else {
        task.completed = [NSNumber numberWithBool:YES];
                self.navigationItem.leftBarButtonItem.enabled = YES;
    }
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Task *task = [[TaskStore sharedStore].allTasks objectAtIndex:indexPath.row];
    cell.textLabel.text = task.taskName;
    if ([task.completed isEqualToNumber:[NSNumber numberWithBool:YES]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UILongPressGestureRecognizer * tap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRegonized:)];
    [cell.contentView addGestureRecognizer:tap];
    
    return cell;
}


- (void)longPressGestureRegonized:(UILongPressGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        self.isEditing = YES;
    CGPoint location = [gesture locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:location];
        
    Task *task = [[TaskStore sharedStore].allTasks objectAtIndex:swipedIndexPath.row];
        
    self.task = task;
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Edit Task"
                                                     message:@"Edit a name for your task"
                                                    delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles:@"Done", nil];
    av.alertViewStyle = UIAlertViewStylePlainTextInput;
    [av textFieldAtIndex:0].text = task.taskName;
    [av show];
    }
}


// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
