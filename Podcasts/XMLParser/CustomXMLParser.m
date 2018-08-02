//
//  CustomXMLParser.m
//  Podcasts
//
//  Created by Pavel Koka on 7/24/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "CustomXMLParser.h"
#import "KPIItem+rSSItem.h"
#import "NSDate+dateWithStringFromRSS.h"
 #import "NSString+trimmingOfDataFromRss.h"


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
                                        self.currentElementName = [NSString stringWithString:elementName];
                                        
                                        if ([elementName isEqualToString:_tags.imageURL]) {
                                            [self.itemFromRSS setObject:[attributeDict objectForKey:@"href"] forKey:elementName];
                                            return;
                                        }
                                        if ([elementName isEqualToString:_tags.contentURL]) {
                                            [self.itemFromRSS setObject: [attributeDict objectForKey:@"url"] forKey:elementName];
                                            return;
                                        }

                                    }
    }

-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock{
    if (self.inItemElement) {
        NSString* string = [NSString trimmingOfDataFromRss:CDATABlock];
        [self.itemFromRSS setObject:string forKey:_tags.details];
    }

}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if (self.waitingForSourseName) {
        self.currentSourceType = [NSMutableString string];
        [self.currentSourceType  appendString:string];
        self.waitingForSourseName = NO;
    }
    
    if (self.inItemElement && self.capturedCharacters) {
        [self.capturedCharacters appendString:string];
        
        if ([self.currentElementName isEqualToString:_tags.pubDate]) {

            NSDate *date = [NSDate dateWithStringFromRSS:string];
            
            [self.itemFromRSS setObject:date forKey:_tags.pubDate];
            return;
        }
        
        string = [self preapreforSaving:string];
        
        [self.itemFromRSS setObject:string forKey:self.currentElementName];
    }
}

-(NSString*)preapreforSaving:(NSString*)string{
    if ([self.currentElementName isEqualToString:_tags.title]) {       
        if ([self.capturedCharacters containsString:@" | "]) {
            NSRange range = [string rangeOfString:@" | "];
            if (NSNotFound != range.location) {
                string = [string substringToIndex:(range.location)];
            }
        }
    }
    return string;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if (self.inItemElement && [_tags.setOfTags containsObject:elementName])
    {
      
        self.capturedCharacters = nil;
        self.currentElementName = nil;
        
        }
            if ([elementName isEqualToString:@"item"]) {
                [self saveElement];
    }
}

-(void)saveElement{
    [self.itemFromRSS setObject:self.currentSourceType forKey:self.tags.MysourceType];
    
    self.itemInCoreData = [KPIItem itemWithRSSItem:self.itemFromRSS inManagedObjectContext:_context];
    self.
    self.itemFromRSS = nil;
    
    self.inItemElement = NO;
}

-(void) parserDidEndDocument:(NSXMLParser *)parser{

}
@end
