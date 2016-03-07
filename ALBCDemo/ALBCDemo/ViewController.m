//
//  ViewController.m
//  ALBCDemo
//
//  Created by 英策网络科技 on 15/12/8.
//  Copyright © 2015年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <ALBBTradeSDK/TaeSDK+ALBBTrade.h>
#import <ALBBTradeSDK/ALBBItemService.h>
#import <UIImageView+AFNetworking.h>
#import <MBProgressHUD.h>
static NSString*const ALMM_STRING=@"mm_29216618_0_0";
@interface ViewController ()
@property(nonatomic)id<ALBBItemService> itemService;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton*testButton=[UIButton buttonWithType:UIButtonTypeSystem];
    testButton.frame=CGRectMake(100, 100, 100, 30);
    [testButton setTitle:@"clickme" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
}
-(void)click{
_itemService=[[TaeSDK sharedInstance] getService:@protocol(ALBBItemService)];
    NSDictionary *params=@{@"_viewType":@"taobaoNative"};
    TaeTaokeParams*taoKeParams=[[TaeTaokeParams alloc]init];
    taoKeParams.pid=ALMM_STRING;
    [_itemService showTaoKeItemDetailByItemId:self isNeedPush:NO webViewUISettings:nil itemId:[[[NSNumberFormatter alloc]init]numberFromString:@"45587889166"] itemType:2 params:params taoKeParams:taoKeParams tradeProcessSuccessCallback:^(TaeTradeProcessResult *tradeProcessResult) {
        NSLog(@"交易成功");
    } tradeProcessFailedCallback:^(NSError *error) {
        NSLog(@"交易失败:%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
