//
//  ViewController.m
//  CustPopGesture
//
//  Created by 英策网络科技 on 16/7/5.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"next" forState:UIControlStateNormal];
    button.frame=CGRectMake(0, 0, 50, 30);
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];
}
-(void)next{
    [self.navigationController pushViewController:[[SecondController alloc]init] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
