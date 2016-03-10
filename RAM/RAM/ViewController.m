//
//  ViewController.m
//  RAM
//
//  Created by 英策网络科技 on 16/3/9.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /**
     *  自动释放池
     *
     *  @return
     @autoreleasepool{
     NSString*string=[NSString stringWithFormat:@"自动释放"];
     @autoreleasepool {
     NSNumber*number=[NSNumber numberWithInt:1];
     }
     }
     */

    /**
     *  利用自动释放池解决内存峰值问题
     NSMutableArray*people=[NSMutableArray array];
     for (int i=0; i<10000; i++) {
     @autoreleasepool {
     Person*person=[[Person alloc]init];
     [people addObject:person];
     [person autorelease];
     }
     }
     */
   
    /**
     *  循环引用
     *
     *  @return NSTime
     */
    Person*p=[[Person alloc]init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [p release];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
