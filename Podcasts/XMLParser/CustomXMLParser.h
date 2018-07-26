//
//  CustomXMLParser.h
//  Podcasts
//
//  Created by Pavel Koka on 7/24/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CustomXMLParser : NSObject <NSXMLParserDelegate>

@property (nonatomic) NSXMLParser* parser;

-(id) initWithDataAndParse:(NSData*) data;


@end
