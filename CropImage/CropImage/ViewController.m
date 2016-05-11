//
//  ViewController.m
//  CropImage
//
//  Created by 英策网络科技 on 16/4/21.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "VPImageCropperViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "BXQCropperVC.h"
#define ORIGINAL_MAX_WIDTH 640.0f
typedef enum {
     ONT_TYPE,
     TWO_TYPE
}TYPE;
@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,VPImageCropperDelegate,BXQCropperDelegate>
{
    TYPE type;
}
@property(nonatomic,strong)UIImageView*demoImage;
@property(nonatomic,strong)UIImageView*demoTwoImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.demoImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200,  200)];
    self.demoImage.userInteractionEnabled=YES;
    self.demoImage.layer.borderColor=[UIColor blackColor].CGColor;
    self.demoImage.layer.borderWidth=0.5f;
    [self.view addSubview:_demoImage];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [self.demoImage addGestureRecognizer:tap];
    
    self.demoTwoImage=[[UIImageView alloc]initWithFrame:CGRectMake(200,200, 200,  200)];
    self.demoTwoImage.userInteractionEnabled=YES;
    self.demoTwoImage.center=self.view.center;
    self.demoTwoImage.layer.borderColor=[UIColor blackColor].CGColor;
    self.demoTwoImage.layer.borderWidth=0.5f;
    [self.view addSubview:_demoTwoImage];
    
    UITapGestureRecognizer*tapTwo=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTwo)];
    [self.demoTwoImage addGestureRecognizer:tapTwo];
}
-(void)click{
    type=ONT_TYPE;
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    [controller setEditing:YES animated:YES];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
//    [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
//    controller.mediaTypes = mediaTypes;
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}
-(void)clickTwo{
    type=TWO_TYPE;
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
        //得到图片
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        self.demoImage.image=image;

        image=[self imageByScalingToMaxSize:image];
//            上传头像
//            裁剪
        if (type==ONT_TYPE) {
            VPImageCropperViewController*imgEditorVC=[[VPImageCropperViewController alloc]initWithImage:image cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
            imgEditorVC.delegate=self;
            [self presentViewController:imgEditorVC animated:YES completion:^{
            }];
        }else{
            BXQCropperVC*imagEditorVC=[[BXQCropperVC alloc]initWithImage:image cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width)];
            imagEditorVC.delegate=self;
            [self presentViewController:imagEditorVC animated:YES completion:^{
            }];
        }

    }];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark VPImageCropperDelegate
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        self.demoImage.image=editedImage;
    }];
}
- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}
#pragma mark BXQCropperDelegate
-(void)imageCropperController:(BXQCropperVC *)cropperViewController didFinished:(UIImage *)editedImage{
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
          self.demoTwoImage.image=editedImage;
    }];
}
-(void)imageCropperControllerDidCancle:(BXQCropperVC *)cropperViewController{
     [cropperViewController dismissViewControllerAnimated:YES completion:^{
    
     }];
}
#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}
- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
