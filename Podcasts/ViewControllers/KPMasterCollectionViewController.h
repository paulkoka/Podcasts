//
//  KPMasterCollectionViewController.h
//  Podcasts
//
//  Created by Pavel Koka on 7/26/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "RSSLoader.h"

@interface KPMasterCollectionViewController : UICollectionViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic) RSSLoader* loader;


@end
