//
//  RequestPostUploadHelper.m
//  BanYouBao
//
//  Created by zhengyumin on 15/10/28.
//  Copyright (c) 2015年 banyoubao. All rights reserved.
//

#import "RequestPostUploadHelper.h"

@implementation RequestPostUploadHelper

static NSString * const FORM_FLE_INPUT_Image = @"img";
static NSString * const FORM_FLE_INPUT_Face = @"logo";
+ (NSString *)postRequestWithURL: (NSString *)url  // IN
                      postParems: (NSMutableDictionary *)postParems // IN 提交参数据集合
                     picFilePath: (NSMutableArray *)picFilePath  // IN 上传图片路径
                     picFileName: (NSMutableArray *)picFileName // IN 上传图片名称
                       isUserPic:(BOOL)isUserPic//是否用户头像修改
                        callback:(CallBackBlock)callback
{
    
    NSString *TWITTERFON_FORM_BOUNDARY = @"0xKhTmLbOuNdArY";
    
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];//分界线 --AaB03x
   
    //NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary]; //结束符 AaB03x--
    NSMutableData *myRequestData=[NSMutableData data]; //声明myRequestData，用来放入http body
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"\r\n%@",MPboundary];    //声明结束符：--AaB03x--
    NSString *end = @"\r\n";
    //遍历数组，添加多张图片
    for (int i = 0; i < picFilePath.count; i ++) {
        NSData* data;
        UIImage *image=[UIImage imageWithContentsOfFile:[picFilePath objectAtIndex:i]];
        //判断图片是不是png格式的文件
        if (UIImagePNGRepresentation(image)) {
            //返回为png图像。
            data = UIImagePNGRepresentation(image);
        }else {
            //返回为JPEG图像。
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        
        //所有字段的拼接都不能缺少，要保证格式正确
        
        NSMutableString *fileTitle=[[NSMutableString alloc]init];
        
        [fileTitle appendFormat:@"%@\r\n",MPboundary];
        
        //声明pic字段，要上传的文件名和key，服务器端用file接收
        NSString *input = isUserPic?FORM_FLE_INPUT_Face:FORM_FLE_INPUT_Image;
        [fileTitle appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",input,[NSString stringWithFormat:@"image%d.png",i+1]];
        //声明上传文件的格式
        [fileTitle appendFormat:@"Content-Type: image/jpge,image/gif, image/jpeg, image/pjpeg, image/pjpeg\r\n\r\n"];
        
        [myRequestData appendData:[fileTitle dataUsingEncoding:NSUTF8StringEncoding]];
        [myRequestData appendData:data];
        [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    [myRequestData appendData:[endMPboundary dataUsingEncoding:NSUTF8StringEncoding]];//加入结束符--AaB03x--

    //根据url初始化request
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:10];
 
    //参数的集合的所有key的集合
    NSArray *keys= [postParems allKeys];
    
    //添加其他参数
    for(int i=0;i<[keys count];i++)
    {
        
        NSMutableString *body=[[NSMutableString alloc]init];
        
        NSString *key=[keys objectAtIndex:i];//得到当前key
       
        [body appendFormat:@"%@\r\n",MPboundary]; //添加分界线，换行
        
        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];//添加字段名称，换2行
        [body appendFormat:@"%@\r\n",[postParems objectForKey:key]];//添加字段的值
        [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"添加字段的值==%@",[postParems objectForKey:key]);
    }
    
    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
    //设置HTTPHeader
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[myRequestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:myRequestData];
    [request setHTTPMethod:@"POST"];
    
    
    NSHTTPURLResponse *urlResponese = nil;
    NSError *error = [[NSError alloc]init];
    NSData* resultData = [NSURLConnection sendSynchronousRequest:request   returningResponse:&urlResponese error:&error];
    NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
    NSString* result= [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",[dic[@"data"] objectForKey:@"message"]);
    if([urlResponese statusCode] >=200&&[urlResponese statusCode]<300){
        NSNumber* respond = dic[@"error"];
        if ([respond integerValue] != 0) {
                if (callback) {
                    callback(NO,[[dic objectForKey:@"data"] objectForKey:@"message"],nil);
                }
        }else if([respond integerValue]==0){
            if (callback) {
                    callback(YES,[[dic objectForKey:@"data"] objectForKey:@"message"],nil);
            }
        }
        return result;
    }else if (error) {
        if (callback) {
            callback(NO,nil,error);
        }
        return nil;
    }
    else
        return nil;

}

/**
 * 修发图片大小
 */
+ (UIImage *) imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize{
    newSize.height=image.size.height*(newSize.width/image.size.width);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  newImage;
    
}

/**
 * 保存图片
 */
+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName{
    NSData* imageData;
    
    //判断图片是不是png格式的文件
    if (UIImagePNGRepresentation(tempImage)) {
        //返回为png图像。
        imageData = UIImagePNGRepresentation(tempImage);
    }else {
        //返回为JPEG图像。
        imageData = UIImageJPEGRepresentation(tempImage, 1.0);
    }
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString* documentsDirectory = [paths objectAtIndex:0];
    
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    
    NSArray *nameAry=[fullPathToFile componentsSeparatedByString:@"/"];
    NSLog(@"===fullPathToFile===%@",fullPathToFile);
    NSLog(@"===FileName===%@",[nameAry objectAtIndex:[nameAry count]-1]);
    
    [imageData writeToFile:fullPathToFile atomically:NO];
    return fullPathToFile;
}

/**
 * 生成GUID
 */
+ (NSString *)generateUuidString{
    // create a new UUID which you own
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    
    // create a new CFStringRef (toll-free bridged to NSString)
    // that you own
    NSString *uuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));

    
    return uuidString;
}
@end