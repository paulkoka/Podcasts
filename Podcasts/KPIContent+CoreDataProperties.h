//
//  KPIContent+CoreDataProperties.h
//  Podcasts
//
//  Created by Pavel Koka on 8/2/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//
//

#import "KPIContent+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface KPIContent (CoreDataProperties)

+ (NSFetchRequest<KPIContent *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *localURL;
@property (nullable, nonatomic, copy) NSString *webURL;
@property (nullable, nonatomic, retain) KPIItem *urlForContent;

@end

NS_ASSUME_NONNULL_END
