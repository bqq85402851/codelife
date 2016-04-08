//
//  Person.h
//  Foundation
//
//  Created by 英策网络科技 on 16/4/1.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^EOCNetworkFetcherCompletionHandler)(NSData*data);
@interface Person : NSObject
-(id)initWithUrl:(NSURL*)url;
-(void)startWithCompletionHandler:(EOCNetworkFetcherCompletionHandler)hander;
@end
