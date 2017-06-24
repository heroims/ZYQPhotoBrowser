//
//  ZYQTapDetectingImageView.m
//  ZYQPhotoBrowser
//
//  Created by Michael Waterfall on 04/11/2009.
//  Copyright 2009 d3i. All rights reserved.
//

#import "ZYQTapDetectingImageView.h"
#import <objc/runtime.h>

#ifdef NODEPENDENCY
#else
#import "UIImage+GIF.h"
#import "FLAnimatedImage.h"
#endif

@implementation ZYQTapDetectingImageView

#ifdef NODEPENDENCY
#else
-(void)setImage:(UIImage *)image{
    if (![image isKindOfClass:[UIImage class]]||image.isGIF) {
        NSLog(@"Gif");
        self.animatedImage=(FLAnimatedImage*)image;
    }
    else{
        [super setImage:image];
    }
}
#endif

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	NSUInteger tapCount = touch.tapCount;
	switch (tapCount) {
		case 1:
			[self handleSingleTap:touch];
			break;
		case 2:
			[self handleDoubleTap:touch];
			break;
		case 3:
			[self handleTripleTap:touch];
			break;
		default:
			break;
	}
	[[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)handleSingleTap:(UITouch *)touch {
	if ([self.tapDelegate respondsToSelector:@selector(imageView:singleTapDetected:)])
		[self.tapDelegate imageView:self singleTapDetected:touch];
}

- (void)handleDoubleTap:(UITouch *)touch {
	if ([self.tapDelegate respondsToSelector:@selector(imageView:doubleTapDetected:)])
		[self.tapDelegate imageView:self doubleTapDetected:touch];
}

- (void)handleTripleTap:(UITouch *)touch {
	if ([self.tapDelegate respondsToSelector:@selector(imageView:tripleTapDetected:)])
		[self.tapDelegate imageView:self tripleTapDetected:touch];
}

-(void)setTapDelegate:(id<ZYQTapDetectingImageViewDelegate>)tapDelegate{
    objc_setAssociatedObject(self, @selector(tapDelegate), tapDelegate, OBJC_ASSOCIATION_ASSIGN);

    self.userInteractionEnabled=YES;
}

-(id<ZYQTapDetectingImageViewDelegate>)tapDelegate{
    return objc_getAssociatedObject(self, @selector(tapDelegate));
}

@end
