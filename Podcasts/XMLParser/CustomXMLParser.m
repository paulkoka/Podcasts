//
//  CustomXMLParser.m
//  Podcasts
//
//  Created by Pavel Koka on 7/24/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "CustomXMLParser.h"

static NSString* item = @"item";
static NSString* title = @"title";
static NSString* author = @"itunes:author";
static NSString* guid = @"guid";
static NSString* pubDate = @"pubDate";
static NSString* duration = @"itunes:duration";
static NSString* content = @"enclosure";
static NSString* image = @"itunes:image";
static NSString* MysourceType = @"copyright";

int count = 0;

@interface CustomXMLParser()

@property (nonatomic) BOOL inItemElement;
@property (nonatomic) BOOL waitingForSourseName;
@property (nonatomic) NSMutableString *capturedCharacters;
@property (nonatomic) NSMutableString* currentSourceType;

@end

@implementation CustomXMLParser

-(id) initWithDataAndParse:(NSData*) data{
    if ((self = [super init])) {
        _parser = [[NSXMLParser alloc] initWithData:data];
        [self parseXML];
    }
    return self;
}

-(void) parseXML{
    [_parser setDelegate:self];
    
    if (![self.parser parse])
    {
        NSLog (@"An error occurred in the parsing");
    }
}

-(void) parserDidStartDocument:(NSXMLParser *)parser{
    NSLog (@"parserDidStartDocument");
    self.inItemElement = NO;
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    if ( !self.waitingForSourseName && !self.inItemElement && [elementName isEqualToString:MysourceType]) {
        self.waitingForSourseName = YES;
    }
    
    if ([elementName isEqualToString:item]) {
        self.inItemElement = YES;
    }
    
    if (self.inItemElement &&
        ([elementName isEqualToString:title]   || [elementName isEqualToString:author]  ||
         [elementName isEqualToString:guid]    || [elementName isEqualToString:pubDate] ||
         [elementName isEqualToString:duration]|| [elementName isEqualToString:content] ||
         [elementName isEqualToString:image]))
                                    {
                                       self.capturedCharacters = [NSMutableString string];
                                    }
    }

-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock{
    if (self.inItemElement) {
        NSString* string = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
            if ([string containsString:@"<p>"] ) {
            NSCharacterSet* set = [NSCharacterSet  characterSetWithCharactersInString:@"</p>"];
            string = [string stringByTrimmingCharactersInSet:set];
                NSRange range = [string rangeOfString:@"</p>"];
                if (NSNotFound != range.location) {
                    string = [string substringToIndex: (range.location)];
                }
        }
    }

}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if (self.waitingForSourseName) {
        self.currentSourceType = [NSMutableString string];
        [self.currentSourceType  appendString:string];
        self.waitingForSourseName = NO;
    }
    
    if (self.capturedCharacters) {

        [self.capturedCharacters appendString:string];
    }
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if (self.inItemElement &&
        ([elementName isEqualToString:title]   || [elementName isEqualToString:author]  ||
         [elementName isEqualToString:guid]    || [elementName isEqualToString:pubDate] ||
         [elementName isEqualToString:duration]|| [elementName isEqualToString:content] ||
         [elementName isEqualToString:image]))
    {
        if ([elementName isEqualToString:title]) {
            if ([self.capturedCharacters containsString:@" | "]) {
                NSRange range = [self.capturedCharacters rangeOfString:@" | "];
                if (NSNotFound != range.location) {
                    self.capturedCharacters = (NSMutableString*)[self.capturedCharacters substringToIndex:(range.location)];
                }
            }
        }
        self.capturedCharacters = nil;
       
        }
            if ([elementName isEqualToString:@"item"]) {
                self.inItemElement = NO;
    }
}


@end
