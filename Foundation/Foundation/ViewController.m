//
//  ViewController.m
//  Foundation
//
//  Created by 英策网络科技 on 16/3/31.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
const void* EOCRetainCallback(CFAllocatorRef allocator,const void*value){
    return CFRetain(value);
}
void EOCReleaseCallback(CFAllocatorRef allocator,const void*value){
    CFRelease(value);
}
CFDictionaryKeyCallBacks keyCallbacks={
    0,
    EOCRetainCallback,
    EOCReleaseCallback,
    NULL,
    CFEqual,
    CFHash
};
CFDictionaryValueCallBacks valueCallbacks={
    0,
    EOCRetainCallback,
    EOCReleaseCallback,
    NULL,
    CFEqual,
};
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSSet*aSet=[NSSet setWithObjects:@"1",@"2", nil];
    NSDictionary*dic=[NSDictionary dictionaryWithObjectsAndKeys:@"呵呵",@"one",@"哈哈",@"two", nil];
    NSEnumerator*enumerator=[aSet objectEnumerator];
    NSEnumerator*denu=[dic keyEnumerator];
    id objet;
    while ((objet=[enumerator nextObject])!=nil) {
        NSLog(@"%@",objet);
    }
    while ((objet=[denu nextObject])!=nil) {
        NSLog(@"%@",dic[objet]);
    }

    NSArray*array=@[@"数组1",@"数组2",@"数组3"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"tag:%ld object:%@",idx,obj);
        NSLog(@"%d",*stop);
    }];
    [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"tag:%ld object:%@",idx,obj);
    }];
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"tag:%@ object:%@",key,obj);
    }];
    
    [aSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"object:%@",obj);
    }];
    
    
    /**
     *  CoreFoundation下的字典
     */
    CFMutableDictionaryRef aCFDictionary=CFDictionaryCreateMutable(NULL, 0, &keyCallbacks, &valueCallbacks);
    NSMutableDictionary*anNSDictionary=(__bridge_transfer NSMutableDictionary*)aCFDictionary;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
