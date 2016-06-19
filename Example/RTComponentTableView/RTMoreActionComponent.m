//
//  RTMoreActionComponent.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import "RTMoreActionComponent.h"

@implementation RTMoreActionComponent

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<RTBaseComponentDelegate>)delegate
{
    self = [super initWithTableView:tableView delegate:delegate];
    if (self) {
        self.actionTitle = @"More >";
    }
    return self;
}

@end
