//
//  KPIContent+CreateContent.m
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "KPIContent+CreateContent.h"

static NSString* entityName = @"KPIContent";

@implementation KPIContent (CreateContent)
+(KPIContent*) contentWithString:(NSString*) contentPath inManagedObjectContext:(NSManagedObjectContext*) context{
    KPIContent* content = nil;
    
    if ([contentPath length]) {
        NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:entityName];
        request.predicate = [NSPredicate predicateWithFormat:@"webURL = %@", contentPath];
    
    NSError *error;
    
    NSArray* matches = [context executeFetchRequest:request error:&error];

        if (!matches || matches.count > 1) {
            NSLog(@"KPIContent+CreateContent.h somethingWrong");
        } else if (!matches.count){
            content = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
            content.webURL = contentPath;
        }
        else{
            content = [matches lastObject];
        }
    
    }
                            
    return  content;
}
@end
