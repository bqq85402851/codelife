//
//  ViewController.m
//  BXQRefresh
//
//  Created by 英策网络科技 on 15/12/10.
//  Copyright © 2015年 英策网络科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       NSLog(@"串行队列");
   });
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
       UIView*colorView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
       [self.view addSubview:colorView];
       dispatch_async(dispatch_get_main_queue(), ^{
           colorView.backgroundColor=[UIColor redColor];
       });
   });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
