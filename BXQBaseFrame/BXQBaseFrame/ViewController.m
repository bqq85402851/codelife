//
//  ViewController.m
//  BXQBaseFrame
//
//  Created by 英策网络科技 on 16/5/20.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "BXQFrame.h"
NSString*imgUrl=@"https://img.alicdn.com/imgextra/i2/603867595/TB2t0hopXXXXXalXpXXXXXXXXXX_!!603867595.jpg_300x300.jpg";
@interface ViewController ()<BXQScanBarcodeDelgate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView*qrCode=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    qrCode.image=[BXQBarcodeGenerator getBarcodeImageWithString:@"www.baidu.com" imageSize:100];
    [self.view addSubview:qrCode];
    
    UIButton*scanButton=[UIButton buttonWithType:UIButtonTypeSystem];
    scanButton.frame=CGRectMake(100, 0, 100, 50);
    [scanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scanButton setTitle:@"点我扫描二维码" forState:UIControlStateNormal];
    [scanButton addTarget:self action:@selector(scan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanButton];
    
    UIImageView*sdImage=[[UIImageView alloc]initWithFrame:CGRectMake(200, 0, 100, 100)];
    [sdImage bxq_setImageView:imgUrl placeholderImage:nil];
    [self.view addSubview:sdImage];
    
 
    //手机别名： 用户定义的名称
    NSString* userPhoneName = [[UIDevice currentDevice] name];
    NSLog(@"手机别名: %@", userPhoneName);
    //设备名称
    NSString* deviceName = [[UIDevice currentDevice] systemName];
    NSLog(@"设备名称: %@",deviceName );
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"手机系统版本: %@", phoneVersion);
    //手机型号
    NSString* phoneModel = [[UIDevice currentDevice] model];
    NSLog(@"手机型号: %@",phoneModel );
    //地方型号  （国际化区域名称）
    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
    NSLog(@"国际化区域名称: %@",localPhoneModel );
    
    UIImageView*backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 100,SCREEN_WIDTH, SCREEN_WIDTH)];
    backView.image=[UIImage imageNamed:@"Back"];
    [self.view addSubview:backView];
    
    /**
     蒙版
     */
    UIVisualEffectView*visualView=[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    visualView.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH);
    visualView.alpha=1.0;
    [backView addSubview:visualView];
    
    UIButton*fButton=[BXQViewFactory createButtonWithFrame:CGRectMake(0, backView.bottom, 100, 40) buttonType:UIButtonTypeCustom setTitle:@"按钮工厂" forNormalStateTitleColor:[UIColor redColor] forSelectedStateTitleColor:[UIColor greenColor] withBackGroundColor:nil withBackImage:nil withTarget:self Selector:@selector(click:) forControlEvent:UIControlEventTouchUpInside];
    [self.view addSubview:fButton];
    
    UILabel*fLabel=[BXQViewFactory createLableWithFrame:CGRectMake(fButton.right, fButton.top, 100, 40) setText:@"label\r工厂" withTextColor:[UIColor orangeColor] TextAlignment:NSTextAlignmentCenter withTextFont:nil backGroundColor:nil];
    [self.view addSubview:fLabel];
    
    UITextField*textField=[BXQViewFactory createTextFieldWithFrame:CGRectMake(fLabel.right, fButton.top, 100,40) setText:nil placeholder:@"textField" textColor:[UIColor grayColor] TextAlignment:NSTextAlignmentCenter withTextFont:nil];
    [self.view addSubview:textField];
    
    UIView*textFieldBack=[[UIView alloc]initWithFrame:CGRectMake(0, fButton.bottom, SCREEN_WIDTH, 80)];
    [self.view addSubview:textFieldBack];
    
    UIImageView*leftView=[BXQViewFactory createImageViewWithFrame:CGRectMake(0, 0, 40, 40) setImage:[UIImage imageNamed:@"password"]];
    UIImageView*rightView=[BXQViewFactory createImageViewWithFrame:CGRectMake(0, 0, 40, 40) setImage:[UIImage imageNamed:@"password"]];
    
    UITextField*rightField=[BXQViewFactory createTextFieldWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) withSubView:rightView offsetX:0 leftOrRightViewType:UITextFieldRightViewType setText:nil placeholder:@"自带右视图" textColor:[UIColor greenColor] TextAlignment:NSTextAlignmentRight withTextFont:nil];
    rightField.backgroundColor=[UIColor lightGrayColor];
    [textFieldBack addSubview:rightField];
    
    UITextField*leftField=[BXQViewFactory createTextFieldWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 40) withSubView:leftView offsetX:10 leftOrRightViewType:UITextFieldLeftViewType setText:nil placeholder:@"自带左视图" textColor:[UIColor redColor] TextAlignment:NSTextAlignmentLeft withTextFont:nil];
    leftField.backgroundColor=[UIColor grayColor];
    [textFieldBack addSubview:leftField];
    
    UIView*gView=[BXQViewFactory createGradientLabelWithFrame:CGRectMake(0, textFieldBack.bottom, SCREEN_WIDTH, 40) setText:@"向右滑动解锁>" withTextFont:nil textColor:nil sliderColor:[UIColor whiteColor] backColor:[UIColor blackColor]];
    [self.view addSubview:gView];
    
    UIImageView*textFieldSubView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40) ];
    textFieldSubView.image=[UIImage imageNamed:@"password"];
    
    UITextField*textFieldOne=[[UITextField alloc]initWithFrame:CGRectMake(0, gView.bottom, SCREEN_WIDTH/2.0, 40)];
    textFieldOne.text=@"左左左左";
    textFieldOne.leftViewMode=UITextFieldViewModeAlways;
    textFieldOne.leftView=textFieldSubView;
    //[self.view addSubview:textFieldOne];
    
    UITextField*textFieldTwo=[[UITextField alloc]initWithFrame:CGRectMake(textFieldOne.right, textFieldOne.top, SCREEN_WIDTH/2.0, 40)];
    textFieldTwo.text=@"右右右右";
    textFieldTwo.rightViewMode=UITextFieldViewModeAlways;
    textFieldTwo.rightView=textFieldSubView;
    //[self.view addSubview:textFieldTwo];
    
    NSTextAttachment*attachment=[[NSTextAttachment alloc]initWithData:nil ofType:nil];
    attachment.image=[UIImage imageNamed:@"Back"];
    NSAttributedString*textAttachmentSting=[NSAttributedString attributedStringWithAttachment:attachment];
    fLabel.attributedText=textAttachmentSting;
}
-(void)scan{
    BXQScanBarcode*bVC=[[BXQScanBarcode alloc]init];
    bVC.delegate=self;
    [self presentViewController:bVC animated:YES completion:nil];
}
-(void)click:(UIButton*)sender{
    sender.selected=!sender.selected;
}

-(void)scanBarcodeToResultStr:(NSString *)result{
    NSLog(@"%@",result);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
