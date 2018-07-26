//
//  SourseURLforRead.m
//  Podcasts
//
//  Created by Pavel Koka on 7/23/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "SourseURLforRead.h"
static NSString* tedtalks_videoString = @"https://feeds.feedburner.com/tedtalks_video";
static NSString* HanselminutesCompleteMP3String = @"https://rss.simplecast.com/podcasts/4669/rss";

@interface SourseURLforRead()
@property (nonatomic, readwrite) NSArray* URLs;
@end

@implementation SourseURLforRead

-(id) init{
    if (self = [super init]) {
        NSURL* tedtalks_videoURL = [NSURL URLWithString:tedtalks_videoString];
        NSURL* HanselminutesCompleteMP3URL = [NSURL URLWithString: HanselminutesCompleteMP3String];
        
        _URLs = @[tedtalks_videoURL, HanselminutesCompleteMP3URL];
    }
    return self;
}

@end
