//
//  KPIItem+addPicture.m
//  Podcasts
//
//  Created by Pavel Koka on 8/2/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "KPIItem+addPicture.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface KPIItem()  <NSURLSessionDownloadDelegate>

@end



@implementation KPIItem (addPicture)

- (void)awakeFromFetch
{
    [super awakeFromFetch];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString* localPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:self.pictureLocalURL];
    
    NSLog(@" before check exist?? %@", [fileManager fileExistsAtPath:localPath] ? @"YES" : @"NO" );
    
    if (![fileManager fileExistsAtPath:localPath]) {
        
        [self saveFileWithPath:localPath];
        
    } else {
        __weak typeof(self) weakself = self;
            weakself.fullPicture = [UIImage imageWithData:[NSData dataWithContentsOfFile:localPath] ];
            NSLog(@" picture?? %@", (self.fullPicture != nil) ? @"YES" : @"NO" );
    }
    
}

-(void)saveFileWithPath:(NSString*)localPath{
    NSLog(@"I CAN'T BE HERE" );

    __weak typeof(self) weakself = self;
    NSURLSessionDownloadTask* task = [[NSURLSession sharedSession] downloadTaskWithURL:[NSURL URLWithString:self.pictureWebURL] completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
            
            [weakself saveDataToDiskWithURL:location to:localPath];

        });
    }];
    [task resume];
}


-(void) saveDataToDiskWithURL:(NSURL*) location to:(NSString*) localPath{
    NSData* data = [NSData dataWithContentsOfURL:location];
    NSFileManager* filemanager = [NSFileManager defaultManager];
    [filemanager createFileAtPath:localPath contents:data attributes:nil];
}
@end

