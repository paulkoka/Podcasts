//
//  KPIPicture+CoreDataProperties.h
//  Podcasts
//
//  Created by Pavel Koka on 8/2/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//
//

#import "KPIPicture+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface KPIPicture (CoreDataProperties)

+ (NSFetchRequest<KPIPicture *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *localURL;
@property (nullable, nonatomic, copy) NSString *webURL;
@property (nullable, nonatomic, copy) NSString *picturePreview;
@property (nullable, nonatomic, retain) KPIItem *urlForItemPicture;

@end

NS_ASSUME_NONNULL_END
