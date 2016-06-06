/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

/**
 'UIViewExt' 继承View，提供几个方法，能够比较方便的得到各种控件坐标、大小等。
 */

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

/**
 *  加载图片附加渐出效果
 */
@property NSNumber*isAddimage;
-(void)bxq_setImageView:(NSString*)imgUrl placeholderImage:(UIImage*)placeholderImage;
-(void)bxq_setButtonImage:(NSString*)imgUrl forState:(UIControlState)state placeholderImage:(UIImage*)placeholderImage;

/**
 *  图片合成
 */
-(UIImage*)synthesizerForView:(UIView*)synthesizerView forSize:(CGSize)size;

@end