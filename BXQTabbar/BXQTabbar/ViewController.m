//
//  ViewController.m
//  BXQTabbar
//
//  Created by 英策网络科技 on 16/5/30.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "First.h"
#import "Second.h"
#import "Third.h"
#import "Fourth.h"
#import "BXQTabbar.h"
@interface ViewController ()
{
    BOOL statusHidden;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    First*first=[[First alloc]init];
    first.title=@"1";
    Second*second=[[Second alloc]init];
    second.title=@"2";
    Third*third=[[Third alloc]init];
    third.title=@"3";
    Fourth*fourth=[[Fourth alloc]init];
    fourth.title=@"4";
    
    UITabBarController*tabbar=[[UITabBarController alloc]init];
    tabbar.viewControllers=@[first,second,third,fourth];
    
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(100, 100, 100, 50);
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)click{
   statusHidden=!statusHidden;
    [UIView animateWithDuration:0.5 animations:^{
        [self setNeedsStatusBarAppearanceUpdate];
    }];

}
-(UIStatusBarStyle)preferredStatusBarStyle{
    if (statusHidden) {
         return UIStatusBarStyleLightContent;
    }else{
         return UIStatusBarStyleDefault;
    }

}
-(BOOL)prefersStatusBarHidden{
    return statusHidden;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
