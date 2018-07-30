//
//  MyTags.m
//  Podcasts
//
//  Created by Pavel Koka on 7/26/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "MyTags.h"


static NSString* item = @"item";

static NSString* title = @"title";
static NSString* author = @"itunes:author";
static NSString* guid = @"guid";
static NSString* pubDate = @"pubDate";
static NSString* duration = @"itunes:duration";
static NSString* contentURL = @"enclosure";
static NSString* imageURL = @"itunes:image";

static NSString* details = @"details";


static NSString* MysourceType = @"copyright";



@implementation MyTags

-(id)init{
    if (self = [super init]) {
        _item = item;
        _title = title;
        _author = author;
        _guid = guid;
        _pubDate = pubDate;
        _duration = duration;
        _contentURL = contentURL;
        _imageURL = imageURL;
        _MysourceType = MysourceType;
        _details = details;
        _setOfTags = [NSSet setWithObjects:title, author, guid, pubDate, duration, contentURL, imageURL, nil];
    }
    return  self;
}

@end
