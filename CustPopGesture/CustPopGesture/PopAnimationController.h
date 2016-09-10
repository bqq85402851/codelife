//
//  PopAnimationController.h
//  CustPopGesture
//
//  Created by 英策网络科技 on 16/7/5.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PopAnimationController : NSObject<UINavigationControllerDelegate>
-(instancetype)initWithViewController:(UIViewController*)vc;
-(void)handlePopGesture:(UIPanGestureRecognizer*)pan;
@end
