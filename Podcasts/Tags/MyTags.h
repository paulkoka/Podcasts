//
//  MyTags.h
//  Podcasts
//
//  Created by Pavel Koka on 7/26/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTags : NSObject

@property(nonatomic, readonly) NSSet* setOfTags;

@property(nonatomic, readonly) NSString* item;
@property(nonatomic, readonly) NSString* title;
@property(nonatomic, readonly) NSString* author;
@property(nonatomic, readonly) NSString* guid;
@property(nonatomic, readonly) NSString* pubDate;
@property(nonatomic, readonly) NSString* duration;
@property(nonatomic, readonly) NSString* contentURL;
@property(nonatomic, readonly) NSString* imageURL;
@property(nonatomic, readonly) NSString* MysourceType;
@property(nonatomic, readonly) NSString* details;

-(id) init;

@end
