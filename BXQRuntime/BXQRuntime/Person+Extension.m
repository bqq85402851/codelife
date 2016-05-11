//
//  Person+Extension.m
//  BXQRuntime
//
//  Created by 英策网络科技 on 16/3/29.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "Person+Extension.h"
#import <objc/message.h>
@implementation Person (Extension)
-(void)setPrice:(NSString *)price{
    objc_setAssociatedObject(self, "price", price, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
//-(NSString*)price{
//    return objc_getAssociatedObject(self, "price");
//}

@end
