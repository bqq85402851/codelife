//
//  UIScrollView+BXQPullDownView.h
//  BXQRefresh
//
//  Created by 英策网络科技 on 15/12/10.
//  Copyright © 2015年 英策网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^PullDownView)();
@interface UIScrollView (BXQRefreshView)
/**下拉刷新*/
-(void)addPullDownView:(PullDownView)pullDownView;
@end
