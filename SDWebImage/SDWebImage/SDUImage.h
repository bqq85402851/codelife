//
//  UIView+SDUimage.h
//  SDWebImage
//
//  Created by 英策网络科技 on 16/4/14.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SDUImage)
@property (nonatomic,strong)NSNumber* isAddimage;
-(void)sd_setImageUrl:(NSString*)url;
@end
