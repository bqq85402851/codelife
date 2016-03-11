//
//  ViewController.m
//  iCarousel
//
//  Created by 英策网络科技 on 16/3/11.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <iCarousel.h>
#define PAGE_OFFSET 50
// 屏幕宽高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//普通的颜色值
#define UIColorRGB(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
// 随机色
#define RandomColor UIColorRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface ViewController ()<iCarouselDelegate,iCarouselDataSource>
{
    iCarousel*iCa;
}
@property (nonatomic,strong) NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat height = ScreenWidth - 2 *PAGE_OFFSET;
    iCa=[[iCarousel alloc] initWithFrame:CGRectMake(0, (ScreenHeight-height)*0.5, ScreenWidth, height)];
    iCa.delegate = self;
    iCa.dataSource = self;
    iCa.bounces = NO;
    iCa.pagingEnabled = YES;
    iCa.type = iCarouselTypeCustom;
    [self.view addSubview:iCa];
}
- (NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
        for (int a=1; a<6; a++) {
            [_dataList addObject:[NSString stringWithFormat:@"%d.png",a]];
        }
    }
    return _dataList;
}

-(UIView*)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (view == nil) {
        CGFloat viewWidth = ScreenWidth - 2*PAGE_OFFSET;
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewWidth)];
    }
    
    ((UIImageView *)view).image = [UIImage imageNamed:[self.dataList objectAtIndex:index]];
    
    return view;
}
-(CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform{
    static CGFloat max_sacle = 1.0f;
    static CGFloat min_scale = 0.6f;
    if (offset <= 1 && offset >= -1) {
        float tempScale = offset < 0 ? 1+offset : 1-offset;
        float slope = (max_sacle - min_scale) / 1;
        
        CGFloat scale = min_scale + slope*tempScale;
        transform = CATransform3DScale(transform, scale, scale, 1);
    }else{
        transform = CATransform3DScale(transform, min_scale, min_scale, 1);
    }
    
    return CATransform3DTranslate(transform, offset * iCa.itemWidth * 1.4, 0.0, 0.0);
}

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.dataList.count;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
