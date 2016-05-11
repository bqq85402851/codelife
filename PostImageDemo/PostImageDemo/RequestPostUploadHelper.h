//
//  RequestPostUploadHelper.h
//  BanYouBao
//
//  Created by zhengyumin on 15/10/28.
//  Copyright (c) 2015年 banyoubao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CallBackBlock)(BOOL result,NSString*msg,NSError*error);
/**
 *POST 提交 并可以上传图片目前只支持单张
 */

@interface RequestPostUploadHelper : NSObject{
    NSString *FORM_FLE_INPUT;
}
+ (NSString *)postRequestWithURL: (NSString *)url  // IN
                      postParems: (NSMutableDictionary *)postParems // IN 提交参数据集合
                     picFilePath: (NSMutableArray *)picFilePath  // IN 上传图片路径
                     picFileName: (NSMutableArray *)picFileName// IN 上传图片名称
                     isUserPic:(BOOL)isUserPic
                     callback:(CallBackBlock)callback;
/**
 * 修发图片大小
 */
+ (UIImage *) imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize;
/**
 * 保存图片
 */
+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName;
/**
 * 生成GUID
 */
+ (NSString *)generateUuidString;
@end

