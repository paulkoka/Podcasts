//
//  KPIItem+rSSItem.h
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "KPIItem+CoreDataClass.h"
#import "MyTags.h"
#import "KPIContent+CreateContent.h"
#import "KPIPicture+addPictureURL.h"

@interface KPIItem (rSSItem)

+(KPIItem*) itemWithRSSItem:(NSDictionary*) itemDictionary
     inManagedObjectContext: (NSManagedObjectContext*) context;
@end
