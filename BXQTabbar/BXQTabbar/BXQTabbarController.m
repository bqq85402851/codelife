//
//  BXQTabbarController.m
//  BXQTabbar
//
//  Created by 英策网络科技 on 16/5/30.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "BXQTabbarController.h"
#import "BXQTabbar.h"
#import "First.h"
#import "Second.h"
#import "Third.h"
#import "Fourth.h"
@interface BXQTabbarController()<BXQTabbarDelegeta>
@end
@implementation BXQTabbarController
+(void)initialize{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
}
-(void)viewDidLoad{
    First*first=[[First alloc]init];
    first.title=@"1";
    Second*second=[[Second alloc]init];
    second.title=@"2";
    Third*third=[[Third alloc]init];
    third.title=@"3";
    Fourth*fourth=[[Fourth alloc]init];
    fourth.title=@"4";
    
    self.viewControllers=@[first,second,third,fourth];
    
    BXQTabbar*tabbar=[[BXQTabbar alloc]init];
    tabbar.tabBarDelegate=self;
    [self setValue:tabbar forKey:@"tabBar"];
}
-(void)tabBarPlusBtnClick:(BXQTabbar *)tabBar{
    NSLog(@"2");
}
@end
