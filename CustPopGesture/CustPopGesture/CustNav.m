//
//  CustNav.m
//  CustPopGesture
//
//  Created by 英策网络科技 on 16/7/5.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "CustNav.h"
#import "PopAnimationController.h"
@interface CustNav()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) PopAnimationController *navT;
@end
@implementation CustNav
-(void)viewDidLoad{
    [super viewDidLoad];
    UIGestureRecognizer*gesture=self.interactivePopGestureRecognizer;
    gesture.enabled=NO;
    UIView*gestureView=gesture.view;
    
    UIPanGestureRecognizer*popGesture=[[UIPanGestureRecognizer alloc]init];
    popGesture.delegate=self;
    popGesture.maximumNumberOfTouches=1;
    [gestureView addGestureRecognizer:popGesture];
    
    _navT=[[PopAnimationController alloc]initWithViewController:self];
    [popGesture addTarget:_navT action:@selector(handlePopGesture:)];
    
}
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    /**
     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
     */
    return self.viewControllers.count!=1&&![[self valueForKey:@"_isTransitioning"] boolValue];
}
@end
