//
//  KPIItem+PopulatingByRSSChannel.m
//  Podcasts
//
//  Created by Pavel Koka on 8/2/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "KPIItem+PopulatingByRSSChannel.h"
#import "KPIItem+rSSItem.h"
@implementation KPIItem (PopulatingByRSSChannel)

-(void)populatingByRSSChannel:(NSArray*) array andContext:(NSManagedObjectContext*) context{

    for (NSDictionary* obj in array) {
        [KPIItem itemWithRSSItem:obj inManagedObjectContext:context];
    }  
}

@end
