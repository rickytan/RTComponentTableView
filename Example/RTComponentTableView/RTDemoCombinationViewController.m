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
#import "RTDemoBannerComponent.h"

@interface RTDemoCombinationViewController () <RTActionHeaderComponentDelegate>

@end

@implementation RTDemoCombinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    RTDemoTagsComponent *tags = [RTDemoTagsComponent componentWithTableView:self.tableView
                                                                   delegate:self];
    self.components = @[tags,
                        [RTDemoImageItemComponent componentWithTableView:self.tableView
                                                                delegate:self],
                        [RTDemoBannerComponent componentWithTableView:self.tableView
                                                             delegate:self],
                        [RTDemoImageItemComponent componentWithTableView:self.tableView
                                                                delegate:self],
                        [RTDemoItemComponent componentWithTableView:self.tableView
                                                           delegate:self]];

    [tags reloadDataWithTableView:self.tableView
                        inSection:0];
}

#pragma mark - Component Delegate

- (void)tableComponent:(id<RTTableComponent>)component didTapItemAtIndex:(NSUInteger)index
{
    [[[UIAlertView alloc] initWithTitle:@"Item"
                                message:[NSString stringWithFormat:@"Index: %lu", (unsigned long)index]
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (void)tableComponent:(id<RTTableComponent>)component didTapActionButton:(UIButton *)actionButton
{
    if ([component isKindOfClass:[RTDemoTagsComponent class]]) {
        [component reloadDataWithTableView:self.tableView
                                 inSection:0];
    }
    else {
        [[[UIAlertView alloc] initWithTitle:@"Action Button"
                                    message:actionButton.titleLabel.text
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

@end
