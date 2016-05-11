//
//  BXQCropperVC.h
//  CropImage
//
//  Created by 英策网络科技 on 16/4/21.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BXQCropperVC;
@protocol BXQCropperDelegate <NSObject>
-(void)imageCropperController:(BXQCropperVC *)cropperViewController didFinished:(UIImage *)editedImage;
-(void)imageCropperControllerDidCancle:(BXQCropperVC *)cropperViewController;
@end
@interface BXQCropperVC : UIViewController
@property(nonatomic,weak)id<BXQCropperDelegate>delegate;
- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame;
@end
