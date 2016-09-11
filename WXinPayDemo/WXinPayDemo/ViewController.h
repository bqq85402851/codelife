//
//  ViewController.h
//  WXinPayDemo
//
//  Created by 英策网络科技 on 16/7/7.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^Block)(int a);
@interface ViewController : UIViewController
@property(nonatomic,copy)Block block;
@property(nonatomic,copy)void (^blockTwo)(int a) ;
@end

