//
//  RTDemoImageItemComponent.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import "RTDemoImageItemComponent.h"

#import "RTImageItemCollectionViewCell.h"

@implementation RTDemoImageItemComponent

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<RTBaseComponentDelegate>)delegate
{
    self = [super initWithTableView:tableView delegate:delegate];
    if (self) {
        self.title = @"Photo";
        self.actionTitle = @"Share";
    }
    return self;
}

- (void)configureCollectionView:(UICollectionView *)collectionView
{
    [super configureCollectionView:collectionView];

    [collectionView registerClass:[RTImageItemCollectionViewCell class]
       forCellWithReuseIdentifier:@"Cell"];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(120, 164);
}

- (CGFloat)heightForComponentItemAtIndex:(NSUInteger)index
{
    return 180.f;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RTImageItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                                    forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[@(indexPath.item % 5 + 1) stringValue]];
    cell.nameLabel.text = @"Picture";
    cell.detailLabel.text = @"Descriptions";
    return cell;
}

@end
