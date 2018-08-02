//
//  KPIPicture+CoreDataProperties.m
//  Podcasts
//
//  Created by Pavel Koka on 8/1/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//
//

#import "KPIPicture+CoreDataProperties.h"

@implementation KPIPicture (CoreDataProperties)

+ (NSFetchRequest<KPIPicture *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"KPIPicture"];
}

@dynamic localURL;
@dynamic webURL;
@dynamic urlForItemPicture;

@end
