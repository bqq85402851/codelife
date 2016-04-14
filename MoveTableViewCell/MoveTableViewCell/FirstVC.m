//
//  FirstVC.m
//  MoveTableViewCell
//
//  Created by 英策网络科技 on 16/3/28.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "FirstVC.h"
#import <MJRefresh.h>
@interface FirstVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger page;
}
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    page=20;
    [self.mainTableView setEditing:YES animated:YES];
    MJRefreshAutoFooter*foot=[[MJRefreshAutoFooter alloc]init];
    [foot setRefreshingTarget:self refreshingAction:@selector(addData)];
    [foot setAutomaticallyRefresh:YES];
    [foot setTriggerAutomaticallyRefreshPercent:-80];
    self.mainTableView.mj_footer=foot;
    
    NSMutableArray*Arr=[NSMutableArray array];
    for (int a=1; a<14; a++) {
        [Arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"test_%d",a]]];
    }
    for (int a=13; a>0; a--) {
       [Arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"test_%d",a]]];
    }
    
    MJRefreshGifHeader*head=[[MJRefreshGifHeader alloc]init];
    head.lastUpdatedTimeLabel.hidden=YES;
    head.stateLabel.hidden=YES;
    [head setRefreshingTarget:self refreshingAction:@selector(refreshData)];
    [head setImages:@[[UIImage imageNamed:@"test"]] forState:MJRefreshStateIdle];
    [head setImages:Arr duration:0.5 forState:MJRefreshStateRefreshing];
    self.mainTableView.mj_header=head;

}
-(void)addData{
    NSLog(@"refreshing");
    page+=20;
    [self.mainTableView reloadData];
 
}
-(void)refreshData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mainTableView.mj_header endRefreshing];
    });
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return page;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellID=@"cellID";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{

}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
