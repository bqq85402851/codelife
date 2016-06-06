//
//  UIViewController+BXQScanBarcode.h
//  BXQBaseFrame
//
//  Created by 英策网络科技 on 16/5/20.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BXQScanBarcodeDelgate<NSObject>
-(void)scanBarcodeToResultStr:(NSString*)result;
@end
@interface BXQScanBarcode:UIViewController
@property(nonatomic,weak)id<BXQScanBarcodeDelgate>delegate;
@end
