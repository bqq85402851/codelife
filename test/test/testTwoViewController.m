//
//  testTwoViewController.m
//  test
//
//  Created by 英策网络科技 on 16/3/8.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "testTwoViewController.h"

@interface testTwoViewController ()

@end

@implementation testTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     NSLog(@"C:%s",__func__);
}
-(void)dealloc{
     NSLog(@"C:%s",__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
