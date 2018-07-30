//
//  KPIItem+CoreDataClass.h
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KPIContent, KPIPicture;

static NSString* MyEntityName = @"KPIItem";

NS_ASSUME_NONNULL_BEGIN

@interface KPIItem : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "KPIItem+CoreDataProperties.h"
