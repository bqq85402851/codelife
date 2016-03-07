//
//  Person.m
//  interview
//
//  Created by 英策网络科技 on 16/2/19.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "Person.h"

@implementation Person
-(instancetype)initWithName:(NSString *)name Gender:(NSString *)gender{
    if (self=[super init]) {
        self.name=name;
        self.gender=gender;
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
//    unsigned int count=0;
//    Ivar ivars=class_copyIvarList([Person class], &count);
//    for (int i=0; i<count; i++) {
//        Ivar ivar=ivars[i];
//        
//        const char*name=ivar_getName(ivar);
//        
//        NSString*key=[NSString stringWithUTF8String:name];
//        id value=[self valueForKey:key];
//        [aCoder encodeObject:value forKey:key];
//    }
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.gender=[aDecoder decodeObjectForKey:@"gender"];
    }
    return self;
}

@end
