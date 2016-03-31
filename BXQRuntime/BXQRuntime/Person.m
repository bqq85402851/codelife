//
//  Person.m
//  BXQRuntime
//
//  Created by 英策网络科技 on 16/3/29.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
+(void)load{
    /**
     *  交换方法
     */
    Method runMethod=class_getClassMethod([Person class], @selector(run));
    Method sleepMethd=class_getClassMethod([self class], @selector(sleep));
    method_exchangeImplementations(runMethod, sleepMethd);
}
-(void)run{
    NSLog(@"-run");
}
+(void)run{
    NSLog(@"+run");
    
}
+(void)sleep{
    NSLog(@"-sleep");
}
-(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    unsigned int ivarCount=0;
    Ivar*ivarList=class_copyIvarList([self class], &ivarCount);
    for (int a=0; a<ivarCount; a++) {
        Ivar ivar=ivarList[a];
        const char*name=ivar_getName(ivar);
    
    }
}
@end
