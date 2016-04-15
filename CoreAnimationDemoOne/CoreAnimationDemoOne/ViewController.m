//
//  ViewController.m
//  CoreAnimationDemoOne
//
//  Created by 英策网络科技 on 16/4/15.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#define WIDTH [[UIScreen mainScreen]bounds].size.width
#define HEIGHT [[UIScreen mainScreen]bounds].size.height
@interface ViewController ()
@property(nonatomic,strong)UIView*viewOne;
@property(nonatomic,strong)UIView*viewTwo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _viewTwo=[[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    _viewTwo.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_viewTwo];
    
    _viewOne=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _viewOne.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:_viewOne];
    
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(100, 100, 80, 50);
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [self.view addSubview:button];
}
-(void)click:(UIButton*)sender{
    if (sender.selected) {
        _viewOne.frame=CGRectMake(0, 0, WIDTH, HEIGHT);
        _viewTwo.frame=CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
        
        CATransition*animation=[CATransition animation];
        animation.duration=0.3f;
        animation.timingFunction=UIViewAnimationCurveEaseInOut;
        animation.type=kCATransitionMoveIn;
        animation.subtype=kCATransitionFromLeft;
        [_viewOne.layer addAnimation:animation forKey:nil];
    }else{
        _viewOne.frame=CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
        _viewTwo.frame=CGRectMake(0, 0, WIDTH, HEIGHT);
        
        CATransition*animation=[CATransition animation];
        animation.duration=0.3f;
        animation.timingFunction=UIViewAnimationCurveEaseInOut;
        animation.type=kCATransitionMoveIn;
        animation.subtype=kCATransitionFromRight;
        [_viewTwo.layer addAnimation:animation forKey:nil];
        
        CABasicAnimation*basicAnimation=[CABasicAnimation animationWithKeyPath:@"option"];
        basicAnimation.duration=0.5f;
        basicAnimation.fromValue=[NSValue valueWithCGPoint:CGPointMake(WIDTH+WIDTH/2.0, HEIGHT/2.0)];
        basicAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(WIDTH/2.0, HEIGHT/2.0)];
        basicAnimation.fillMode=kCAFillModeForwards;
        basicAnimation.removedOnCompletion=NO;
        
        CAAnimationGroup*animationGroup=[CAAnimationGroup animation];
        animationGroup.animations=[NSArray arrayWithObjects:basicAnimation,animation, nil];
        //[_viewTwo.layer addAnimation:animationGroup forKey:nil];
    }
    sender.selected=!sender.selected;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
