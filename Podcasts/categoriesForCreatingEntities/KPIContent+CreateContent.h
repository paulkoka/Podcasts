//
//  KPIContent+CreateContent.h
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "KPIContent+CoreDataClass.h"

@interface KPIContent (CreateContent)

+(KPIContent*) contentWithString:(NSString*) contentPath inManagedObjectContext:(NSManagedObjectContext*) context;

@end
