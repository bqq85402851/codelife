//
//  BezierVC.m
//  InterViewAll
//
//  Created by 英策网络科技 on 16/9/6.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "BezierVC.h"
#import "BezierView.h"
@interface BezierVC()

@end
@implementation BezierVC
-(void)viewDidLoad{
    [super viewDidLoad];
    BezierView*bView=[[BezierView alloc]initWithFrame:self.view.bounds];
    bView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch*touch=[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    NSLog(@"%@",NSStringFromCGPoint([touch locationInView:[touch view]]));
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    int x = point.x;
    int y = point.y;
    NSLog(@"touch (x, y) is (%d, %d)", x, y);
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch*touch=[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
}

@end
