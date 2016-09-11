//
//  CABasicAnimationVC.m
//  InterViewAll
//
//  Created by 英策网络科技 on 16/9/6.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//
//  来自  http://www.jianshu.com/p/79a0b3c7086c
#import "CABasicAnimationVC.h"
@interface CABasicAnimationVC()
@end
@implementation CABasicAnimationVC
-(void)viewDidLoad{
    [super viewDidLoad];
    UIView*view=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor=[UIColor purpleColor];
    [self.view addSubview:view];
    
    CABasicAnimation*animation1=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation1.fromValue=@(1.0);
    animation1.toValue=@(1.5);
    [animation1 setValue:@"scale" forKey:@"AnimationKey"];
    [view.layer addAnimation:animation1 forKey:@"1"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation2.fromValue = @(M_PI_2);
    animation2.toValue = @(M_PI);
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:animation2 forKey:@"A"];
    
    CABasicAnimation*animation3=[CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation3.fromValue=@(0.0);
    animation3.toValue=@(50.0);
    animation3.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation*animation4=[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation4.fromValue=(id)[UIColor purpleColor].CGColor;
    animation4.toValue=(id)[UIColor greenColor].CGColor;
    animation4.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    //http://upload-images.jianshu.io/upload_images/1968278-ecdcae93423d30aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240
    
    CAAnimationGroup*animaGroup=[CAAnimationGroup animation];
    animaGroup.duration=1.0;
    animaGroup.fillMode=kCAFillModeForwards;
    animaGroup.removedOnCompletion=NO;
    animaGroup.repeatCount=5;
    animaGroup.autoreverses=YES;
    animaGroup.delegate=self;
    animaGroup.animations=@[animation1,animation2,animation3,animation4];
    [view.layer addAnimation:animaGroup forKey:@"group"];
}
-(void)animationDidStart:(CAAnimation *)anim{
    if ([[anim valueForKey:@"AnimationKey"] isEqualToString:@"scale"]) {
        NSLog(@"开始了");
    }
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([[anim valueForKey:@"AnimationKey"] isEqualToString:@"scale"]) {
        NSLog(@"结束了");
    }
}
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
