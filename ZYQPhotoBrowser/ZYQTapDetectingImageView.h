//
//  ZYQTapDetectingImageView.h
//  ZYQPhotoBrowser
//
//  Created by Michael Waterfall on 04/11/2009.
//  Copyright 2009 d3i. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZYQTapDetectingImageViewDelegate;
#ifdef NODEPENDENCY
@interface ZYQTapDetectingImageView : UIImageView
#else
#import "FLAnimatedImageView.h"
@interface ZYQTapDetectingImageView : FLAnimatedImageView
#endif

@property (nonatomic, weak) id <ZYQTapDetectingImageViewDelegate> tapDelegate;
- (void)handleSingleTap:(UITouch *)touch;
- (void)handleDoubleTap:(UITouch *)touch;
- (void)handleTripleTap:(UITouch *)touch;
@end

@protocol ZYQTapDetectingImageViewDelegate <NSObject>
@optional
- (void)imageView:(UIImageView *)imageView singleTapDetected:(UITouch *)touch;
- (void)imageView:(UIImageView *)imageView doubleTapDetected:(UITouch *)touch;
- (void)imageView:(UIImageView *)imageView tripleTapDetected:(UITouch *)touch;
@end
