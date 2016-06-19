//
//  RTItemTableViewCell.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import "RTItemTableViewCell.h"

@implementation RTItemTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat height = self.contentView.bounds.size.height - 8 * 2;
    self.imageView.frame = CGRectMake(8, 8, height, height);

    [self.textLabel sizeToFit];
    self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame), 8, CGRectGetWidth(self.contentView.bounds) - CGRectGetMaxX(self.imageView.frame) - 8, self.textLabel.frame.size.height);

    [self.detailTextLabel sizeToFit];
    self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame), CGRectGetMidX(self.textLabel.frame) + 8, CGRectGetWidth(self.contentView.bounds) - CGRectGetMaxX(self.imageView.frame) - 8, self.detailTextLabel.frame.size.height);
}

@end
