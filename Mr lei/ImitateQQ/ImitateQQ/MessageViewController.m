//
//  MessageViewController.m
//  ImitateQQ
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 BANYAN. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNav];
    [self initSegmentedControl];
}

#pragma mark -- initNav
-(void)initNav
{
    self.navigationItem.title = nil;
//左边按钮（一个）
    UIButton * leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftBtn setImage:[UIImage imageNamed:@"cat.png"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 0;
    
    UIBarButtonItem * left0 = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = left0;
    
//右边按钮（两个,依次right0,right1）
    UIButton * rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [rightBtn setImage: [UIImage imageNamed:@"cat.png"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 1;
    
    UIBarButtonItem * right0 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    UIButton * rightBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
//    [rightBtn2 setImage:[UIImage imageNamed:@"cat.png"] forState:UIControlStateNormal];
    [rightBtn2 setTitle:@"更多..." forState:UIControlStateNormal];
    [rightBtn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn2.tag = 2;
    UIBarButtonItem * right1 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn2];
    
    NSArray * rightBtnArray = [NSArray arrayWithObjects:right1,right0, nil];
    self.navigationItem.rightBarButtonItems = rightBtnArray;
}

#pragma mark -- initSegmentedControl
-(void)initSegmentedControl
{
    UISegmentedControl * segmentedControl = [[UISegmentedControl alloc]initWithItems:nil];
//    segmentedControl.momentary = YES;
    [segmentedControl insertSegmentWithTitle:@"消息" atIndex:0 animated:YES];
    [segmentedControl insertSegmentWithTitle:@"电话" atIndex:1 animated:YES];
    [segmentedControl setWidth:80 forSegmentAtIndex:0];
    [segmentedControl setWidth:80 forSegmentAtIndex:1];
    [segmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedControl;
    
    
    /*
     将msgView telView插入到分段控制器里面的猜想
     */
//    msgViewController * msgView = [[msgViewController alloc]init];
//    self.msgViewController = msgView;
//    telViewController * telView = [[telViewController alloc]init];
//    self.telViewController = telView;
//    [segmentedControl insertSubview:self.msgViewController.view atIndex:0];
    
}

#pragma mark --segmentedControlAction
-(void)segmentedControlAction:(UISegmentedControl*)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            self.view.backgroundColor = [UIColor redColor];
            break;
            
        default:
            break;
    }
}

#pragma mark -- BarButtonItem's liftCycle
-(void)btnAction:(UIBarButtonItem*)sender
{
    switch (sender.tag) {
            
        case 0:
            self.view.backgroundColor = [UIColor yellowColor];
            break;
            
            case 1:
            self.view.backgroundColor = [UIColor darkGrayColor];
            break;
            case 2:
            self.view.backgroundColor = [UIColor blackColor];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
