//
//  KPIItem+CoreDataProperties.m
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//
//

#import "KPIItem+CoreDataProperties.h"

@implementation KPIItem (CoreDataProperties)

+ (NSFetchRequest<KPIItem *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"KPIItem"];
}

@dynamic author;
@dynamic details;
@dynamic duration;
@dynamic gUID;
@dynamic sourceType;
@dynamic title;
@dynamic publicationDate;
@dynamic contentURL;
@dynamic pictureURL;

@end
