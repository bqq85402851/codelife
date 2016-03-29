//
//  Person.h
//  BXQRuntime
//
//  Created by 英策网络科技 on 16/3/29.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,assign)float height;
@property(nonatomic,assign)float weight;

-(void)run;
+(void)run;
@end
