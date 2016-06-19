//
//  RTDemoStyle1ViewController.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import "RTDemoStyle1ViewController.h"

#import "RTDemoItemComponent.h"

@interface RTDemoStyle1ViewController () <RTActionHeaderComponentDelegate>

@end

@implementation RTDemoStyle1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.components = @[[RTDemoItemComponent componentWithTableView:self.tableView
                                                           delegate:self]];
}


@end
