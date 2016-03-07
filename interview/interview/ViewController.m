//
//  ViewController.m
//  interview
//
//  Created by 英策网络科技 on 16/2/18.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
//描述类中的方法
typedef struct objc_method*Method;
//实例变量
typedef struct objc_ivar*Ivar;
//类别 Category
typedef struct objc_category*Category;
//类中声明的属性
typedef struct objc_property*objc_property_t;

/**
 多线程、特别是NSOperation 和 GCD 的内部原理。
 
 运行时机制的原理和运用场景。
 
 SDWebImage的原理。实现机制。如何解决TableView卡的问题。
 
 block和代理的，通知的区别。block的用法需要注意些什么。
 
 strong，weak，retain，assign，copy nomatic 等的区别。
 
 设计模式，mvc，单利，工厂，代理等的应用场景。
 
 单利的写法。在单利中创建数组应该注意些什么。
 
 NSString 的时候用copy和strong的区别。
 
 响应值链。
 
 NSTimer 在子线程中应该手动创建NSRunLoop ，否则不能循环执行。
 
 UIScrollView和NSTimer组合做循环广告图轮播的时候有一个属性可以控制当上下滚动tableview的时候广告轮播图依然正常滚动。
 
 Xcode最新的自动布局。。。这个很多公司都用。尽量自学下。
 
 git ，和svn的用法。。。git的几个命令简单的记下。。。
 
 友盟报错可以查到具体某一行的错误，原理是什么。
 
 Instrument  可以检测 电池的耗电量、和内存的消耗。的用法。
 
 动画CABaseAnimation CAKeyAni….  CATrans…..  CAGoup….    等熟悉。。
 
 ARC的原理。
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self NSThread];
    [self archive];
}
  /**多线程、特别是NSOperation 和 GCD 的内部原理。*/
-(void)NSThread{
/**
 三种方式的优缺点介绍:
 
 1）NSThread
 
 优点：NSThread 比其他两个轻量级
 
 缺点：需要自己管理线程的生命周期，线程同步。线程同步对数据的加锁会有一定的系统开销
 
 
 2）Cocoa  NSOperation
 
 优点:不需要关心线程管理， 数据同步的事情，可以把精力放在自己需要执行的操作上。
 
 Cocoa operation相关的类是NSOperation, NSOperationQueue.
 
 NSOperation是个抽象类,使用它必须用它的子类，可以实现它或者使用它定义好的两个子类: NSInvocationOperation和NSBlockOperation.
 
 创建NSOperation子类的对象，把对象添加到NSOperationQueue队列里执行。
 
 */
    NSInvocationOperation*invo=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(Invocation) object:nil];
    NSBlockOperation*bloc=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"BlockOperation");
    }];
    NSOperationQueue*queue=[[NSOperationQueue alloc]init];
    queue.maxConcurrentOperationCount=2;
    [queue addOperation:invo];
    [queue addOperation:bloc];
 /**
    3) GCD(全优点)
 
    Grand Central dispatch(GCD)是Apple开发的一个多核编程的解决方案。在iOS4.0开始之后才能使用。GCD是一个替代NSThread, NSOperationQueue,NSInvocationOperation等技术的很高效强大的技术。
 */
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"global_queue");
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"mainThread");
    });
    
    double delayInSeconds=2.0;
    dispatch_time_t popTime=dispatch_time(DISPATCH_TIME_NOW, delayInSeconds*NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        NSLog(@"两秒输出");
    });
    
    dispatch_group_t group=dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"group1");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"group2");
    });
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        NSLog(@"notify");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL*dataUrl=[NSURL URLWithString:@"www.baidu.com"];
        NSError * error;
        NSString*data=[NSString stringWithContentsOfURL:dataUrl encoding:NSUTF8StringEncoding error:&error];
        if (data!=nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"call back, the data is: %@", data);
            });
        }else{
               NSLog(@"error when download:%@", error);
        }
    });
}
/**归档,反归档*/
-(void)archive{
    UIButton *fileButton = [UIButton buttonWithType:UIButtonTypeSystem];
    fileButton.frame =  CGRectMake(45, 260, 60, 30);
    [fileButton setTitle:@"归档" forState:UIControlStateNormal];
    [fileButton addTarget:self action:@selector(file:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fileButton];
    
    UIButton *archiveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    archiveButton.frame = CGRectMake(190, 260, 60, 30);
    [archiveButton setTitle:@"反归档" forState:UIControlStateNormal];
    [archiveButton addTarget:self action:@selector(archive:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:archiveButton];
}
/** 运行时机制的原理和运用场景*/
-(void)runtime{
/**
 2> 相关应用
 
 NSCoding(归档和解档, 利用runtime遍历模型对象的所有属性)
 字典 –> 模型 (利用runtime遍历模型对象的所有属性, 根据属性名从字典中取出对应的值, 设置到模型的属性上)
 KVO(利用runtime动态产生一个类)
 用于封装框架(想怎么改就怎么改)
 这就是我们runtime机制的只要运用方向
 > 相关函数
 
 objc_msgSend : 给对象发送消息
 class_copyMethodList : 遍历某个类所有的方法
 class_copyIvarList : 遍历某个类所有的成员变量
 class_…..
 这是我们学习runtime必须知道的函数！

 */
    unsigned int count;
//    objc_property_t*propertyList=class_copyPropertyList([self class],&count);
//    for (unsigned int i=0; i<count; i++) {
//        const char*propertyName=proper_getName(propertyList[i]);
//        NSLog(@"property---->%@",[NSString stringWithUTF8String:propertyName]);
//    }
//    Method *methodList=class_copyMethodList([self class],&count);
}

/** strong，weak，retain，assign，copy nomatic 等的区别。*/
-(void)retainOrCount{
    /**
     copy将指针与对象同事copy 一般用于NSString
     strong 引用计数+1,对象引用计数为0时对象释放,否则不会释放
     weak引用计数+1,对象释放,指向这个属性的指针全部释放
     retain用于MRC中,类似于ARC中的copy
     assign引用计数不变,多用于基础变量和C语言变量
     nomatic并发操作,防止被多个线程访问修改
     */
}
#pragma mark -Action
-(void)Invocation{
    NSLog(@"InvocationOperation");
}
-(void)file:(UIButton*)sender{
    Person*person=[[Person alloc]initWithName:@"野子" Gender:@"女"];
    NSMutableData*data=[NSMutableData data];
    data=[NSMutableData dataWithData:[NSKeyedArchiver archivedDataWithRootObject:person]];
    NSKeyedArchiver*archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:person forKey:@"archiver"];
    [archiver finishEncoding];
    [data writeToFile:[self getPath] atomically:YES];
}
-(void)archive:(UIButton*)sender{
    NSMutableData*data=[NSMutableData dataWithContentsOfFile:[self getPath]];
    NSKeyedUnarchiver*unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    Person*person=[unarchiver decodeObjectForKey:@"archiver"];
    [unarchiver finishDecoding];
    NSLog(@"Name:%@  Gender:%@",person.name,person.gender);
}
#pragma mark 单例
-(instancetype)shareInstance{
    static ViewController*vc=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc=[[ViewController alloc]init];
    });
    return vc;
}
- (NSString *)getPath
{
    //获得文件夹的路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *newPath = [path stringByAppendingPathComponent:@"archiver"];
    return newPath;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
