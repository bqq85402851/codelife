//
//  BXQFrame.h
//  BXQBaseFrame
//
//  Created by 英策网络科技 on 16/5/20.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//
/**
 *  二维码生成
 */
#import "BXQBarcodeGenerator.h"
/**
 *  二维码扫描
 */
#import "BXQScanBarcode.h"
/**
 *  从相册或者相机截取固定尺寸图片
 */
#import "BXQCropperViewController.h"
/**
 *  关于UIView子类的功能扩展
 */
#import "UIViewExt.h"
/**
 *  日期的一些操作
 */
#import "DateUtil.h"
/**
 *  字符串 高度 宽度的小工具
 */
#import "Util.h"
/**
 *  视图工厂
 */
#import "BXQViewFactory.h"

/**
 *  必备宏
 */
#define WIDTH_SCALE [[UIScreen mainScreen] bounds].size.width/320
#define SCREEN_WIDTH  [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT  [[UIScreen mainScreen]bounds].size.height

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

 
//手机别名： 用户定义的名称
#define iPhone_userPhoneName [[UIDevice currentDevice] name]
//设备名称
#define iPhone_deviceName [[UIDevice currentDevice] systemName]
//手机系统版本
#define iPhone_phoneVersion [[UIDevice currentDevice] systemVersion]
//手机型号
#define iPhone_phoneModel  [[UIDevice currentDevice] model]
//地方型号  （国际化区域名称）
#define iPhone_localPhoneModel = [[UIDevice currentDevice] localizedModel]