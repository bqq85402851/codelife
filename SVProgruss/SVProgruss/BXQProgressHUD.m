//
//  BXQProgressHUD.m
//  SVProgruss
//
//  Created by 英策网络科技 on 16/3/25.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "BXQProgressHUD.h"
#import "AppDelegate.h"
@interface BXQProgressHUD()
@property(nonatomic,strong)UIImageView*imageView;
@end
@implementation BXQProgressHUD
+(instancetype)shareView{
    static BXQProgressHUD*hud=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGRect frame=[[[UIApplication sharedApplication].delegate window]bounds];
        hud=[[BXQProgressHUD alloc]initWithFrame:frame];
        hud.userInteractionEnabled=YES;
        hud.backgroundColor=[UIColor clearColor];
    });
  return hud;
}
-(instancetype)initWithFrame:(CGRect)frame{
    NSMutableArray*imageArr=[NSMutableArray array];
    if (self=[super initWithFrame:frame]) {
        for (int a=0; a<11; a++) {
            [imageArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"Image-%d",a]]];
        }
        _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        _imageView.center=CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
        [self addSubview:_imageView];
        _imageView.userInteractionEnabled=YES;
        _imageView.animationImages=imageArr;
        _imageView.animationDuration=0.5;
        _imageView.animationRepeatCount=0;
        [_imageView startAnimating];
    }
    return self;
}
+(void)show{
    AppDelegate*_app=[UIApplication sharedApplication].delegate;
    [_app.window addSubview:[BXQProgressHUD shareView]];
    [_app.window bringSubviewToFront:[BXQProgressHUD shareView]];
}
+(void)dismiss{
    [[BXQProgressHUD shareView] removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
