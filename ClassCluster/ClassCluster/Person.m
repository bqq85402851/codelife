//
//  Person.m
//  ClassCluster
//
//  Created by 英策网络科技 on 16/3/3.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "Person.h"
#import "Child.h"
#import "Man.h"
#import "Woman.h"
@implementation Person
+(Person*)inputType:(PersonType)type{
    switch (type) {
        case Man_Type:
            return [Man new];
        break;
        case Woman_Type:
            return [Woman new];
        break;
        case Child_Type:
            return [Child new];
        break;
    }
}
@end
