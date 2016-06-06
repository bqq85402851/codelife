//
//  BXQViewFactory.m
//  BXQBaseFrame
//
//  Created by 英策网络科技 on 16/5/23.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "BXQViewFactory.h"

@implementation BXQViewFactory
+(BXQViewFactory*)shared{
    static BXQViewFactory*bxq=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bxq=[[BXQViewFactory alloc]init];
    });
    return bxq;
}
+(UIButton*)createButtonWithFrame:(CGRect)frame buttonState:(UIButtonType)type{
    UIButton*button=[UIButton buttonWithType:type];
    button.frame=frame;
    return button;
}
+(UIButton*)createButtonWithFrame:(CGRect)frame buttonType:(UIButtonType)type setTitle:(NSString*)title forNormalStateTitleColor:(UIColor*)nColor forSelectedStateTitleColor:(UIColor*)sColor withBackGroundColor:(UIColor*)bColor withBackImage:(UIImage*)bImage withTarget:(id)target Selector:(SEL)selector forControlEvent:(UIControlEvents)controlEvent{
    UIButton*button=[BXQViewFactory createButtonWithFrame:frame buttonState:type];
    button.titleLabel.numberOfLines=0;
    [button setTitle:title forState:UIControlStateNormal];
    if (nColor) {
        [button setTitleColor:nColor forState:UIControlStateNormal];
    }
    if (sColor) {
        [button setTitleColor:sColor forState:UIControlStateSelected];
    }
    if (bColor) {
        [button setBackgroundColor:bColor];
    }
    if (bImage) {
        [button setBackgroundImage:bImage forState:UIControlStateNormal];
    }
    if (target&&selector) {
        [button addTarget:target action:selector forControlEvents:controlEvent];
    }
    return button;
}
+(UIButton*)createButtonWithFrame:(CGRect)frame buttonType:(UIButtonType)type setNormalImage:(UIImage*)nImage setSelectedImage:(UIImage*)sImage withTarget:(id)target Selector:(SEL)selector forControlEvent:(UIControlEvents)controlEvent{
    UIButton*button=[self createButtonWithFrame:frame buttonState:type];
    [button setImage:nImage forState:UIControlStateNormal];
    [button setImage:sImage forState:UIControlStateSelected];
    if (target&&selector) {
        [button addTarget:self action:selector forControlEvents:controlEvent];
    }
    return button;
}
+(UILabel*)createLableWithFrame:(CGRect)frame setText:(NSString*)text withTextColor:(UIColor*)textColor TextAlignment:(NSTextAlignment)alignment withTextFont:(UIFont*)font backGroundColor:(UIColor*)bColor{
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    if (textColor) {
        label.textColor=textColor;
    }
    if (alignment) {
        label.textAlignment=alignment;
    }
    if (font) {
        label.font=font;
    }
    if (bColor) {
        label.backgroundColor=bColor;
    }
    return label;
}
+(UIView*)createGradientLabelWithFrame:(CGRect)frame setText:(NSString*)text withTextFont:(UIFont*)font textColor:(UIColor*)tColor sliderColor:(UIColor*)sColor backColor:(UIColor*)bColor{
    UIView*backView=[[UIView alloc]initWithFrame:frame];
    
    CAGradientLayer*gradientLayer=[CAGradientLayer layer];
    gradientLayer.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);
    gradientLayer.colors=@[(id)bColor.CGColor,(id)sColor.CGColor,(id)bColor.CGColor];
    gradientLayer.startPoint=CGPointMake(0, 0.5);
    gradientLayer.endPoint=CGPointMake(1, 0.5);
    gradientLayer.locations=@[[NSNumber numberWithFloat:0.2],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.8]];
    [backView.layer addSublayer:gradientLayer];
    
    UILabel*label=[[UILabel alloc]initWithFrame:gradientLayer.bounds];
    label.text=text;
    if (font) {
        label.font=font;
    }
    if (tColor) {
        label.textColor=tColor;
    }
    label.textAlignment=NSTextAlignmentCenter;
    [backView addSubview:label];
    
    CABasicAnimation*gradient=[CABasicAnimation animationWithKeyPath:@"locations"];
    gradient.fromValue=@[[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0.25]];
    gradient.toValue=@[[NSNumber numberWithFloat:0.75],[NSNumber numberWithFloat:1],[NSNumber numberWithFloat:1]];
    gradient.duration=2.5;
    gradient.repeatCount=HUGE;
    [gradientLayer addAnimation:gradient forKey:nil];
    
    gradientLayer.mask=label.layer;
    
    return backView;
}
+(UIImageView*)createImageViewWithFrame:(CGRect)frame setImage:(UIImage*)image{
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=image;
    imageView.userInteractionEnabled=YES;
    return imageView;
}
+(UITextField*)createTextFieldWithFrame:(CGRect)frame setText:(NSString*)text placeholder:(NSString*)placeholderStr textColor:(UIColor*)tColor TextAlignment:(NSTextAlignment)alignment withTextFont:(UIFont*)font{
    UITextField*textField=[[UITextField alloc]initWithFrame:frame];
    if (text) {
        textField.text=text;
    }
    if (placeholderStr) {
        textField.placeholder=placeholderStr;
    }
    if (tColor) {
        textField.textColor=tColor;
    }
    if (alignment) {
        textField.textAlignment=alignment;
    }
    if (font) {
        textField.font=font;
    }
    return textField;
}
+(UITextField*)createTextFieldWithFrame:(CGRect)frame withSubView:(UIView*)subView offsetX:(CGFloat)X leftOrRightViewType:(UITextFieldViewType)type setText:(NSString *)text placeholder:(NSString *)placeholderStr textColor:(UIColor *)tColor TextAlignment:(NSTextAlignment)alignment withTextFont:(UIFont *)font{
    CustomTextField*field=nil;
    if (type==UITextFieldLeftViewType) {
        field=[[CustomTextField alloc]initWithFrame:frame withLeftView:subView offsetX:X];
    }else if (type==UITextFieldRightViewType){
        field=[[CustomTextField alloc]initWithFrame:frame withRightView:subView offsetX:X];
    }
    if (text) {
        field.text=text;
    }
    if (placeholderStr) {
        field.placeholder=placeholderStr;
    }
    if (tColor) {
        field.textColor=tColor;
    }
    if (alignment) {
        field.textAlignment=alignment;
    }
    if (font) {
        field.font=font;
    }
    return field;
}
@end

@interface CustomTextField ()
{
    CGFloat LoffsetX;
    CGFloat RoffsetX;
}
@end
@implementation CustomTextField
-(instancetype)initWithFrame:(CGRect)frame withLeftView:(UIView *)leftView offsetX:(CGFloat)X{
    if (self=[super initWithFrame:frame]) {
        LoffsetX=X;
        self.leftView=leftView;
        self.leftViewMode=UITextFieldViewModeAlways;
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame withRightView:(UIView *)rightView offsetX:(CGFloat)X{
    if (self=[super initWithFrame:frame]) {
        RoffsetX=X;
        self.rightView=rightView;
        self.rightViewMode=UITextFieldViewModeAlways;
    }
    return self;
}
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect iconRect=[super placeholderRectForBounds:bounds];
    if (LoffsetX) {
        iconRect.origin.x+=LoffsetX;
    }
    if (RoffsetX) {
        iconRect.origin.x-=RoffsetX;
    }
    return iconRect;
}
-(CGRect)textRectForBounds:(CGRect)bounds{
    CGRect iconRect=[super textRectForBounds:bounds];
    if (LoffsetX) {
        iconRect.origin.x+=LoffsetX;
    }
    if (RoffsetX) {
        iconRect.origin.x-=RoffsetX;
    }
    return iconRect;
}
-(CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect iconRect=[super editingRectForBounds:bounds];
    if (LoffsetX) {
        iconRect.origin.x+=LoffsetX;
    }
    if (RoffsetX) {
        iconRect.origin.x-=RoffsetX;
    }
    return iconRect;
}
-(CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect iconRect=[super leftViewRectForBounds:bounds];
    if (LoffsetX) {
       iconRect.origin.x+=LoffsetX;
    }
    return iconRect;
}
-(CGRect)rightViewRectForBounds:(CGRect)bounds{
    CGRect iconRect=[super rightViewRectForBounds:bounds];
    if (RoffsetX) {
       iconRect.origin.x-=RoffsetX;
    }
    return iconRect;
}
@end