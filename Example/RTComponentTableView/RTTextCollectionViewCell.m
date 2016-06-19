//
//  RTTextCollectionViewCell.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "RTTextCollectionViewCell.h"

@interface RTTextCollectionViewCell ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation RTTextCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 3.f;
        self.layer.borderWidth = 1.f;
        
        self.label = [[UILabel alloc] init];
        self.label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        [self.contentView addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
            make.width.lessThanOrEqualTo(self.contentView);
        }];
    }
    return self;
}

- (void)setText:(NSString *)text
{
    self.label.text = text;
}

- (NSString *)text
{
    return self.label.text;
}

@end
