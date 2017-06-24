//
//  ViewController.m
//  PhotoBrowserDemo
//
//  Created by admin on 2017/6/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"

#import "ZYQPhotoBrowser.h"

#ifdef CUSTOM
#import "ZYQPhotoBrowser+Custom.h"
#import "YYWebImage.h"

@interface BackgroudBlurView : UIView

@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UIVisualEffectView *maskView;

@end

@implementation BackgroudBlurView

-(instancetype)init{
    if (self=[super init]) {
        [self addSubview:self.imgView];
        [self addSubview:self.maskView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imgView.frame=self.bounds;
    self.maskView.frame=self.bounds;
}

-(UIImageView *)imgView{
    if (_imgView==nil) {
        _imgView=[[UIImageView alloc] init];
    }
    return _imgView;
}

-(UIVisualEffectView *)maskView{
    if (_maskView==nil) {
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        
        _maskView = [[UIVisualEffectView alloc]initWithEffect:beffect];
    }
    return _maskView;
}

@end
#else
#endif

@interface ViewController ()<ZYQPhotoBrowserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#ifdef CUSTOM
    self.title=@"Custom";
#else
    self.title=@"Default";
#endif

    UIView *tableViewFooter=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 426 * 0.9 + 40)];

    UIButton *buttonWithImageOnScreen1=[[UIButton alloc] initWithFrame:CGRectMake(15, 0, 640/3 * 0.9, 426/2 * 0.9)];
    buttonWithImageOnScreen1.tag = 101;
    buttonWithImageOnScreen1.adjustsImageWhenHighlighted = false;
    [buttonWithImageOnScreen1 setImage:[UIImage imageNamed:@"photo1m.jpg"] forState:UIControlStateNormal];
    buttonWithImageOnScreen1.imageView.contentMode=UIViewContentModeScaleToFill;
    buttonWithImageOnScreen1.backgroundColor = [UIColor blackColor];
    [buttonWithImageOnScreen1 addTarget:self action:@selector(buttonWithImageOnScreenPressed:) forControlEvents:UIControlEventTouchUpInside];
    [tableViewFooter addSubview:buttonWithImageOnScreen1];
    

    UIButton *buttonWithImageOnScreen2=[[UIButton alloc] initWithFrame:CGRectMake(15, 426/2 * 0.9 + 20, 640/3 * 0.9, 426/2 * 0.9)];
    buttonWithImageOnScreen2.tag = 102;
    buttonWithImageOnScreen2.adjustsImageWhenHighlighted = false;
    [buttonWithImageOnScreen2 setImage:[UIImage imageNamed:@"photo3m.jpg"] forState:UIControlStateNormal];
    buttonWithImageOnScreen2.imageView.contentMode=UIViewContentModeScaleToFill;
    buttonWithImageOnScreen2.backgroundColor = [UIColor blackColor];
    [buttonWithImageOnScreen2 addTarget:self action:@selector(buttonWithImageOnScreenPressed:) forControlEvents:UIControlEventTouchUpInside];
    [tableViewFooter addSubview:buttonWithImageOnScreen2];
    
    self.tableView.tableFooterView = tableViewFooter;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonWithImageOnScreenPressed:(UIButton*)sender{
    NSMutableArray *photos=[[NSMutableArray alloc] init];
    
    ZYQPhoto *photo=nil;
    
    if (sender.tag==101) {
        NSString *path_photo1l=[[NSBundle mainBundle] pathForResource:@"photo1l" ofType:@"jpg"];
        
        photo=[[ZYQPhoto alloc] initWithFilePath:path_photo1l];
        photo.caption=@"Grotto of the Madonna";
        [photos addObject:photo];
    }
    
    

    NSString *path_photo3l=[[NSBundle mainBundle] pathForResource:@"photo3l" ofType:@"jpg"];
    
    photo=[[ZYQPhoto alloc] initWithFilePath:path_photo3l];
    photo.caption=@"York Floods";
    [photos addObject:photo];

    NSString *path_photo2l=[[NSBundle mainBundle] pathForResource:@"photo2l" ofType:@"jpg"];
    
    photo=[[ZYQPhoto alloc] initWithFilePath:path_photo2l];
    photo.caption=@"The London Eye is a giant Ferris wheel situated on the banks of the River Thames, in London, England.";
    [photos addObject:photo];
    
    NSString *path_photo4l=[[NSBundle mainBundle] pathForResource:@"photo4l" ofType:@"jpg"];
    
    photo=[[ZYQPhoto alloc] initWithFilePath:path_photo4l];
    photo.caption=@"Campervan";
    [photos addObject:photo];
    
    NSString *path_photo5l=[[NSBundle mainBundle] pathForResource:@"photo5l" ofType:@"gif"];
    
    photo=[[ZYQPhoto alloc] initWithFilePath:path_photo5l];
    photo.caption=@"Gif";
    [photos addObject:photo];

    if (sender.tag==102) {
        NSString *path_photo1l=[[NSBundle mainBundle] pathForResource:@"photo1l" ofType:@"jpg"];
        
        photo=[[ZYQPhoto alloc] initWithFilePath:path_photo1l];
        photo.caption=@"Grotto of the Madonna";
        [photos addObject:photo];

    }
    
    ZYQPhotoBrowser *browser=[[ZYQPhotoBrowser alloc] initWithPhotos:photos animatedFromView:sender];
    browser.delegate = self;
    browser.displayActionButton = false;
    browser.displayArrowButton = NO;
    browser.displayDoneButton=NO;
    browser.autoHideInterface=NO;
    browser.displayCounterLabel = true;
    browser.useZoomAnimation = true;
    browser.scaleImage = sender.currentImage;
    browser.dismissOnTouch = true;
    browser.displayTitle= YES;
    
    [self presentViewController:browser animated:YES completion:nil];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 3;
        case 2:
            return 0;
        default:
            return 0;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Single photo";
        case 1:
            return @"Multiple photos";
        case 2:
            return @"Photos on screen";
        default:
            return @"";
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if (indexPath.section==0) {
        cell.textLabel.text=@"Local photo";
    }
    else if (indexPath.section==1){
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text=@"Local photos";
                break;
            case 1:
                cell.textLabel.text=@"Photos from Baidu";
                break;
            case 2:
                cell.textLabel.text=@"Photos from Baidu - Custom";
                break;

            default:
                break;
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *photos=[[NSMutableArray alloc] init];
    
    ZYQPhoto *photo=nil;
    
    if (indexPath.section==0) {
        NSString *path_photo2l=[[NSBundle mainBundle] pathForResource:@"photo2l" ofType:@"jpg"];
        
        photo=[[ZYQPhoto alloc] initWithFilePath:path_photo2l];
        photo.caption=@"The London Eye is a giant Ferris wheel situated on the banks of the River Thames, in London, England.";
        [photos addObject:photo];
    }
    else if(indexPath.section==1){
        if (indexPath.row==0) {
            NSString *path_photo1l=[[NSBundle mainBundle] pathForResource:@"photo1l" ofType:@"jpg"];
            
            photo=[[ZYQPhoto alloc] initWithFilePath:path_photo1l];
            photo.caption=@"Grotto of the Madonna";
            [photos addObject:photo];

            NSString *path_photo2l=[[NSBundle mainBundle] pathForResource:@"photo2l" ofType:@"jpg"];
            
            photo=[[ZYQPhoto alloc] initWithFilePath:path_photo2l];
            photo.caption=@"The London Eye is a giant Ferris wheel situated on the banks of the River Thames, in London, England.";
            [photos addObject:photo];

            NSString *path_photo3l=[[NSBundle mainBundle] pathForResource:@"photo3l" ofType:@"jpg"];
            
            photo=[[ZYQPhoto alloc] initWithFilePath:path_photo3l];
            photo.caption=@"York Floods";
            [photos addObject:photo];

            NSString *path_photo4l=[[NSBundle mainBundle] pathForResource:@"photo4l" ofType:@"jpg"];
            
            photo=[[ZYQPhoto alloc] initWithFilePath:path_photo4l];
            photo.caption=@"Campervan";
            [photos addObject:photo];
            
            NSString *path_photo5l=[[NSBundle mainBundle] pathForResource:@"photo5l" ofType:@"gif"];
            
            photo=[[ZYQPhoto alloc] initWithFilePath:path_photo5l];
            photo.caption=@"Gif";
            [photos addObject:photo];

        }
        else if(indexPath.row==1||indexPath.row==2){
            NSArray *photosWithURLArray=@[
                                          [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1498113175410&di=bd10bcd2b2a45906259f4e823bbf9df6&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F27%2F45%2F71r58PICmDM_1024.jpg"]
                                          ,[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1498113236506&di=004225eba24d74087feaeaa9484db047&imgtype=0&src=http%3A%2F%2Fic.topit.me%2Fc%2F3c%2Ff6%2F1110230348da8f63cco.jpg"]
                                          ,[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1498103182&di=eb660bada9ced24acbc9153464aaedcd&src=http://www.bz55.com/uploads/allimg/141120/139-141120151946.jpg"]
                                          ,[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1498139264538&di=6e5cedbfecc6a0e4bce2fc0005f56785&imgtype=0&src=http%3A%2F%2Fimg3.a0bi.com%2Fupload%2Fttq%2F20140719%2F1405761279700.gif"]
                                          ];
            
            NSArray *photosWithURL=[ZYQPhoto photosWithURLs:photosWithURLArray];
            photos=[NSMutableArray arrayWithArray:photosWithURL];
            
        }
    }
    
    ZYQPhotoBrowser *browser=[[ZYQPhotoBrowser alloc] initWithPhotos:photos];
    browser.delegate=self;
    if (indexPath.section==1) {
        if (indexPath.row==1) {
            browser.displayCounterLabel = true;
            browser.displayActionButton = false;
        }
        else if (indexPath.row==2){
            browser.actionButtonTitles      = @[@"Option 1", @"Option 2", @"Option 3", @"Option 4"];
            browser.displayCounterLabel     = true;
            browser.useWhiteBackgroundColor = true;
            browser.leftArrowImage          = [UIImage imageNamed:@"PhotoBrowser_customArrowLeft"];
            browser.rightArrowImage         = [UIImage imageNamed:@"PhotoBrowser_customArrowRight"];
            browser.leftArrowSelectedImage  = [UIImage imageNamed:@"PhotoBrowser_customArrowLeftSelected"];
            browser.rightArrowSelectedImage = [UIImage imageNamed:@"PhotoBrowser_customArrowRightSelected"];
            browser.doneButtonImage         = [UIImage imageNamed:@"PhotoBrowser_customDoneButton"];
            browser.view.tintColor          = [UIColor orangeColor];
            browser.progressTintColor       = [UIColor orangeColor];
            browser.trackTintColor          = [UIColor colorWithWhite:0.8 alpha:1];
        }
        else{
            browser.displayToolbar=NO;
        }
    }
#ifdef CUSTOM
    browser.customBackgroud=[[BackgroudBlurView alloc] init];
    browser.gifSupportImageViewClass=[YYAnimatedImageView class];
#else
#endif
    [self presentViewController:browser animated:YES completion:nil];
    
}

-(void)photoBrowser:(ZYQPhotoBrowser *)photoBrowser didShowPhotoAtIndex:(NSUInteger)index{
    ZYQPhoto *photo=[photoBrowser photoAtIndex:index];
#ifdef CUSTOM
    BackgroudBlurView *blurView=(BackgroudBlurView*)photoBrowser.customBackgroud;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (photo.underlyingImage) {
            blurView.imgView.image=photo.underlyingImage;
        }
        else{
            [blurView.imgView yy_setImageWithURL:photo.photoURL options:YYWebImageOptionAllowBackgroundTask];
        }
    });
#else
#endif

    NSLog(@"Did show photoBrowser with photo index: %zi, photo caption: %@",index,photo.caption);
}

-(void)photoBrowser:(ZYQPhotoBrowser *)photoBrowser willDismissAtPageIndex:(NSUInteger)index{
    ZYQPhoto *photo=[photoBrowser photoAtIndex:index];
    NSLog(@"Did show photoBrowser with photo index: %zi, photo caption: %@",index,photo.caption);
}

-(void)photoBrowser:(ZYQPhotoBrowser *)photoBrowser didDismissAtPageIndex:(NSUInteger)index{
    ZYQPhoto *photo=[photoBrowser photoAtIndex:index];
    NSLog(@"Did show photoBrowser with photo index: %zi, photo caption: %@",index,photo.caption);
}

-(void)photoBrowser:(ZYQPhotoBrowser *)photoBrowser didDismissActionSheetWithButtonIndex:(NSUInteger)buttonIndex photoIndex:(NSUInteger)photoIndex{
    ZYQPhoto *photo=[photoBrowser photoAtIndex:buttonIndex];
    NSLog(@"Did show photoBrowser with photo index: %zi, photo caption: %@",buttonIndex,photo.caption);

}

@end
