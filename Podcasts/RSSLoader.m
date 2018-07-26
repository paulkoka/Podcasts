//
//  RSSLoader.m
//  Podcasts
//
//  Created by Pavel Koka on 7/23/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "RSSLoader.h"

@interface RSSLoader()
@property (nonatomic) NSString* pathToRSSSoursFolder;
@property (nonatomic,readwrite) NSMutableArray* pathToRSSSourceFiles;
@property (nonatomic) CustomXMLParser* parser;
@end

@implementation RSSLoader

-(id) init{
    if ((self = [super init])) {
        _pathToRSSSourceFiles = [NSMutableArray array];
        _pathToRSSSoursFolder = [self createDirectoryForRSSmain];
        [self createDirectoryForRSSmain];
        [self startingRSSwithURL];
            }
    return self;
};


- (void) startingRSSwithURL{
    

   
    
    SourseURLforRead* urls = [[SourseURLforRead alloc] init];
    NSURLSessionConfiguration* myConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    myConfig.waitsForConnectivity = YES;
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    [queue setQualityOfService:NSQualityOfServiceUserInitiated];
    queue.maxConcurrentOperationCount = 5;
    
    
    NSURLSession* sessionForDownloadingRSS = [NSURLSession sessionWithConfiguration:myConfig delegate:self delegateQueue:queue];
  
    for (NSURL* url in urls.URLs) {
        NSURLSessionDownloadTask* task = [sessionForDownloadingRSS downloadTaskWithURL:url];
        [task resume];
    }
    
    [sessionForDownloadingRSS finishTasksAndInvalidate];

    
}

-(NSString*)createDirectoryForRSSmain{
    NSFileManager* filemanager = [NSFileManager defaultManager];
    NSString* pathToDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* path = [pathToDocuments stringByAppendingString:@"/rssMain"];

    BOOL isDirectory;
    if (![filemanager fileExistsAtPath:path isDirectory: &isDirectory]) {
        [filemanager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    return path;
}

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location {
    
    
        NSString *pathToFile = [self.pathToRSSSoursFolder stringByAppendingPathComponent:[location lastPathComponent]];
        [self.pathToRSSSourceFiles addObject:pathToFile];
    
        NSData* data = [NSData dataWithContentsOfURL:location];
        [data writeToFile:pathToFile atomically:YES];
    }

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    if (error) {
        NSLog(@"error: %@ - %@", task, error);
    } else {
        NSData* data = [NSData dataWithContentsOfFile:[self.pathToRSSSourceFiles lastObject]];
        
        self.parser = [[CustomXMLParser alloc] initWithDataAndParse:data];
 
        [self removeObjectFromPathToRSSSourceFiles:[self.pathToRSSSourceFiles lastObject]];

    }
}

-(void)removeObjectFromPathToRSSSourceFiles:(NSString*)path{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:path error:nil];
    [self.pathToRSSSourceFiles removeObject:path];
}

@end
