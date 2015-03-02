//
//  MasterViewController.m
//  ParseJson
//
//  Created by Yaroslav Gorkun on 24.02.15.
//  Copyright (c) 2015 yaroslav Horkun. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import <RestKit/CoreData.h>
#import <RestKit/RestKit.h>

#import "Article.h"
#import "ArticleList.h"

@interface MasterViewController ()

@property NSArray *articles;
@property (weak, nonatomic) IBOutlet UIRefreshControl *refreshControll;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)refresh:(UIRefreshControl *)sender {
//    [self.tableView reloadData];
    [self requestData];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.articles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Article *article = self.articles[indexPath.row];
    cell.textLabel.text = article.title;
    return cell;
}

#pragma mark - RESTKit

- (void)requestData {
    
    NSString *requestPath = @"/v1/categories/16/articles.json";
    
    [[RKObjectManager sharedManager]
     getObjectsAtPath:requestPath
     parameters:nil
     success: ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
         //articles have been saved in core data by now
         [self fetchArticlesFromContext];
     }
     failure: ^(RKObjectRequestOperation *operation, NSError *error) {
         RKLogError(@"Load failed with error: %@", error);
     }
     ];
    
}

- (void)fetchArticlesFromContext {
    
    NSManagedObjectContext *context = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"ArticleList"];
    
        NSLog(@"fetchRequest - %@", fetchRequest);
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    fetchRequest.sortDescriptors = @[descriptor];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    ArticleList *articleList = [fetchedObjects firstObject];
    
    self.articles = [articleList.articles allObjects];
    

    
    [self.tableView reloadData];
    
    [self.refreshControll endRefreshing];
    
}
@end

