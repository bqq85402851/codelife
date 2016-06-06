/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import "UIViewExt.h"
#import <objc/message.h>
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center)
{
    CGRect newrect = CGRectZero;
    newrect.origin.x = center.x-CGRectGetMidX(rect);
    newrect.origin.y = center.y-CGRectGetMidY(rect);
    newrect.size = rect.size;
    return newrect;
}

@implementation UIView (ViewGeometry)

// Retrieve and set the origin
- (CGPoint) origin
{
	return self.frame.origin;
}

- (void) setOrigin: (CGPoint) aPoint
{
	CGRect newframe = self.frame;
	newframe.origin = aPoint;
	self.frame = newframe;
}


// Retrieve and set the size
- (CGSize) size
{
	return self.frame.size;
}

- (void) setSize: (CGSize) aSize
{
	CGRect newframe = self.frame;
	newframe.size = aSize;
	self.frame = newframe;
}

// Query other frame locations
- (CGPoint) bottomRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) bottomLeft
{
	CGFloat x = self.frame.origin.x;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) topRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y;
	return CGPointMake(x, y);
}


// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) height
{
	return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
	CGRect newframe = self.frame;
	newframe.size.height = newheight;
	self.frame = newframe;
}

- (CGFloat) width
{
	return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
	CGRect newframe = self.frame;
	newframe.size.width = newwidth;
	self.frame = newframe;
}

- (CGFloat) top
{
	return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
	CGRect newframe = self.frame;
	newframe.origin.y = newtop;
	self.frame = newframe;
}

- (CGFloat) left
{
	return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
	CGRect newframe = self.frame;
	newframe.origin.x = newleft;
	self.frame = newframe;
}

- (CGFloat) bottom
{
	return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
	CGRect newframe = self.frame;
	newframe.origin.y = newbottom - self.frame.size.height;
	self.frame = newframe;
}

- (CGFloat) right
{
	return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
	CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
	CGRect newframe = self.frame;
	newframe.origin.x += delta ;
	self.frame = newframe;
}

// Move via offset
- (void) moveBy: (CGPoint) delta
{
	CGPoint newcenter = self.center;
	newcenter.x += delta.x;
	newcenter.y += delta.y;
	self.center = newcenter;
}

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor
{
	CGRect newframe = self.frame;
	newframe.size.width *= scaleFactor;
	newframe.size.height *= scaleFactor;
	self.frame = newframe;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void) fitInSize: (CGSize) aSize
{
	CGFloat scale;
	CGRect newframe = self.frame;
	
	if (newframe.size.height && (newframe.size.height > aSize.height))
	{
		scale = aSize.height / newframe.size.height;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	if (newframe.size.width && (newframe.size.width >= aSize.width))
	{
		scale = aSize.width / newframe.size.width;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	self.frame = newframe;	
}
/**
 *  加载图片附加渐出效果
 */
-(void)bxq_setImageView:(NSString*)imgUrl placeholderImage:(UIImage*)placeholderImage{
        if (placeholderImage) {
             ((UIImageView*)self).image=placeholderImage;
        }
        SDWebImageManager*manager=[SDWebImageManager sharedManager];
        [manager downloadImageWithURL:[NSURL URLWithString:imgUrl] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            if (image) {
                if ([self.isAddimage boolValue]) {
                    ((UIImageView*)self).image=image;
                }else{
                    self.isAddimage=[NSNumber numberWithBool:YES];
                    self.alpha=0.f;
                    ((UIImageView*)self).image=image;
                    CABasicAnimation*anim=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
                    anim.duration=0.1;
                    anim.repeatCount=1;
                    anim.fromValue=[NSNumber numberWithFloat:0.0];
                    anim.toValue=[NSNumber numberWithFloat:1.0];
                    [self.layer addAnimation:anim forKey:nil];
                    [UIView animateWithDuration:1.0f animations:^{
                        self.alpha=1.0f;
                    }];
                }
            }
        }];
}
-(void)bxq_setButtonImage:(NSString*)imgUrl forState:(UIControlState)state placeholderImage:(UIImage*)placeholderImage{
    if (placeholderImage) {
        [((UIButton*)self) setImage:placeholderImage forState:state];
    }
    SDWebImageManager*manager=[SDWebImageManager sharedManager];
    [manager downloadImageWithURL:[NSURL URLWithString:imgUrl] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (image) {
            if ([self.isAddimage boolValue]) {
                [((UIButton*)self) setImage:image forState:state];
            }else{
                self.isAddimage=[NSNumber numberWithBool:YES];
                self.alpha=0.f;
                [((UIButton*)self) setImage:image forState:state];
                CABasicAnimation*anim=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
                anim.duration=0.1;
                anim.repeatCount=1;
                anim.fromValue=[NSNumber numberWithFloat:0.0];
                anim.toValue=[NSNumber numberWithFloat:1.0];
                [self.layer addAnimation:anim forKey:nil];
                [UIView animateWithDuration:1.0f animations:^{
                    self.alpha=1.0f;
                }];
            }
        }
    }];
}
-(void)setIsAddimage:(NSNumber *)isAddimage{
    objc_setAssociatedObject(self, "isAddimage", isAddimage, OBJC_ASSOCIATION_RETAIN);
}
-(NSNumber*)isAddimage{
    return objc_getAssociatedObject(self, "isAddimage");
}
/**
 *  图片合成
 */
-(UIImage*)synthesizerForView:(UIView*)synthesizerView forSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [synthesizerView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*togetherImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return togetherImage;
}

@end

