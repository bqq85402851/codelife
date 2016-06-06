//
//  BXQTabbar.m
//  BXQTabbar
//
//  Created by 英策网络科技 on 16/5/30.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "BXQTabbar.h"
@interface BXQTabbar()

@end
@implementation BXQTabbar
-(instancetype)init{
    if (self=[super init]) {
        self.backgroundColor=[UIColor whiteColor];
        [self setShadowImage:[self imageWithColor:[UIColor clearColor]]];
       self.plusBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [[UITabBar appearance]setBackgroundImage:[self imageWithColor:[UIColor clearColor]]];
        [[UITabBar appearance]setShadowImage:[self imageWithColor:[UIColor clearColor]]];
        [self.plusBtn setBackgroundImage:[UIImage imageNamed:@"normal"] forState:UIControlStateNormal];
        [self.plusBtn setBackgroundImage:[UIImage imageNamed:@"normal"] forState:UIControlStateHighlighted];
        [self.plusBtn addTarget:self action:@selector(plusBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.plusBtn];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        NSLog(@"1");
    }
    return self;
}
-(void)plusBtnDidClick{
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarPlusBtnClick:)]) {
        [self.tabBarDelegate tabBarPlusBtnClick:self];
    }
}
-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.hidden==NO) {
        CGPoint newp=[self convertPoint:point toView:self.plusBtn];
        if ([self.plusBtn pointInside:newp withEvent:event]) {
            return self.plusBtn;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }else{
        return [super hitTest:point withEvent:event];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    Class class=NSClassFromString(@"UITabBarButton");

    NSLog(@"%ld",self.items.count);
    
    self.plusBtn.frame=CGRectMake(self.center.x-(self.plusBtn.currentBackgroundImage.size.width)/2.0, (self.frame.size.height* 0.5 - 20)-(self.plusBtn.currentBackgroundImage.size.height/2.0) , self.plusBtn.currentBackgroundImage.size.width, self.plusBtn.currentBackgroundImage.size.height);
    
    CGFloat width=self.bounds.size.width/(self.items.count+1);
    
    UILabel*label=[[UILabel alloc]init];
    label.text=@"发布";
    label.font=[UIFont systemFontOfSize:11.0];
    [label sizeToFit];
    label.textColor=[UIColor grayColor];
    label.center=CGPointMake(self.plusBtn.center.x, CGRectGetMaxY(self.plusBtn.frame)+10);
    [self addSubview:label];
    
    int btnIndex=0;
    for (UIView*btn in self.subviews) {
        if ([btn isKindOfClass:class]) {
            CGRect frame=CGRectMake(btnIndex*width, 0, btn.bounds.size.width, btn.bounds.size.height);
            btn.frame=frame;
            btnIndex++;
            if (btnIndex==2) {
                btnIndex++;
            }
        }
    }
    
}
- (UIImage *)imageWithColor:(UIColor *)color {
    
    //描述一个矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    //获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //使用color演示填充上下文
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    
    //渲染上下文
    CGContextFillRect(ctx, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
