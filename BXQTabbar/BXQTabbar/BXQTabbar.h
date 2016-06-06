//
//  BXQTabbar.h
//  BXQTabbar
//
//  Created by 英策网络科技 on 16/5/30.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BXQTabbar;
@protocol BXQTabbarDelegeta<NSObject>
-(void)tabBarPlusBtnClick:(BXQTabbar*)tabBar;
@end
@interface BXQTabbar : UITabBar
@property(nonatomic,strong)UIButton*plusBtn;
@property(nonatomic,weak)id<BXQTabbarDelegeta>tabBarDelegate;
@end
