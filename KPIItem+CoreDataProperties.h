//
//  KPIItem+CoreDataProperties.h
//  Podcasts
//
//  Created by Pavel Koka on 8/2/18.
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
@property (nullable, nonatomic, copy) NSString *pictureLocalURL;
@property (nullable, nonatomic, copy) NSString *contentLocalURL;
@property (nullable, nonatomic, copy) NSString *pictureWebURL;
@property (nullable, nonatomic, copy) NSString *contentWebURL;
@property (nullable, nonatomic, retain) UIImage *fullPicture;
@property (nullable, nonatomic, retain) UIImage *previewPicture;
@property (nullable, nonatomic, retain) NSData *content;

@end

NS_ASSUME_NONNULL_END
