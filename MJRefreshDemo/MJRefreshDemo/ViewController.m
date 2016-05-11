//
//  ViewController.m
//  MJRefreshDemo
//
//  Created by 英策网络科技 on 16/5/7.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import <MJRefresh.h>
#import <AFNetworking.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger page;
}
@property(nonatomic,strong)UITableView*mainTableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    page=1;
    self.dataArray=[NSMutableArray array];
    self.mainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, self.view.frame.size.height-300) style:UITableViewStylePlain];
    self.mainTableView.dataSource=self;
    self.mainTableView.delegate=self;
    self.mainTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.mainTableView];
    
    MJRefreshGifHeader*m_head=[[MJRefreshGifHeader alloc]init];
    [m_head setRefreshingTarget:self refreshingAction:@selector(refreshData)];
    self.mainTableView.mj_header=m_head;
    
    MJRefreshAutoFooter*m_foot=[[MJRefreshAutoFooter alloc]init];
    [m_foot setRefreshingTarget:self refreshingAction:@selector(addData)];
    [m_foot setAutomaticallyRefresh:YES];
    [m_foot setTriggerAutomaticallyRefreshPercent:0.8];
    self.mainTableView.mj_footer=m_foot;
    
    [self.mainTableView.mj_header beginRefreshing];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellID=@"cellID";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text=self.dataArray[indexPath.row];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(void)addData{
    page++;
    [self requestHttp];
}
-(void)refreshData{
    page=1;
    [self.dataArray removeAllObjects];
    [self requestHttp];
}
-(void)requestHttp{
    NSDictionary*dic=[NSDictionary dictionaryWithObjectsAndKeys:@"73",@"uid",@"goodsids",@"show",[NSNumber numberWithInteger:page],@"page", nil];
    AFHTTPRequestOperationManager*manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [manager GET:@"http://heng-s-micro-mall.hixiaoyuan.cn/addons/ewei_shop/core/api/shopmanage.php" parameters:dic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary*dataDic=[responseObject objectForKey:@"data"];
        NSArray*secondArr=dataDic[@"goods"];
        [secondArr enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.dataArray addObject:obj[@"title"]];
            [self.mainTableView reloadData];
            [self.mainTableView.mj_header endRefreshing];
            [self.mainTableView.mj_footer endRefreshing];
        }];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
