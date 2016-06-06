//
//  BXQTabbar.m
//  BXQTabbar
//
//  Created by 英策网络科技 on 16/5/30.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "BXQTabbar.h"
@interface BXQTabbar()
{
    CGFloat superplusHeight;
}
@end
@implementation BXQTabbar
-(instancetype)init{
    if (self=[super init]) {
       superplusHeight=20;
       CGFloat width=self.bounds.size.width/5.0;
       self.plusBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.plusBtn.frame=CGRectMake(self.center.x-width/2.0, -superplusHeight, width, width);
        [self.plusBtn setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
        [self addSubview:self.plusBtn];
    }
    return self;
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
    
    CGFloat width=self.bounds.size.width/5.0;
    
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(self.plusBtn.frame.origin.x,CGRectGetMaxY( self.plusBtn.frame), width, superplusHeight)];
    label.text=@"plus";
    label.font=[UIFont systemFontOfSize:11.0];
    label.textColor=[UIColor grayColor];
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
@end
