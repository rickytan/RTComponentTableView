//
//  RTDemoItemComponent.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import "RTDemoItemComponent.h"

#import "RTItemTableViewCell.h"

@implementation RTDemoItemComponent

- (void)registerWithTableView:(UITableView *)tableView
{
    [super registerWithTableView:tableView];

    [tableView registerClass:[RTItemTableViewCell class]
      forCellReuseIdentifier:self.cellIdentifier];
}

- (NSInteger)numberOfItems
{
    return 6;
}

- (CGFloat)heightForComponentItemAtIndex:(NSUInteger)index
{
    return 64.f;
}

- (__kindof UITableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    RTItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                                forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[@(indexPath.row % 5 + 1) stringValue]];
    return cell;
}

@end
