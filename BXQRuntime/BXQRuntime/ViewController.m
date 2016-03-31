//
//  ViewController.m
//  BXQRuntime
//
//  Created by 英策网络科技 on 16/3/29.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"
#import "Person+Extension.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person*person=[[Person alloc]init];
    objc_msgSend(person, @selector(run));
    objc_msgSend([Person class], @selector(run));
    
    /**
     *  获取属性名称
     */
    unsigned int ivarCount=0;
    Ivar*ivarList=class_copyIvarList([Person class], &ivarCount);
    for (int i=0; i<ivarCount; i++) {
        Ivar ivar=ivarList[i];
        const char*name=ivar_getName(ivar);
        NSLog(@"%s",name);
    }
    
    /**
     *  获取方法名
     */
    unsigned int methodCount=0;
    Method*methodList=class_copyMethodList([Person class], &methodCount);
    for (int i=0; i<methodCount; i++) {
        Method method=methodList[i];
        SEL methodSel=method_getName(method);
        NSString*methodName=NSStringFromSelector(methodSel);
        NSLog(@"%@",methodName);
    }
    
    /**
     *  动态创建类 并添加实力变量和方法
     *
     *  @return
     */
    Class Studet=objc_allocateClassPair([Person class], "Student", 0);
    BOOL isAddIvar=class_addIvar(Studet, "studyID", sizeof(NSString*), 0, "@");
    if (!isAddIvar) {
        NSLog(@"添加实例变量失败");
    }
    id student=[[Studet alloc]init];
    [student setValue:@"100号" forKey:@"studyID"];
    NSLog(@"study=%@",[student valueForKey:@"studyID"]);
    
    BOOL isAddMethod=class_addMethod(Studet, @selector(study), (IMP)study_imp, "v@:");
    if (!isAddMethod) {
        NSLog(@"添加方法失败");
    }
    [student study];
    
    /**
     *  类别扩展属性
     *
     *  @return
     */
    person.price=@"物价";
    NSLog(@"price=%@",person.price);
}
- (void)study {
    NSLog(@"study");
}

// 方法的实现 id self, SEL _cmd 是C语言函数默认的两个参数
void study_imp(id self, SEL _cmd) {
    NSLog(@"study_imp");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
