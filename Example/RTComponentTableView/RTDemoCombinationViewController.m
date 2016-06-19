//
//  RTDemoCombinationViewController.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import "RTDemoCombinationViewController.h"

#import "RTDemoImageItemComponent.h"
#import "RTDemoItemComponent.h"
#import "RTDemoTagsComponent.h"

@interface RTDemoCombinationViewController () <RTActionHeaderComponentDelegate>

@end

@implementation RTDemoCombinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    RTDemoTagsComponent *tags = [RTDemoTagsComponent componentWithTableView:self.tableView
                                                                   delegate:self];

    self.components = @[tags,
                        [RTDemoImageItemComponent componentWithTableView:self.tableView
                                                                delegate:self],
                        [RTDemoImageItemComponent componentWithTableView:self.tableView
                                                                delegate:self],
                        [RTDemoItemComponent componentWithTableView:self.tableView
                                                           delegate:self]];

    [tags reloadDataWithTableView:self.tableView
                        inSection:0];
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
