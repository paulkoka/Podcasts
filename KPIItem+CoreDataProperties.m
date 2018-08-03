//
//  KPIItem+CoreDataProperties.m
//  Podcasts
//
//  Created by Pavel Koka on 8/2/18.
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
@dynamic publicationDate;
@dynamic sourceType;
@dynamic title;
@dynamic pictureLocalURL;
@dynamic contentLocalURL;
@dynamic pictureWebURL;
@dynamic contentWebURL;
@dynamic fullPicture;
@dynamic previewPicture;
@dynamic content;

@end
