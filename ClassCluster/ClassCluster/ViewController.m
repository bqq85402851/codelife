//
//  ViewController.m
//  ClassCluster
//
//  Created by 英策网络科技 on 16/3/3.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
//Heiti SC Light
//Arial
#define CHINA_FONT [UIFont fontWithName:@"Arial" size:20.0]
#define ENGLISH_FONT [UIFont fontWithName:@"Brush Script" size:20.0]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[Person inputType:Man_Type] sayName];
    [[Person inputType:Child_Type] sayName];
    
    
    
    UILabel*textLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 80)];
    textLabel.text=@"ABCDEFGHIJKLM";
    textLabel.font=CHINA_FONT;
    [self.view addSubview:textLabel];
    
    UILabel*textTwoLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 220,self.view.frame.size.width-20, 80)];
    textTwoLabel.text=@"汉体书写信息技术标准相容";
    textTwoLabel.font=[UIFont systemFontOfSize:20.0];
    [self.view addSubview:textTwoLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
