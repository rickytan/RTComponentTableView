//
//  RTDemoTagsComponent.m
//  RTComponentTableView
//
//  Created by ricky on 16/6/19.
//  Copyright © 2016年 rickytan. All rights reserved.
//

#import "RTDemoTagsComponent.h"

#import "RTTextCollectionViewCell.h"

@implementation RTDemoTagsComponent

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<RTBaseComponentDelegate>)delegate
{
    self = [super initWithTableView:tableView delegate:delegate];
    if (self) {
        self.title = @"Suggestions";
        self.actionTitle = @"All Tags";
    }
    return self;
}

- (void)reloadDataWithTableView:(UITableView *)tableView inSection:(NSInteger)section
{
    self.tags = @[@"C++", @"C", @"Objective-C", @"Javascript", @"CSS", @"Swift", @"Go", @"Python", @"PHP", @"HTML"];
    [self.collectionView reloadData];
    [self setNeedUpdateHeightForSection:section];
}

- (CGFloat)heightForComponentItemAtIndex:(NSUInteger)index
{
    return MAX(88, self.collectionView.contentSize.height + self.collectionView.contentInset.top + self.collectionView.contentInset.bottom);
}

- (void)configureCollectionView:(UICollectionView *)collectionView
{
    [super configureCollectionView:collectionView];

    [collectionView registerClass:[RTTextCollectionViewCell class]
       forCellWithReuseIdentifier:@"Cell"];

    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)collectionView.collectionViewLayout;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.tags.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RTTextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                               forIndexPath:indexPath];
    cell.text = self.tags[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [self.tags[indexPath.item] sizeWithAttributes:@{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];
    size.width += 16.f;
    size.height += 8.f;
    return size;
}

@end
