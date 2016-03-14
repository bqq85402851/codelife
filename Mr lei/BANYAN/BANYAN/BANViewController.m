//
//  BANViewController.m
//  BANYAN
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 BANYAN. All rights reserved.
//

#import "BANViewController.h"
#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"

@interface BANViewController ()

@end

@implementation BANViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)segmentedAction:(id)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0:
            self.view.backgroundColor = [UIColor cyanColor];
            break;
            case 1:
            self.view.backgroundColor = [UIColor yellowColor];
        default:
            break;
    }
}

- (IBAction)msgClick:(id)sender {
    ViewControllerThree * three = [[ViewControllerThree alloc]init];
    [self.navigationController pushViewController:three animated:YES];
}
@end
