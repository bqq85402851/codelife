//
//  Person.h
//  interview
//
//  Created by 英策网络科技 on 16/2/19.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*gender;
-(instancetype)initWithName:(NSString*)name Gender:(NSString*)gender;
@end
