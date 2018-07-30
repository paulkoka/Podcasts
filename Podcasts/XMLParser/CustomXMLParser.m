//
//  CustomXMLParser.m
//  Podcasts
//
//  Created by Pavel Koka on 7/24/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "CustomXMLParser.h"
#import "KPIItem+rSSItem.h"

int i = 0;

@interface CustomXMLParser()

@property (nonatomic) BOOL inItemElement;
@property (nonatomic) BOOL waitingForSourseName;
@property (nonatomic) NSMutableString *capturedCharacters;
@property (nonatomic) NSMutableString* currentSourceType;

@property (nonatomic)NSMutableDictionary* itemFromRSS;

@property (nonatomic) NSString* currentElementName;

@property (nonatomic) MyTags* tags;
@property(nonatomic) KPIItem* itemInCoreData;

@property(nonatomic) NSManagedObjectContext* context;


@end

@implementation CustomXMLParser

-(id) initWithDataAndParse:(NSData*) data withContext:(NSManagedObjectContext*)context {
    if ((self = [super init])) {
        _parser = [[NSXMLParser alloc] initWithData:data];
        _tags = [[MyTags alloc] init];
        _context = context;

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
    
    if ( !self.waitingForSourseName && !self.inItemElement && [elementName isEqualToString:self.tags.MysourceType]) {
        self.waitingForSourseName = YES;
        return;
    }
    
    if ([elementName isEqualToString:_tags.item]) {
        self.inItemElement = YES;
        self.itemFromRSS = [NSMutableDictionary dictionary];
        return;
    }
    
    if (self.inItemElement && [_tags.setOfTags containsObject:elementName])
                                    {
                                        
                                       self.capturedCharacters = [NSMutableString string];
                                        
                                        if ([elementName isEqualToString:_tags.imageURL]) {
                                            [self.itemFromRSS setObject:[attributeDict objectForKey:@"href"] forKey:elementName];
                                            return;
                                        }
                                        if ([elementName isEqualToString:_tags.contentURL]) {
                                            [self.itemFromRSS setObject: [attributeDict objectForKey:@"url"] forKey:elementName];
                                            return;
                                        }
                                        
                                        self.currentElementName = [NSString stringWithString:elementName];
                                        
                                    }
    }

-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock{
    if (self.inItemElement) {
        NSString* string = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
            if ([string containsString:@"<p>"] )
            {
            NSCharacterSet* set = [NSCharacterSet  characterSetWithCharactersInString:@"</p>"];
                
            string = [string stringByTrimmingCharactersInSet:set];
                
                NSRange range = [string rangeOfString:@"</p>"];
                
                if (NSNotFound != range.location) {
                    string = [string substringToIndex: (range.location)];
                }
                
                
        }
      [self.itemFromRSS setObject:string forKey:_tags.details];
    }

}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if (self.waitingForSourseName) {
        self.currentSourceType = [NSMutableString string];
        [self.currentSourceType  appendString:string];
        self.waitingForSourseName = NO;
    }
    
    if (self.capturedCharacters) {
        if ([self.currentElementName isEqualToString:_tags.pubDate]) {
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            
            formatter.dateFormat = @"E, dd MMM yyyy HH:mm:ss Z";
            
            NSDate *date = [formatter dateFromString:string];
            [self.itemFromRSS setObject:date forKey:_tags.pubDate];
            return;
        }
        [self.itemFromRSS setObject:string forKey:self.currentElementName];
     
        //[self.capturedCharacters appendString:string];
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if (self.inItemElement && [_tags.setOfTags containsObject:elementName])
    {
        if ([elementName isEqualToString:_tags.title]) {
            if ([self.capturedCharacters containsString:@" | "]) {
                NSRange range = [self.capturedCharacters rangeOfString:@" | "];
                if (NSNotFound != range.location) {
                    self.capturedCharacters = (NSMutableString*)[self.capturedCharacters substringToIndex:(range.location)];
                }
            }
        }
        
        self.capturedCharacters = nil;
        self.currentElementName = nil;
        
        }
            if ([elementName isEqualToString:@"item"]) {
                
                [self.itemFromRSS setObject:self.currentSourceType forKey:self.tags.MysourceType];
                
                self.itemInCoreData = [KPIItem itemWithRSSItem:self.itemFromRSS inManagedObjectContext:_context];
                            
                self.itemFromRSS = nil;
          
                self.inItemElement = NO;
    }
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"parserDidEndDocument");
}
@end
