//
//  KPIItem+rSSItem.m
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "KPIItem+rSSItem.h"

static NSString* MyEntityName = @"KPIItem";

@implementation KPIItem (rSSItem)
+(KPIItem*) itemWithRSSItem:(NSDictionary*) itemDictionary
     inManagedObjectContext: (NSManagedObjectContext*) context{
    MyTags* tags = [[MyTags alloc] init];
    KPIItem* item = nil;
    
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:MyEntityName];
    request.predicate = [NSPredicate predicateWithFormat:@"gUID = %@", [itemDictionary objectForKey:tags.guid]];
    
    NSError *error;
    NSArray* matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || error || matches.count > 1) {
      //  NSLog(@"%@", error);
      //  NSLog(@"KPIItem+rSSItem.h error count  = %ld", matches.count );
    } else if ([matches count]){
        item = [matches firstObject];
    }
    else{
        item = [NSEntityDescription insertNewObjectForEntityForName:MyEntityName inManagedObjectContext:context];
        item.author = [itemDictionary objectForKey:tags.author];
        item.title = [itemDictionary objectForKey:tags.title];
        item.duration = [itemDictionary objectForKey:tags.duration];
        item.details = [itemDictionary objectForKey:tags.details];
        item.gUID = [itemDictionary objectForKey:tags.guid];
        item.sourceType = [itemDictionary objectForKey:tags.MysourceType];
        item.publicationDate =[itemDictionary objectForKey:tags.pubDate];
        item.contentURL = [KPIContent contentWithString:[itemDictionary objectForKey:tags.contentURL] inManagedObjectContext:context                          ];
        item.pictureURL = [KPIPicture pictureWithString:[itemDictionary objectForKey:tags.imageURL] inManagedObjectContext:context];
     }
    return item;
}
@end
