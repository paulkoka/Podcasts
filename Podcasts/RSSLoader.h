//
//  RSSLoader.h
//  Podcasts
//
//  Created by Pavel Koka on 7/23/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourseURLforRead.h"
#import "CustomXMLParser.h"

@interface RSSLoader : NSObject <NSURLSessionDownloadDelegate>

-(id) init;

@end
