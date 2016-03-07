//
//  secondVC.m
//  NotificationDemo
//
//  Created by 英策网络科技 on 15/11/5.
//  Copyright © 2015年 英策网络科技. All rights reserved.
//

#import "secondVC.h"

@interface secondVC ()

@end

@implementation secondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(100, 100, 80, 44);
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)back{
    NSMutableDictionary*userInfo=[NSMutableDictionary dictionary];
    [userInfo setObject:@"100" forKey:@"cateID"];
    [userInfo setObject:@"200" forKey:@"brandID"];
    NSNotification*notic=[NSNotification notificationWithName:@"notication" object:nil userInfo:userInfo];
    [[NSNotificationCenter defaultCenter]postNotification:notic];
    [self.navigationController popViewControllerAnimated:YES];
    
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
