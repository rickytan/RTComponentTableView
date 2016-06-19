//
//  RTHeaderComponent.m
//  Pods
//
//  Created by ricky on 16/6/19.
//
//

#import "RTHeaderComponent.h"

@implementation RTHeaderComponent

- (void)registerWithTableView:(UITableView *)tableView
{
    [super registerWithTableView:tableView];
    [tableView registerClass:[UITableViewHeaderFooterView class]
forHeaderFooterViewReuseIdentifier:self.headerIdentifier];
}

- (CGFloat)heightForComponentHeader
{
    return 36.f;
}

- (__kindof UIView *)headerForTableView:(UITableView *)tableView
{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerIdentifier];
    header.textLabel.text = self.title;
    header.textLabel.textColor = self.titleColor ?: [UIColor darkGrayColor];
    self.accessoryView.frame = [self actionRectForBounds:header.bounds];
    [header.contentView addSubview:self.accessoryView];
    return header;
}

- (void)willDisplayHeader:(__kindof UIView *)header
{
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)header;
    headerView.textLabel.font = self.titleFont ?: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.accessoryView.frame = [self actionRectForBounds:header.bounds];
}

- (CGRect)actionRectForBounds:(CGRect)bounds
{
    CGSize size = [self.accessoryView sizeThatFits:bounds.size];
    return CGRectMake(bounds.size.width - size.width - 8.f, (bounds.size.height - size.height) / 2, size.width, size.height);
}

@end
