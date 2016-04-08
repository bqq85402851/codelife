//
//  Person.m
//  Foundation
//
//  Created by 英策网络科技 on 16/4/1.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "Person.h"
@interface Person()
{
    NSCache*_cache;
}
@end
@implementation Person
-(id)init{
    if (self=[super init]) {
        _cache=[NSCache new];
        _cache.countLimit=100;
        _cache.totalCostLimit=5*1024*1024;
    }
    return self;
}
-(void)downloadDataForURL:(NSURL*)url{
    NSData*cachedData=[_cache objectForKey:url];
    if (cachedData) {
        
    }else{
        Person*person=[[Person alloc]initWithUrl:url];
        [person startWithCompletionHandler:^(NSData *data) {
            [_cache setObject:data forKey:url cost:data.length];
            
        }];
    }
}
+(void)initialize{

}
@end
