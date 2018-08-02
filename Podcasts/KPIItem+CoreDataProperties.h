//
//  KPIItem+CoreDataProperties.h
//  Podcasts
//
//  Created by Pavel Koka on 8/1/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//
//

#import "KPIItem+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface KPIItem (CoreDataProperties)

+ (NSFetchRequest<KPIItem *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *author;
@property (nullable, nonatomic, copy) NSString *details;
@property (nullable, nonatomic, copy) NSString *duration;
@property (nullable, nonatomic, copy) NSString *gUID;
@property (nullable, nonatomic, copy) NSDate *publicationDate;
@property (nullable, nonatomic, copy) NSString *sourceType;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) KPIContent *contentURL;
@property (nullable, nonatomic, retain) KPIPicture *pictureURL;

@end

NS_ASSUME_NONNULL_END
