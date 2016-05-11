//
//  ViewController.m
//  PostImageDemo
//
//  Created by 英策网络科技 on 16/4/22.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "RequestPostUploadHelper.h"
#define URL @"http://heng-s-micro-mall.hixiaoyuan.cn/addons/ewei_shop/core/api/shop_set_submit.php?uid=19&change=logo"
@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImage*img;
    UIImageView*imageview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    img=[UIImage imageNamed:@"rewards1.jpg"];
    imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageview.image=img;
    imageview.userInteractionEnabled=YES;
    [self.view addSubview:imageview];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [imageview addGestureRecognizer:tap];
    
 
}
-(void)tap{
//    UIImage*image=[UIImage imageNamed:@"testone"];
//    NSString*file=[RequestPostUploadHelper saveImage:image WithName:@"file"];
//    [RequestPostUploadHelper postRequestWithURL:URL postParems:nil picFilePath:[NSMutableArray arrayWithObject:file] picFileName:[NSMutableArray arrayWithObject:@"file.png"] isUserPic:NO callback:nil];
//    imageview.image=image;
    
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
    [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
    controller.mediaTypes = mediaTypes;
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
     [picker dismissViewControllerAnimated:YES completion:^{
         UIImage*image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
         imageview.image=image;
         NSString*file=[RequestPostUploadHelper saveImage:image WithName:@"file1"];
         [RequestPostUploadHelper postRequestWithURL:URL postParems:nil picFilePath:[NSMutableArray arrayWithObject:file] picFileName:[NSMutableArray arrayWithObject:@"file1"] isUserPic:YES callback:nil];
         
      }];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
