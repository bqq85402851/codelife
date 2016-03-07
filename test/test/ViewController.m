//
//  ViewController.m
//  test
//
//  Created by 英策网络科技 on 16/1/13.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAsset.h>
#import <AssetsLibrary/ALAssetRepresentation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString*tipTextWhenNoPhotosAuthorization;
    ALAuthorizationStatus authorizationStatus=[ALAssetsLibrary authorizationStatus];
    if (authorizationStatus==ALAuthorizationStatusRestricted||authorizationStatus==ALAuthorizationStatusDenied) {
        NSDictionary*mainInfoDictionary=[[NSBundle mainBundle]infoDictionary];
        NSString*appName=[mainInfoDictionary objectForKey:@"CFBundleDisplayName"];
         [NSString stringWithFormat:@"请在设备的\"设置-隐私-照片\"选项中，允许%@访问你的手机相册", appName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
