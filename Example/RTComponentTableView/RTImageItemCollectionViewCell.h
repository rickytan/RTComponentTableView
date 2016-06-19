//
//  RTImageItemCollectionViewCell.h
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTImageItemCollectionViewCell : UICollectionViewCell
@property (nonatomic, readonly, strong) UIImageView *imageView;
@property (nonatomic, readonly, strong) UILabel *nameLabel;
@property (nonatomic, readonly, strong) UILabel *detailLabel;
@end
