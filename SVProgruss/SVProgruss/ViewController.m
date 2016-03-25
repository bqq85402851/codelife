//
//  ViewController.m
//  SVProgruss
//
//  Created by 英策网络科技 on 16/3/25.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <SVProgressHUD.h>
#import "BXQProgressHUD.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"点" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(c) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(100, 100, 100, 100);
    [self.view addSubview:button];
}
-(void)c{
    [BXQProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [BXQProgressHUD dismiss];
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
