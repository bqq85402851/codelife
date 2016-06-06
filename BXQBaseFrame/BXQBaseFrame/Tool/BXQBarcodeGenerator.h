//
//  BXQBarqodeGenerator.h
//  BXQBaseFrame
//
//  Created by 英策网络科技 on 16/5/20.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BXQBarcodeGenerator : NSObject
/**
 *  生成二维码
 *
 *  @return
 */
+(UIImage*)getBarcodeImageWithString:(NSString *)string imageSize:(CGFloat)size;
@end
