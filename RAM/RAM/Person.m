//
//  Person.m
//  RAM
//
//  Created by 英策网络科技 on 16/3/9.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "Person.h"

@implementation Person
{
     NSTimer*_timer;
}
-(instancetype)init{
    if (self=[super init]) {
           _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(add) userInfo:nil repeats:YES];
    }
    return self;
}
-(void)add{
    int a=0;
    NSLog(@"%d",a++);
}
-(void)close{
    [_timer invalidate];
    _timer=nil;
}
-(void)dealloc{
    [super dealloc];
    NSLog(@"%s",__func__);
    [self close];
}
@end
