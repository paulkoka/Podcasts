//
//  RssItemsCDCVC.h
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "CoreDataCollectionViewController.h"
#import "RSSLoader.h"

@interface RssItemsCDCVC : CoreDataCollectionViewController

@property(nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) RSSLoader* loader;


@end
