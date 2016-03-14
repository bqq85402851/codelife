//
//  TabBarController.m
//  ImitateQQ
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 BANYAN. All rights reserved.
//

#import "TabBarController.h"
#import "MessageViewController.h"
#import "ContactViewController.h"
#import "DynamicViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabBar];
    [self initViewControllers];
}

-(void)initTabBar
{
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
}

-(void)initViewControllers
{
    //消息
    MessageViewController * message = [[MessageViewController alloc]init];
    message.title = @"消息";
    UINavigationController * messageNav = [[UINavigationController alloc]initWithRootViewController:message];
    messageNav.tabBarItem.image = [[UIImage imageNamed:@"cat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    messageNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"cat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //联系人
    ContactViewController * contact = [[ContactViewController alloc]init];
    contact.title = @"联系人";
    UINavigationController * contactNav = [[UINavigationController alloc]initWithRootViewController:contact];
    contactNav.tabBarItem.image = [[UIImage imageNamed:@"cat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    contactNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"cat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //动态
    DynamicViewController * dynamic = [[DynamicViewController alloc]init];
    dynamic.title = @"动态";
    UINavigationController * dynamicNav = [[UINavigationController alloc]initWithRootViewController:dynamic];
    dynamicNav.tabBarItem.image = [[UIImage imageNamed:@"cat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    dynamicNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"cat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.viewControllers = @[messageNav,contactNav,dynamicNav];
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
