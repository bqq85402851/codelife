//
//  BANViewController.h
//  BANYAN
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 BANYAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BANViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITabBarItem *message;
@property (weak, nonatomic) IBOutlet UITabBarItem *contact;
@property (weak, nonatomic) IBOutlet UITabBarItem *dynamic;
@property (weak, nonatomic) IBOutlet UITabBar *myTabBar;
@property (weak, nonatomic) IBOutlet UINavigationBar *myNav;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegmented;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *msgClick;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *moreClick;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *aiyaClick;
- (IBAction)segmentedAction:(id)sender;
- (IBAction)msgClick:(id)sender;

@end
