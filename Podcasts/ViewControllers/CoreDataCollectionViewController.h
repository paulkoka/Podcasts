//
//  CoreDataCollectionViewController.h
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataCollectionViewController : UICollectionViewController <NSFetchedResultsControllerDelegate>
@property (nonatomic) NSFetchedResultsController* fetchedResultsController;

@property BOOL debug;

-(void) performFetch;

@end
