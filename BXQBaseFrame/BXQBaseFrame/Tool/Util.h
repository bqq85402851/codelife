//
//  Util.h
//  mlh
//
//  Created by qd on 13-5-10.
//  Copyright (c) 2013年 sunday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Util : NSObject

//字符串转颜色
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;

//去掉空格
+(NSString *) stringByRemoveTrim:(NSString *)str;

//不转webview打不开啊。。
+(NSString *)getWebViewUrlStr:(NSString *)urlStr;

//NSString UTF8转码
+(NSString *)getUTF8Str:(NSString *)str;

//根据文字、字体、文字区域宽度，得到文字区域高度
+ (CGFloat)heightForText:(NSString*)sText Font:(UIFont*)font forWidth:(CGFloat)fWidth;

//view根据原来的frame做调整，重新setFrame，fakeRect的4个参数如果<0，则用原来frame的相关参数，否则就用新值。
+ (void) View:(UIView *)view ReplaceFrameWithRect:(CGRect) fakeRect;

//view根据原来的bounds做调整，重新setBounds，fakeRect的4个参数如果<0，则用原来bounds的相关参数，否则就用新值。
+ (void) View:(UIView *)view ReplaceBoundsWithRect:(CGRect) fakeRect;

//根据@"#eef4f4"得到UIColor
+ (UIColor *) uiColorFromString:(NSString *) clrString;
+ (UIColor *) uiColorFromString:(NSString *) clrString alpha:(double)alpha;

//将原始图片draw到指定大小范围，从而得到并返回新图片。能缩小图片尺寸和大小
+ (UIImage*)ScaleImage:(UIImage*)image ToSize:(CGSize)newSize;
//将图片保存到document目录下
+ (void)saveDocImage:(UIImage *)tempImage WithName:(NSString *)imageName;

//将浮点数转换为NSString，并设置保留小数点位数
+ (NSString *)getStringFromFloat:(float) f withDecimal:(int) decimalPoint;

/**
 *  获取渐变色 从上向下渐变 两种颜色
 *
 *  @param oColor 第一种颜色
 *  @param tColor 第二种颜色
 *
 *  @return 渐变色背景
 */
+(UIView*)getGradientWithFrame:(CGRect)frame oneColor:(UIColor*)oColor twoColor:(UIColor*)tColor;
/**
 *  不同字体颜色的label
 *
 *  @param str      传入要改变颜色的字符串
 *  @param location 传入颜色分割位置
 *  @param fcolor   前段字符的颜色
 *  @param ecolor   第二段字符的颜色
 *
 *  @return
 */
+(NSMutableAttributedString*)transString:(NSString*)str location:(NSInteger)location frontColor:(UIColor*)fcolor endColor:(UIColor*)ecolor;
/**
 *  判断是否为正确的银行卡格式
 *
 *  @param cardNo 输入的银行卡号
 *
 *  @return YES为是 NO为不是
 */
+ (BOOL) checkCardNo:(NSString*) cardNo;
/**
 *  判断是否为正确的身份证号
 *
 *  @param identityCard 输入的身份证号
 *
 *  @return YES为是 NO为不是
 */
+ (BOOL) checkIdentityNo:(NSString*)identityCard;
/**
 *  判断是否为正确的手机号
 *
 *  @param telNo 输入的手机号
 *
 *  @return YES为是 NO为不是
 */
+(BOOL)checkTelNo:(NSString*)telNo;
@end
