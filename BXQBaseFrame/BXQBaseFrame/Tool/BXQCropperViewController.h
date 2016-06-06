//
//  BXQCropperViewController.h
//  BXQBaseFrame
//
//  Created by 英策网络科技 on 16/5/21.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BXQCropperViewController;
@protocol BXQCropperDelgate<NSObject>
- (void)imageCropper:(BXQCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage;
- (void)imageCropperDidCancel:(BXQCropperViewController *)cropperViewController;
@end
@interface BXQCropperViewController : UIViewController
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) id<BXQCropperDelgate> delegate;
@property (nonatomic, assign) CGRect cropFrame;

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio;
@end
