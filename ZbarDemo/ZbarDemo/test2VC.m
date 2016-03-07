//
//  test2VC.m
//  ZbarDemo
//
//  Created by 英策网络科技 on 15/12/2.
//  Copyright © 2015年 英策网络科技. All rights reserved.
//

#import "test2VC.h"
#import <ZBarSDK.h>
@interface test2VC ()<ZBarReaderViewDelegate>
{
    UIView*line;
}
@end

@implementation test2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    CGFloat X=(self.view.frame.size.width-200)/2.0;
    CGFloat Y=(self.view.frame.size.height-200)/2.0;
    // Do any additional setup after loading the view.
    ZBarReaderView *readerView=[[ZBarReaderView alloc]init];
    readerView.frame=CGRectMake(X, Y, 200, 200);
    readerView.readerDelegate=self;
    readerView.torchMode=0;
    readerView.layer.borderColor=[UIColor greenColor].CGColor;
    readerView.layer.borderWidth=0.5;
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
    animation.repeatCount=FLT_MAX;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.autoreverses=YES;
    [line.layer addAnimation:animation forKey:nil];

    [readerView start];
}
-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image{
    for (ZBarSymbol*symbol in symbols) {
        NSLog(@"%@",symbol.data);
        NSLog(@"%@",[ZBarSymbol nameForType:symbol.type]);
        [line removeFromSuperview];
        break;
    }
    [readerView stop];
}
-(CGRect)getScanCrop:(CGRect)rect readerViewBounds:(CGRect)readerViewBounds
{
    CGFloat x,y,width,height;
    x = rect.origin.x / readerViewBounds.size.width;
    y = rect.origin.y / readerViewBounds.size.height;
    width = rect.size.width / readerViewBounds.size.width;
    height = rect.size.height / readerViewBounds.size.height;
    return CGRectMake(x, y, width, height);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
