//
//  ViewController.m
//  Animation
//
//  Created by 英策网络科技 on 16/5/31.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <qrencode.h>
#import <AFNetworking.h>
#import "UIViewExt.h"
#import "SecondVC.h"
#define SCREEN_WIDTH  [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT  [[UIScreen mainScreen]bounds].size.height
#define WIDTH_SCALE [[UIScreen mainScreen] bounds].size.width/320
#define SHARE @"http://app.yunhaohuo.com/app/index.php?i=16&c=entry&method=myshop_look&p=commission&m=ewei_shop&do=plugin&mid=237"

enum {
    qr_margin = 3
};
@interface ViewController ()

@end

@implementation ViewController
{
    NSInteger second;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    UIImageView*image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    image.image=[self createShareShopUrl:@"http://app.yunhaohuo.com/app/index.php?i=16&c=entry&method=myshop_look&p=commission&m=ewei_shop&do=plugin&mid=237" ShopName:@"毕小强"];
    image.userInteractionEnabled=YES;
    [self.view addSubview:image];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(next)];
    [image addGestureRecognizer:tap];
    
    NSDictionary*parameters=[NSDictionary dictionaryWithObjectsAndKeys:@"123",@"uid", nil];
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [manager GET:@"http://app.yunhaohuo.com/addons/ewei_shop/core/api/weishop.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        animation.toValue=[NSNumber numberWithInteger:100];
        animation.duration=1.0;
        animation.removedOnCompletion=NO;
        animation.fillMode=kCAFillModeForwards;
        [image.layer addAnimation:animation forKey:nil];
    });
    

}
-(void)next{
    [self.navigationController pushViewController:[[SecondVC alloc]init] animated:YES];
}
-(UIImage*)createShareShopUrl:(NSString*)url  ShopName:(NSString*)name{
    UIView*backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    backView.backgroundColor=[UIColor whiteColor];

    //二维码
    UIImageView*barcode=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    barcode.layer.borderColor=[UIColor greenColor].CGColor;
    barcode.layer.borderWidth=1;
    barcode.image=[ViewController qrImageForString:url imageSize:SCREEN_WIDTH];
    [backView addSubview:barcode];
    
    
    //邀请人
    UILabel*good_name_label=[[UILabel alloc]initWithFrame:CGRectMake([self transForm:30], barcode.bottom+[self transForm:75], [self transForm:900], [self transForm:120])];
    good_name_label.text=[NSString stringWithFormat:@"%@邀请您开店",name];
    good_name_label.font=[UIFont systemFontOfSize:18.0];
    [backView addSubview:good_name_label];
    
    UILabel*explain_label=[[UILabel alloc]initWithFrame:CGRectMake(good_name_label.left, good_name_label.bottom, [self transForm:900], [self transForm:105])];
    explain_label.text=@"扫描上方二维码接受邀请";
    explain_label.numberOfLines=0;
    explain_label.font=[UIFont systemFontOfSize:16.0];
    explain_label.textColor=[UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0];
    [backView addSubview:explain_label];
    
    UILabel*from_label=[[UILabel alloc]initWithFrame:CGRectMake(good_name_label.left, explain_label.bottom, [self transForm:900], [self transForm:75])];
    from_label.text=@"From云好货";
    from_label.font=[UIFont systemFontOfSize:16.0];
    from_label.textColor=[UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0];
    [backView addSubview:from_label];
    
    UIGraphicsBeginImageContext(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT));
    [backView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*togetherImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return togetherImage;
}

+ (void)drawQRCode:(QRcode *)code context:(CGContextRef)ctx size:(CGFloat)size {
    unsigned char *data = 0;
    int width;
    data = code->data;
    width = code->width;
    float zoom = (double)size / (code->width + 2.0 * qr_margin);
    CGRect rectDraw = CGRectMake(0, 0, zoom, zoom);
    
    // draw
    CGContextSetFillColor(ctx, CGColorGetComponents([UIColor blackColor].CGColor));
    for(int i = 0; i < width; ++i) {
        for(int j = 0; j < width; ++j) {
            if(*data & 1) {
                rectDraw.origin = CGPointMake((j + qr_margin) * zoom,(i + qr_margin) * zoom);
                CGContextAddRect(ctx, rectDraw);
            }
            ++data;
        }
    }
    CGContextFillPath(ctx);
}

+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)size {
    if (![string length]) {
        return nil;
    }
    
    QRcode *code = QRcode_encodeString([string UTF8String], 0, QR_ECLEVEL_L, QR_MODE_8, 1);
    if (!code) {
        return nil;
    }
    
    // create context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(0, size, size, 8, size * 4, colorSpace, kCGImageAlphaPremultipliedLast);
    
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(0, -size);
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(1, -1);
    CGContextConcatCTM(ctx, CGAffineTransformConcat(translateTransform, scaleTransform));
    
    // draw QR on this context
    [ViewController drawQRCode:code context:ctx size:size];
    
    // get image
    CGImageRef qrCGImage = CGBitmapContextCreateImage(ctx);
    UIImage * qrImage = [UIImage imageWithCGImage:qrCGImage];
    
    // some releases
    CGContextRelease(ctx);
    CGImageRelease(qrCGImage);
    CGColorSpaceRelease(colorSpace);
    QRcode_free(code);
    
    return qrImage;
}
/**框架转换器*/
-(CGFloat)transForm:(CGFloat)frame{
    return frame/3.0*WIDTH_SCALE;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
