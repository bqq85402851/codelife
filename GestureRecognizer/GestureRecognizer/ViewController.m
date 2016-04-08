//
//  ViewController.m
//  GestureRecognizer
//
//  Created by 英策网络科技 on 16/4/8.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray*arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"打印frame" forState:UIControlStateNormal];
    button.frame=CGRectMake(0, 0, 100, 50);
    [button addTarget:self action:@selector(print) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIView*view=[[UIView alloc]initWithFrame:CGRectMake(100, 0, 50, 50)];
    view.backgroundColor=[UIColor cyanColor];
    UIPanGestureRecognizer*price_tag_gesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panPriceTag:)];
    [view addGestureRecognizer:price_tag_gesture];
    [self.view addSubview:view];
    self.arr=@[view];
}
-(void)panPriceTag:(UIPanGestureRecognizer*)pan{
    UIImageView*priceImage=(UIImageView*)pan.view;
    CGPoint position=[pan translationInView:priceImage];
    priceImage.transform=CGAffineTransformTranslate(priceImage.transform, position.x, position.y);
    [pan setTranslation:CGPointZero inView:priceImage];
}
-(void)print{
    UIView*view=(UIView*)self.arr.firstObject;
    NSLog(@"X:%f Y:%f W:%f H:%f",view.frame.origin.x,view.frame.origin.y,view.frame.size.width,view.frame.size.height);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
