//
//  ViewController.m
//  IconDemo
//
//  Created by 英策网络科技 on 16/5/11.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSData*imgData=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://app.yunhaohuo.com/attachment/images/16/2016/04/J7W1QVje6006Fe0qVOo000767a1A1v.png"]];
    UIImage*img=[UIImage imageWithData:imgData];
 
    NSString*path=[[NSBundle mainBundle]pathForResource:@"icon" ofType:@"png"];
    [UIImagePNGRepresentation(img) writeToFile:path atomically:YES];
    
  /**  NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage*shareImage = [UIImage imageNamed:obj];
        NSLog(@"%f %f ",shareImage.size.width,shareImage.size.height);
    }];*/
    
    NSString*imagePath=[[NSBundle mainBundle]pathForResource:@"icon" ofType:@"png"];
    [UIImagePNGRepresentation(img) writeToFile:imagePath atomically:YES];
    UIImageView*imgView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imgView.image=img;
    [self.view addSubview:imgView];
    
    NSMutableString*mutablPath=[NSMutableString stringWithString:imagePath];
    [mutablPath deleteCharactersInRange:NSMakeRange(mutablPath.length-8,8)];
    
    
    UIImageView*test1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 58, 58)];
    test1.image=img;
    UIGraphicsBeginImageContext(CGSizeMake(58, 58));
    [test1.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*together1Image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    NSString*test1Str=[[NSBundle mainBundle]pathForResource:@"AppIcon29x29@2x" ofType:@"png"];
     NSString*test1Str=[NSString stringWithFormat:@"%@AppIcon29x29@2x.png",mutablPath];
    [UIImagePNGRepresentation(together1Image) writeToFile:test1Str atomically:YES];
    
    UIImageView*test2=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 87, 87)];
    test2.image=img;
    UIGraphicsBeginImageContext(CGSizeMake(87, 87));
    [test2.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*together2Image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //NSString*test2Str=[[NSBundle mainBundle]pathForResource:@"AppIcon29x29@3x" ofType:@"png"];
    NSString*test2Str=[NSString stringWithFormat:@"%@AppIcon29x29@3x.png",mutablPath];
    [UIImagePNGRepresentation(together2Image) writeToFile:test2Str atomically:YES];
    
    UIImageView*test3=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    test3.image=img;
    UIGraphicsBeginImageContext(CGSizeMake(80, 80));
    [test3.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*together3Image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    NSString*test3Str=[[NSBundle mainBundle]pathForResource:@"AppIcon40x40@2x" ofType:@"png"];
    NSString*test3Str=[NSString stringWithFormat:@"%@AppIcon40x40@2x.png",mutablPath];
    [UIImagePNGRepresentation(together3Image) writeToFile:test3Str atomically:YES];
    
    UIImageView*test4=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    test4.image=img;
    UIGraphicsBeginImageContext(CGSizeMake(120, 120));
    [test4.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*together4Image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   // NSString*test4Str=[[NSBundle mainBundle]pathForResource:@"AppIcon40x40@3x" ofType:@"png"];
    NSString*test4Str=[NSString stringWithFormat:@"%@AppIcon40x40@3x.png",mutablPath];
    [UIImagePNGRepresentation(together4Image) writeToFile:test4Str atomically:YES];
    
    UIImageView*test5=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    test5.image=img;
    UIGraphicsBeginImageContext(CGSizeMake(120, 120));
    [test3.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*together5Image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    NSString*test5Str=[[NSBundle mainBundle]pathForResource:@"AppIcon60x60@2x" ofType:@"png"];
    NSString*test5Str=[NSString stringWithFormat:@"%@AppIcon60x60@2x.png",mutablPath];
    [UIImagePNGRepresentation(together5Image) writeToFile:test5Str atomically:YES];
    
    UIImageView*test6=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 180, 180)];
    test6.image=img;
    UIGraphicsBeginImageContext(CGSizeMake(180, 180));
    [test4.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*together6Image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    NSString*test6Str=[[NSBundle mainBundle]pathForResource:@"AppIcon60x60@3x" ofType:@"png"];
    NSString*test6Str=[NSString stringWithFormat:@"%@AppIcon60x60@3x.png",mutablPath];
    [UIImagePNGRepresentation(together6Image) writeToFile:test6Str atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
