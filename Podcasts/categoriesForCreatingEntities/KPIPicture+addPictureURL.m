//
//  KPIPicture+addPictureURL.m
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "KPIPicture+addPictureURL.h"

@implementation KPIPicture (addPictureURL)
+(KPIPicture*) pictureWithString:(NSString*) contentPath inManagedObjectContext:(NSManagedObjectContext*) context{
    KPIPicture* picture = nil;
    
    if (contentPath.length) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityNamePic];
        request.predicate = [NSPredicate predicateWithFormat:@"webURL = %@", contentPath];
        
        NSError *error;
        
        NSArray* matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || matches.count > 1) {
            NSLog(@"KPIPicture+addPictureURL.h smth wrong");
        } else if (!matches.count){
            picture = [NSEntityDescription insertNewObjectForEntityForName:entityNamePic inManagedObjectContext:context];
            picture.webURL = contentPath;
        }
        else {
            picture = [matches lastObject];
        }
        
    }
    
    
    return  picture;
}
@end
