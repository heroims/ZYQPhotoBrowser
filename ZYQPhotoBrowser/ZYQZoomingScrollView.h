//
//  ZYQZoomingScrollView.h
//  ZYQPhotoBrowser
//
//  Created by Michael Waterfall on 14/10/2010.
//  Copyright 2010 d3i. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYQPhotoProtocol.h"
#import "ZYQTapDetectingImageView.h"
#import "ZYQTapDetectingView.h"

#ifdef NODEPENDENCY
#else
#import <DACircularProgress/DACircularProgressView.h>
#endif

@class ZYQPhotoBrowser, ZYQPhoto, ZYQCaptionView;

@interface ZYQZoomingScrollView : UIScrollView <UIScrollViewDelegate, ZYQTapDetectingImageViewDelegate, ZYQTapDetectingViewDelegate> {
	
	ZYQPhotoBrowser *__weak _photoBrowser;
    id<ZYQPhoto> _photo;
	
    // This view references the related caption view for simplified handling in photo browser
    ZYQCaptionView *_captionView;
    
	ZYQTapDetectingView *_tapView; // for background taps
    
    UIView *_progressView;
}

@property (nonatomic, strong) ZYQTapDetectingImageView *photoImageView;
@property (nonatomic, strong) ZYQCaptionView *captionView;
@property (nonatomic, strong) id<ZYQPhoto> photo;
@property (nonatomic) CGFloat maximumDoubleTapZoomScale;

- (id)initWithPhotoBrowser:(ZYQPhotoBrowser *)browser;
- (void)displayImage;
- (void)displayImageFailure;
- (void)setProgress:(CGFloat)progress forPhoto:(ZYQPhoto*)photo;
- (void)setMaxMinZoomScalesForCurrentBounds;
- (void)prepareForReuse;

@end
