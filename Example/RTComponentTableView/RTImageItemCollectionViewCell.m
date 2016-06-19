//
//  RTImageItemCollectionViewCell.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "RTImageItemCollectionViewCell.h"

@interface RTImageItemCollectionViewCell ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@end

@implementation RTImageItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1.f;
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0.f);
            make.height.equalTo(self.imageView.mas_width);
        }];

        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0.f);
            make.top.equalTo(self.imageView.mas_bottom).offset(4.f);
            make.width.lessThanOrEqualTo(self.contentView);
        }];

        self.detailLabel = [[UILabel alloc] init];
        self.detailLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
        [self.contentView addSubview:self.detailLabel];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0.f);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(2.f);
            make.bottom.lessThanOrEqualTo(self.contentView).offset(2.f);
        }];
    }
    return self;
}

@end
