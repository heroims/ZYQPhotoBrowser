//
//  ZYQPhoto.h
//  ZYQPhotoBrowser
//
//  Created by Michael Waterfall on 17/10/2010.
//  Copyright 2010 d3i. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYQPhotoProtocol.h"
#ifdef NODEPENDENCY
#else
#import <SDWebImage/SDWebImageManager.h>
#endif

// This class models a photo/image and it's caption
// If you want to handle photos, caching, decompression
// yourself then you can simply ensure your custom data model
// conforms to ZYQPhotoProtocol
// Progress download block, used to update the progressView
typedef void (^ZYQProgressUpdateBlock)(CGFloat progress);

@interface ZYQPhoto : NSObject <ZYQPhoto>

// Properties
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSURL *photoURL;
@property (nonatomic, strong) ZYQProgressUpdateBlock progressUpdateBlock;
@property (nonatomic, strong) UIImage *placeholderImage;

// Class
+ (ZYQPhoto *)photoWithImage:(UIImage *)image;
+ (ZYQPhoto *)photoWithFilePath:(NSString *)path;
+ (ZYQPhoto *)photoWithURL:(NSURL *)url;

+ (NSArray *)photosWithImages:(NSArray *)imagesArray;
+ (NSArray *)photosWithFilePaths:(NSArray *)pathsArray;
+ (NSArray *)photosWithURLs:(NSArray *)urlsArray;

// Init
- (id)initWithImage:(UIImage *)image;
- (id)initWithFilePath:(NSString *)path;
- (id)initWithURL:(NSURL *)url;

@end

