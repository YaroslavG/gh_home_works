//
//  TaskStore.m
//  SimpleTask
//
//  Created by Yaroslav Gorkun on 25.12.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import "TaskStore.h"
#import <CoreData/CoreData.h>



@implementation TaskStore

    @synthesize allTask = _allTask;

    NSManagedObjectContext *_context;
    NSManagedObjectModel *_model;


- (NSString *)modelPath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}


- (id)init
{
    self = [super init];
    if (self) {
        // Set up our model and context
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
        NSURL *storeURL = [NSURL fileURLWithPath:self.modelPath];
        
        NSError *error;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:nil
                                       error:&error]) {
            [NSException raise:@"Open Failed" format:@"Reason: %@", error.localizedDescription];
        }
        
        _context = [[NSManagedObjectContext alloc] init];
        _context.persistentStoreCoordinator = psc;
        _context.undoManager = nil;
    }
    return self;
}

+ (TaskStore *)sharedStore
{
    static TaskStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (Task *)createTask
{
    Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:_context];
    [_allTask addObject:task];
    return task;
}


- (NSArray *)allTasks
{
    if (!_allTask) {
        NSFetchRequest *req = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [_model.entitiesByName objectForKey:@"Task"];
        req.entity = e;
        
        NSPredicate *p = [NSPredicate predicateWithFormat:@"completed==%@", [NSNumber numberWithBool:NO]];
        req.predicate = p;
        
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"created" ascending:YES];
        req.sortDescriptors = @[sd];
        
        // Fetch
        NSError *error;
        NSArray *result = [_context executeFetchRequest:req error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed" format:@"Reason: %@", error.localizedDescription];
        }
        _allTask = [[NSMutableArray alloc] initWithArray:result];
    }
    return _allTask;
}

- (void)save
{
    [_context save:nil];
}


- (void)removeTask:(Task *)task
{
    [_context deleteObject:task];
    [_allTask removeObjectIdenticalTo:task];
}


@end



