//
//  ViewController.m
//  InterViewAll
//
//  Created by 英策网络科技 on 16/9/6.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"

#import "CABasicAnimationVC.h"
#import "BezierVC.h"
#import "SqliteVC.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView*mainTableView;

@property(nonatomic,strong)NSArray*sectionArr;
@property(nonatomic,strong)NSArray*animationArr;
@property(nonatomic,strong)NSArray*dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20,SCREEN_WIDTH, SCREEN_HEIGHT-20) style:UITableViewStylePlain];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;
    [self.view addSubview:_mainTableView];
    
    self.sectionArr=@[@"动画",@"数据"];
    self.animationArr=@[@"CABasicAnimation基础动画",@"贝塞尔曲线"];
    self.dataArr=@[@"数据库操作sqlite"];
}
#pragma mark UITableViewDataSource,UITableViewDelegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellID=@"cellID";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text=_animationArr[indexPath.row];
            break;
        case 1:
            cell.textLabel.text=_dataArr[indexPath.row];
            break;
        default:
            break;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:{
                    //基础动画
                    CABasicAnimationVC*vc=[[CABasicAnimationVC alloc]init];
                    vc.title=_animationArr[indexPath.row];
                    [self.navigationController pushViewController:vc animated:YES];
                    break;
                }
                case 1:{
                    //贝塞尔曲线
                    BezierVC*vc=[[BezierVC alloc]init];
                    vc.title=_animationArr[indexPath.row];
                    [self.navigationController pushViewController:vc animated:YES];
                    break;
                }
                default:
                    break;
            }
            break;
        case 1:{
            switch (indexPath.row) {
                case 0:{
                    //数据库 sqlite
                    SqliteVC*vc=[[SqliteVC alloc]init];
                    vc.title=_dataArr[indexPath.row];
                    [self.navigationController pushViewController:vc animated:YES];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return _animationArr.count;
            break;
        case 1:
            return _dataArr.count;
            break;
        default:
            break;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView*headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    UILabel*sectionTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, 50)];
    sectionTitleLabel.font=[UIFont systemFontOfSize:20];
    sectionTitleLabel.text=_sectionArr[section];
    [headView addSubview:sectionTitleLabel];
    return headView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
