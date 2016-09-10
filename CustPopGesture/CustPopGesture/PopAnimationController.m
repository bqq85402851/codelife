//
//  PopAnimationController.m
//  CustPopGesture
//
//  Created by 英策网络科技 on 16/7/5.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "PopAnimationController.h"
#import "PopAnimation.h"
@interface PopAnimationController()
@property(nonatomic,weak)UINavigationController*vc;
@property(nonatomic,strong)UIPercentDrivenInteractiveTransition*interactivePopTransition;
@end
@implementation PopAnimationController
-(instancetype)initWithViewController:(UIViewController *)vc{
    if (self=[super init]) {
        self.vc=(UINavigationController*)vc;
        self.vc.delegate=self;
    }
    return self;
}
-(void)handlePopGesture:(UIPanGestureRecognizer *)pan{
    CGFloat progress=[pan translationInView:pan.view].x/pan.view.bounds.size.width;
    if (pan.state==UIGestureRecognizerStateBegan) {
        self.interactivePopTransition=[[UIPercentDrivenInteractiveTransition alloc]init];
        [self.vc popViewControllerAnimated:YES];
    }else if (pan.state==UIGestureRecognizerStateChanged){
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }else if (pan.state==UIGestureRecognizerStateEnded||pan.state==UIGestureRecognizerStateCancelled){
        if (progress>0.5) {
            [self.interactivePopTransition finishInteractiveTransition];
        }else{
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition=nil;
    }
}
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation==UINavigationControllerOperationPop) {
        return [[PopAnimation alloc]init];
    }
    return nil;
}
-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if ([animationController isKindOfClass:[PopAnimation class]]) {
        return self.interactivePopTransition;
    }
    return nil;
}
@end
