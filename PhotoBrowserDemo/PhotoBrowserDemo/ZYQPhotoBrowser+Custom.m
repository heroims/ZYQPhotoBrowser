
//
//  ZYQPhotoBrowser+Custom.m
//  PhotoBrowserDemo
//
//  Created by admin on 2017/6/22.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ZYQPhotoBrowser+Custom.h"
#import "ZYQPhoto.h"
#import "ZYQZoomingScrollView.h"

#import "DACircularProgressView.h"
#import "YYWebImage.h"

@implementation ZYQPhotoBrowser (Custom)

@end

@interface ZYQPhoto (Custom)<ZYQPhotoCustomLoadProtocol>

@end

@implementation ZYQPhoto (Custom)

-(void)loadImageWithURL:(NSURL*)url updateProgressBlock:(void (^)(CGFloat progress))updateProgressBlock completedBlock:(void (^)(UIImage *image,NSError *error))completedBlock{
    [[YYWebImageManager sharedManager] requestImageWithURL:url options:YYWebImageOptionAllowBackgroundTask progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (updateProgressBlock) {
            updateProgressBlock(receivedSize/expectedSize*1.0);
        }
    } transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        if (completedBlock) {
            completedBlock(image,error);
        }
    }];
}

-(id)loadImageWithFile:(NSString *)path{
    return [YYImage imageWithContentsOfFile:path];
}

@end

@interface ZYQZoomingScrollView (Custom)<ZYQZoomingScrollViewCustomProtocol>

@end

@implementation ZYQZoomingScrollView (Custom)

-(id)getCustomProgressViewWithBrowser:(ZYQPhotoBrowser *)browser{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenBound.size.width;
    CGFloat screenHeight = screenBound.size.height;

    DACircularProgressView *tmpProgressView = [[DACircularProgressView alloc] initWithFrame:CGRectMake((screenWidth-35.)/2., (screenHeight-35.)/2, 35.0f, 35.0f)];
    [tmpProgressView setProgress:0.0f];
    tmpProgressView.tag = 101;
    tmpProgressView.thicknessRatio = 0.1;
    tmpProgressView.roundedCorners = NO;
    tmpProgressView.trackTintColor    = browser.trackTintColor    ? browser.trackTintColor    : [UIColor colorWithWhite:0.2 alpha:1];
    tmpProgressView.progressTintColor = browser.progressTintColor ? browser.progressTintColor : [UIColor colorWithWhite:1.0 alpha:1];
    
    _progressView=tmpProgressView;
    
    return tmpProgressView;
}

@end

@interface DACircularProgressView (Custom)<ZYQProgressViewProtocol>

@end

@implementation DACircularProgressView (Custom)

-(void)setZyq_progress:(CGFloat)zyq_progress{
    [self setProgress:zyq_progress animated:YES];
}

-(CGFloat)zyq_progress{
    return [self progress];
}

@end
