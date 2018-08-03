//
//  KPIContent+CoreDataProperties.m
//  Podcasts
//
//  Created by Pavel Koka on 8/2/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//
//

#import "KPIContent+CoreDataProperties.h"

@implementation KPIContent (CoreDataProperties)

+ (NSFetchRequest<KPIContent *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"KPIContent"];
}

@dynamic localURL;
@dynamic webURL;
@dynamic urlForContent;

@end
