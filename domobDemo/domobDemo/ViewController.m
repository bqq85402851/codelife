//
//  ViewController.m
//  domobDemo
//
//  Created by 英策网络科技 on 16/6/7.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "DMAdView.h"
@interface ViewController ()<DMAdViewDelegate>
{
    DMAdView*dmAdView;
}
@end

@implementation ViewController
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        dmAdView=[[DMAdView alloc]initWithPublisherId:@"56OJ2F6ouNxDe3D6MW" placementId:@"16TLPtuvAp9g4NUUQBXPN-bi"];
        dmAdView.frame=CGRectMake(0, 0, FLEXIBLE_SIZE.width, FLEXIBLE_SIZE.height);
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dmAdView=[[DMAdView alloc]initWithPublisherId:@"56OJ2F6ouNxDe3D6MW" placementId:@"16TLPtuvAp9g4NUUQBXPN-bi"];
    dmAdView.frame=CGRectMake(0, 0, FLEXIBLE_SIZE.width, FLEXIBLE_SIZE.height);
    dmAdView.delegate=self;
    dmAdView.rootViewController=self;
    [self.view addSubview:dmAdView];
    [dmAdView loadAd];
}
-(void)dmAdViewSuccessToLoadAd:(DMAdView *)adView{
    NSLog(@"广告加载成功");
}
-(void)dmAdViewFailToLoadAd:(DMAdView *)adView withError:(NSError *)error{
    NSLog(@"%@",error);
}
-(void)dmWillPresentModalViewFromAd:(DMAdView *)adView{
    NSLog(@"打开了内置浏览器");
}
-(void)dmDidDismissModalViewFromAd:(DMAdView *)adView{
    NSLog(@"打开的内置浏览器被关闭了");
}
-(void)dmApplicationWillEnterBackgroundFromAd:(DMAdView *)adView{
    NSLog(@"跳转了Appstore");
}
-(void)dealloc{
    dmAdView.delegate=nil;
    dmAdView.rootViewController=nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
