//
//  PopAnimation.m
//  CustPopGesture
//
//  Created by 英策网络科技 on 16/7/6.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "PopAnimation.h"

@interface PopAnimation()

@end
@implementation PopAnimation
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController*fromController=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController*toController=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView*containerView=[transitionContext containerView];
    [containerView insertSubview:toController.view belowSubview:fromController.view];
    NSTimeInterval duration=[self transitionDuration:transitionContext];
    
    /**
     *  这里定制动画
     */
//    CATransition*animation=[CATransition animation];
//    animation.delegate=self;
//    animation.duration=duration;
//    animation.timingFunction=UIViewAnimationCurveEaseInOut;
//    animation.type=@"pageCurl";
//    animation.subtype=kCATransitionFromBottom;
//    [fromController.view.layer addAnimation:animation forKey:nil];

   
    [UIView animateWithDuration:duration animations:^{
        fromController.view.transform=CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;
}
 

@end
