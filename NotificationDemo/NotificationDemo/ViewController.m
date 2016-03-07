//
//  ViewController.m
//  NotificationDemo
//
//  Created by 英策网络科技 on 15/11/5.
//  Copyright © 2015年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "secondVC.h"
@interface ViewController ()
@property(nonatomic)UITextView*textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSNotificationCenter*notification=[NSNotificationCenter defaultCenter];
    [notification addObserver:self selector:@selector(change:) name:@"notication" object:nil];
    
    self.textView=[[UITextView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,  self.view.frame.size.height-64)];
    self.textView.textColor=[UIColor blackColor];
    self.textView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.textView];
    
    UIButton*rightButton=[UIButton buttonWithType:UIButtonTypeSystem];
    [rightButton setTitle:@"点我" forState:UIControlStateNormal];
    rightButton.frame=CGRectMake(0, 0, 80, 44);
    [rightButton addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
}
-(void)next{
    [self.navigationController pushViewController:[[secondVC alloc]init] animated:YES];
}
-(void)change:(NSNotification*)notification{
    NSDictionary*dict=[notification userInfo];
    NSString*cateStr=[dict objectForKey:@"cateID"];
    NSString*brandStr=[dict objectForKey:@"brandID"];
    self.textView.text=[NSString stringWithFormat:@"%@   %@",cateStr,brandStr];
    NSLog(@"%@",dict);
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"notication" object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
