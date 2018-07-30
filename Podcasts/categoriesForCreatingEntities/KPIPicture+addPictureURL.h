//
//  KPIPicture+addPictureURL.h
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//



#import "KPIPicture+CoreDataClass.h"

static NSString* entityNamePic = @"KPIPicture";

@interface KPIPicture (addPictureURL)
+(KPIPicture*) pictureWithString:(NSString*) contentPath inManagedObjectContext:(NSManagedObjectContext*) context;
@end
