//
//  Person.h
//  ClassCluster
//
//  Created by 英策网络科技 on 16/3/3.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,PersonType){
    Child_Type,
    Man_Type,
    Woman_Type,
};
@interface Person : NSObject
+(Person*)inputType:(PersonType)type;
-(void)sayName;
@end
