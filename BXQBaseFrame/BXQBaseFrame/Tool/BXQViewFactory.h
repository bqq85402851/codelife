//
//  BXQViewFactory.h
//  BXQBaseFrame
//
//  Created by 英策网络科技 on 16/5/23.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 自定义textfield自带左视图还是右视图
 */
typedef enum {
    UITextFieldLeftViewType,
    UITextFieldRightViewType
}UITextFieldViewType;

@interface BXQViewFactory : UIView
/**
 *  视图工厂
 */
+(BXQViewFactory*)shared;

/**
 *  Button
 */
+(UIButton*)createButtonWithFrame:(CGRect)frame buttonType:(UIButtonType)type setTitle:(NSString*)title forNormalStateTitleColor:(UIColor*)nColor forSelectedStateTitleColor:(UIColor*)sColor withBackGroundColor:(UIColor*)bColor withBackImage:(UIImage*)bImage withTarget:(id)target Selector:(SEL)selector forControlEvent:(UIControlEvents)controlEvent;
+(UIButton*)createButtonWithFrame:(CGRect)frame buttonType:(UIButtonType)type setNormalImage:(UIImage*)nImage setSelectedImage:(UIImage*)sImage withTarget:(id)target Selector:(SEL)selector forControlEvent:(UIControlEvents)controlEvent;

/**
 *  UILable
 */
+(UILabel*)createLableWithFrame:(CGRect)frame setText:(NSString*)text withTextColor:(UIColor*)textColor TextAlignment:(NSTextAlignment)alignment withTextFont:(UIFont*)font backGroundColor:(UIColor*)bColor;
/**
 *  类似滑动解锁的动画
 *
 *  @param frame
 *  @param text
 *  @param sColor 滑动的颜色
 *  @param bColor 背景色
 *  @param tColor 字体颜色
 *  @param font   字体
 *
 *  @return
 */
+(UIView*)createGradientLabelWithFrame:(CGRect)frame setText:(NSString*)text withTextFont:(UIFont*)font textColor:(UIColor*)tColor sliderColor:(UIColor*)sColor backColor:(UIColor*)bColor;
/**
 *  UIImageView
 */
+(UIImageView*)createImageViewWithFrame:(CGRect)frame setImage:(UIImage*)image;
/**
 *  UITextField
 */
+(UITextField*)createTextFieldWithFrame:(CGRect)frame setText:(NSString*)text placeholder:(NSString*)placeholderStr textColor:(UIColor*)tColor TextAlignment:(NSTextAlignment)alignment withTextFont:(UIFont*)font;
/**
 *  自带左视图或者右视图的输入框
 *
 *  @param frame
 *  @param subView        传入左视图或者右视图
 *  @param X              视图偏移量
 *  @param type           表示设置左视图还是右视图
 *  @param text
 *  @param placeholderStr
 *  @param tColor
 *  @param alignment
 *  @param font
 *
 *  @return 
 */
+(UITextField*)createTextFieldWithFrame:(CGRect)frame withSubView:(UIView*)subView offsetX:(CGFloat)X leftOrRightViewType:(UITextFieldViewType)type setText:(NSString *)text placeholder:(NSString *)placeholderStr textColor:(UIColor *)tColor TextAlignment:(NSTextAlignment)alignment withTextFont:(UIFont *)font;
@end

@interface CustomTextField : UITextField
-(instancetype)initWithFrame:(CGRect)frame withLeftView:(UIView*)leftView offsetX:(CGFloat)X;
-(instancetype)initWithFrame:(CGRect)frame withRightView:(UIView *)rightView offsetX:(CGFloat)X;
@end