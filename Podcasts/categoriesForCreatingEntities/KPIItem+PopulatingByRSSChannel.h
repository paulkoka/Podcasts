//
//  KPIItem+PopulatingByRSSChannel.h
//  Podcasts
//
//  Created by Pavel Koka on 8/2/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "KPIItem+CoreDataClass.h"

@interface KPIItem (PopulatingByRSSChannel)

-(void)populatingByRSSChannel:(NSArray*) array andContext:(NSManagedObjectContext*) context;

@end
