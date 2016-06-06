//
//  UIViewController+BXQScanBarcode.m
//  BXQBaseFrame
//
//  Created by 英策网络科技 on 16/5/20.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "BXQScanBarcode.h"
#import <ZBarSDK.h>
@interface BXQScanBarcode()<ZBarReaderViewDelegate>
{
    UIView*line;
}
@end
@implementation  BXQScanBarcode
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    // Do any additional setup after loading the view.
    ZBarReaderView *readerView=[[ZBarReaderView alloc]init];
    readerView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    readerView.readerDelegate=self;
    //关闭闪光灯
    readerView.torchMode=0;
    if (TARGET_IPHONE_SIMULATOR) {
        ZBarCameraSimulator*cameraSimulator=[[ZBarCameraSimulator alloc]initWithViewController:self];
        cameraSimulator.readerView=readerView;
    }
    //扫描线
    line=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 1)];
    line.backgroundColor=[UIColor greenColor];
    line.alpha=0.8;
    [readerView addSubview:line];
    [self.view addSubview:readerView];
    readerView.scanCrop=CGRectMake(0, 0, 1, 1);
    
    CABasicAnimation*animation=[CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration=1.0;
    animation.fromValue=[NSValue valueWithCGPoint:CGPointMake(100, 0)];
    animation.toValue=[NSValue valueWithCGPoint:CGPointMake(100, 199)];
    animation.repeatCount=0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.autoreverses=YES;
    [line.layer addAnimation:animation forKey:nil];
    
    [readerView start];
}
-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image{
    for (ZBarSymbol*symbol in symbols) {
        [line removeFromSuperview];
        int64_t delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            if ([self.delegate respondsToSelector:@selector(scanBarcodeToResultStr:)]) {
                [self.delegate scanBarcodeToResultStr:symbol.data];
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        });
        
        break;
    }
    [readerView stop];
}
@end
