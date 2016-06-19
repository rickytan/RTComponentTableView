//
//  RTItemTableViewCell.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import "RTItemTableViewCell.h"

@implementation RTItemTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
        self.textLabel.textColor = [UIColor darkTextColor];
        self.detailTextLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
        self.detailTextLabel.numberOfLines = 0;
        self.detailTextLabel.textColor = [UIColor grayColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat height = self.contentView.bounds.size.height - 8 * 2;
    self.imageView.frame = CGRectMake(8, 8, height, height);

    CGFloat width = CGRectGetWidth(self.contentView.bounds) - CGRectGetMaxX(self.imageView.frame) - 8;
    self.textLabel.preferredMaxLayoutWidth = width;
    [self.textLabel sizeToFit];
    self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + 8, 8, width, self.textLabel.frame.size.height);

    self.detailTextLabel.preferredMaxLayoutWidth = width;
    [self.detailTextLabel sizeToFit];
    self.detailTextLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + 8, CGRectGetMaxY(self.textLabel.frame) + 4, width, self.detailTextLabel.frame.size.height);
}

@end
