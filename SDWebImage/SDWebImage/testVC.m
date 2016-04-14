//
//  testVC.m
//  SDWebImage
//
//  Created by 英策网络科技 on 16/4/14.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "testVC.h"
#import "SDUImage.h"
@interface testVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property(strong,nonatomic)NSArray*dataArr;
@end

@implementation testVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArr=@[@"http://heng-s-micro-mall.hixiaoyuan.cn/attachment/images/16/2016/04/lb1C8njj55UuuNhzINuh751HCJZnl8.png",@"http://heng-s-micro-mall.hixiaoyuan.cn/attachment/images/16/2016/04/lyTm5VV91vtUjczt64kVVu4MKJNtQ1.jpeg",@"http://heng-s-micro-mall.hixiaoyuan.cn/attachment/images/16/2016/04/Z45a4i5aafpcA4r14p5IKk4cv4a14l.png",@"http://heng-s-micro-mall.hixiaoyuan.cn/attachment/images/16/2016/04/k3zna38eQdF0G01Kr93aNuE0dG2e3q.png",@"http://heng-s-micro-mall.hixiaoyuan.cn/attachment/images/globalwVRZTw686C8ZW7vVzzWv6VVvzCva5C.jpg",@"http://heng-s-micro-mall.hixiaoyuan.cn/attachment/images/16/2016/04/A3Ht35533e63prPiWpjpfwzteTWIxo.jpg",@"http://heng-s-micro-mall.hixiaoyuan.cn/attachment/images/16/2016/04/KI0i9O9mo55i400o99Il65t8LiOOmo.jpg",@"http://heng-s-micro-mall.hixiaoyuan.cn/attachment/images/16/2016/04/MrY2eer824ry8Is82FTYssA42S44FE.jpg"];
}
#pragma mark UITableViewDelegate,UITableViewDataSource
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellID=@"cellID";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    [cell.imageView sd_setImageUrl:_dataArr[indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UIScreen mainScreen]bounds].size.height/4.0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
