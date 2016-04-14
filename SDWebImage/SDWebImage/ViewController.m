//
//  ViewController.m
//  SDWebImage
//
//  Created by 英策网络科技 on 16/4/14.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+WebCache.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView*image=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    image.backgroundColor=[UIColor orangeColor];
    [image sd_setImageWithURL:[NSURL URLWithString:@"http://heng-s-micro-mall.hixiaoyuan.cn/attachment/images/16/2016/04/Klp9craLTCcP0Yo6LlArC9Kqa6pYfC.png"] placeholderImage:nil];
    [self.view addSubview:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
