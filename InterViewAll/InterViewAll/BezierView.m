//
//  BezierView.m
//  InterViewAll
//
//  Created by 英策网络科技 on 16/9/7.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "BezierView.h"
//http://blog.csdn.net/jeffasd/article/details/50603034
//  2016年09月08日16:40:22  画圆总是莫名其妙的出现一条线

typedef enum {
    Point_Bezier,//随便画~
    Line_Bezier,//直线
    Circle_Bezier,//非实心圆
    Circle_Fill_Bezier,//实心圆
    Rectangle_Bezier,//非实心矩形
    Rectangle_Fill_Bezier//实心矩形
}BezierType;
#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
@interface BezierView()
{
    CGPoint startPoint;
    CGPoint endPoint;
    UIColor*color;
    UIBezierPath*path;
    UIBezierPath*cPath;
    BOOL isFill;
    BezierType type;
}
@end
@implementation BezierView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        startPoint=CGPointMake(0, 0);
        endPoint=CGPointMake(0, 0);
        color=[UIColor blackColor];
        
        path=[UIBezierPath bezierPath];
        path.lineWidth=5.0;
        path.lineCapStyle=kCGLineCapRound;
        path.lineJoinStyle=kCGLineCapRound;
        
        type=Point_Bezier;
        [self bezierBrush];
        [self colorBack];
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    [color set];
    
    if (type==Line_Bezier) {
        UIBezierPath*lpath=[UIBezierPath bezierPath];
        lpath.lineWidth=5.0;
        lpath.lineCapStyle=kCGLineCapRound;
        lpath.lineJoinStyle=kCGLineCapRound;
        [lpath moveToPoint:startPoint];
        [lpath addLineToPoint:endPoint];
        [lpath stroke];
    }
    [path stroke];
    //[cPath stroke];
    if (type==Circle_Fill_Bezier) {
        [path fill];
    }
    
//    UIBezierPath*rPath=[UIBezierPath bezierPathWithRect:CGRectMake(100, 84, 100, 100)];
//    rPath.lineWidth=5.0;
//    rPath.lineCapStyle=kCGLineCapRound;
//    rPath.lineJoinStyle=kCGLineCapRound;
//    [rPath stroke];
//    [rPath fill];
//    
//    UIBezierPath*mPath=[UIBezierPath bezierPath];
//    mPath.lineWidth=5.0;
//    mPath.lineJoinStyle=kCGLineCapRound;
//    mPath.lineCapStyle=kCGLineCapRound;
//    [mPath moveToPoint:CGPointMake(100.0, 250)];
//    
//    [mPath addLineToPoint:CGPointMake(200.0, 290.0)];
//    [mPath addLineToPoint:CGPointMake(160, 390)];
//    [mPath addLineToPoint:CGPointMake(40.0, 390)];
//    [mPath addLineToPoint:CGPointMake(0.0, 290.0)];
//    [mPath closePath]; //第五条线通过调用closePath方法得到的
//    [mPath stroke];
//    
//    UIBezierPath*cPath=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(250, 250, 100, 100)];
//    cPath.lineWidth=5.0;
//    cPath.lineCapStyle=kCGLineCapRound;
//    cPath.lineJoinStyle=kCGLineCapRound;
//    [cPath stroke];
//    
//    UIBezierPath*aPath=[UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 400) radius:50 startAngle:0 endAngle:pi clockwise:YES];
//    aPath.lineJoinStyle=kCGLineCapRound;
//    aPath.lineCapStyle=kCGLineCapRound;
//    aPath.lineWidth=5.0;
//    [aPath stroke];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch*touch=[touches anyObject];
    startPoint=[touch locationInView:[touch view]];
    endPoint=startPoint;
    [path moveToPoint:startPoint];
    //[self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch*touch=[touches anyObject];
    endPoint=[touch locationInView:[touch view]];
    //[self drawCircle];
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch*touch=[touches anyObject];
    endPoint=[touch locationInView:[touch view]];
    switch (type) {
        case Point_Bezier:{
            
            break;
        }
        case Line_Bezier:{
            [path addLineToPoint:endPoint];
            break;
        }
        case Rectangle_Bezier:{
            
            break;
        }
        case Rectangle_Fill_Bezier:{
            
            break;
        }
        case Circle_Bezier:{
            [path addArcWithCenter:CGPointMake(100, 200) radius:50 startAngle:0 endAngle:2*pi clockwise:YES];
            break;
        }
        case Circle_Fill_Bezier:{
            [path addArcWithCenter:CGPointMake(100, 200) radius:50 startAngle:0 endAngle:2*pi clockwise:YES];

            break;
        }
        default:
            break;
    }

    [self setNeedsDisplay];
}
-(void)drawCircle{
    CGFloat X=endPoint.x-startPoint.x;
    CGFloat Y=endPoint.y-startPoint.y;
    if (X<0&&Y>0) {
        cPath=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(startPoint.x, startPoint.y, (-X)>Y?X:(-Y), (-X)>Y?(-X):Y)];
    }else if (Y<0&&X>0) {
        cPath=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(startPoint.x, startPoint.y, X>(-Y)?X:(-Y), X>(-Y)?(-X):Y)];
    }else if (Y<0&&X<0){
        cPath=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(startPoint.x, startPoint.y, X<Y?X:Y, X<Y?X:Y)];
    }else{
       // cPath=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(startPoint.x, startPoint.y, X>Y?X:Y, X>Y?X:Y)];
        [path addArcWithCenter:CGPointMake(startPoint.x+X/2.0, startPoint.y+Y/2.0) radius:X>Y?(X/2.0):(Y/2.0) startAngle:0 endAngle:pi clockwise:NO];
    }
//    cPath.lineWidth=5.0;
//    cPath.lineCapStyle=kCGLineCapRound;
//    cPath.lineJoinStyle=kCGLineCapRound;
//    [path appendPath:cPath];
}
//画笔选择
-(void)bezierBrush{
    NSArray*bezierArr=@[@"画笔",@"直线",@"矩形",@"实心矩形",@"圆",@"实心圆"];
    UIView*bezierView=[[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-44, self.bounds.size.width, 44)];
    bezierView.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];
    [self addSubview:bezierView];
    
    UIScrollView*bezierScrollView=[[UIScrollView alloc]initWithFrame:bezierView.frame];
    bezierScrollView.contentSize=CGSizeMake(62*bezierArr.count, 0);
    [self addSubview:bezierScrollView];
    
    for (int i=0; i<bezierArr.count; i++) {
        UIButton*bezierButton=[UIButton buttonWithType:UIButtonTypeSystem];
        [bezierButton setTitle:bezierArr[i] forState:UIControlStateNormal];
        bezierButton.frame=CGRectMake(i*62, 0, 60, 44);
        bezierButton.tag=100+i;
        bezierButton.layer.borderColor=[UIColor blackColor].CGColor;
        bezierButton.layer.borderWidth=0.5;
        bezierButton.layer.cornerRadius=5;
        [bezierButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bezierButton addTarget:self action:@selector(bezierBrush:) forControlEvents:UIControlEventTouchUpInside];
        [bezierScrollView addSubview:bezierButton];
    }
}
//画笔颜色选择
-(void)colorBack{
    UIView*colorView=[[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width-44, (self.bounds.size.height-49*9)/2.0, 44,5+49*9)];
    colorView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    [self addSubview:colorView];
    
    NSArray*colorArr=@[[UIColor redColor],[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor cyanColor],[UIColor blueColor],[UIColor purpleColor],[UIColor blackColor],[UIColor whiteColor]];
    
    UIScrollView*colorScrollView=[[UIScrollView alloc]initWithFrame:colorView.frame];
    colorScrollView.backgroundColor=[UIColor clearColor];
    colorScrollView.contentSize=CGSizeMake(0, 5+49*colorArr.count);
    [self addSubview:colorScrollView];
    
    for (int i=0; i<9; i++) {
        UIButton*bezierButton=[UIButton buttonWithType:UIButtonTypeSystem];
        bezierButton.frame=CGRectMake(0, 5+i*49, 44, 44);
        bezierButton.tag=200+i;
        bezierButton.layer.cornerRadius=22;
        bezierButton.backgroundColor=(UIColor*)colorArr[i];
        [bezierButton addTarget:self action:@selector(color:) forControlEvents:UIControlEventTouchUpInside];
        [colorScrollView addSubview:bezierButton];
    }
}
#pragma mark Action
-(void)bezierBrush:(UIButton*)sender{
    switch (sender.tag-100) {
        case 0:{
            //画笔
            type=Point_Bezier;
            break;
        }
        case 1:{
            //直线
            type=Line_Bezier;
            break;
        }
        case 2:{
            //矩形
            type=Rectangle_Bezier;
            break;
        }
        case 3:{
            //实心矩形
            type=Rectangle_Fill_Bezier;
            break;
        }
        case 4:{
            //圆
            type=Circle_Bezier;
            break;
        }
        case 5:{
            //实心圆
            type=Circle_Fill_Bezier;
            break;
        }
        default:
            break;
    }
}
-(void)color:(UIButton*)sender{
    switch (sender.tag-200) {
        case 0:{
            color=[UIColor redColor];
            break;
        }
        case 1:{
            color=[UIColor orangeColor];
            break;
        }
        case 2:{
            color=[UIColor yellowColor];
            break;
        }
        case 3:{
            color=[UIColor greenColor];
            break;
        }
        case 4:{
            color=[UIColor cyanColor];
            break;
        }
        case 5:{
            color=[UIColor blueColor];
            break;
        }
        case 6:{
            color=[UIColor purpleColor];
            break;
        }
        case 7:{
            color=[UIColor blackColor];
            break;
        }
        case 8:{
            color=[UIColor whiteColor];
            break;
        }
        default:
            break;
    }
}
@end
