//
//  UIView+SDUimage.m
//  SDWebImage
//
//  Created by 英策网络科技 on 16/4/14.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "SDUImage.h"
#import <UIImageView+WebCache.h>
#import <objc/message.h>
@implementation UIImageView (SDUImage)
-(void)sd_setImageUrl:(NSString*)url{
    SDWebImageManager*manager=[SDWebImageManager sharedManager];
    [manager downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (image) {
            if ([self.isAddimage boolValue]) {
                self.image=image;
            }else{
                self.isAddimage=[NSNumber numberWithBool:YES];
                self.alpha=0.f;
                self.image=image;
                [UIView animateWithDuration:0.5f animations:^{
                    self.alpha=1.0f;
                }];
            }
        }
    }];
//    self.alpha=0;
//    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
//    [UIView animateWithDuration:0.5f animations:^{
//        self.alpha=1.0f;
//    }];
}

-(void)setIsAddimage:(NSNumber *)isAddimage{
    objc_setAssociatedObject(self, "isAddimage", isAddimage, OBJC_ASSOCIATION_RETAIN);
}
-(NSNumber*)isAddimage{
     return objc_getAssociatedObject(self, "isAddimage");
}
@end
