//
//  RTCollectionComponent.m
//  Pods
//
//  Created by ricky on 16/6/19.
//
//

#import "RTCollectionComponent.h"

@interface RTCollectionComponent ()
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation RTCollectionComponent

- (instancetype)initWithTableView:(UITableView *)tableView
                         delegate:(id<RTTableComponentDelegate>)delegate
{
    self = [super initWithTableView:tableView delegate:delegate];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 8.f;
        layout.minimumLineSpacing = 8.f;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];

        [self configureCollectionView:self.collectionView];

        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
    }
    return self;
}

#pragma mark - Overrides

- (void)reloadDataWithTableView:(UITableView *)tableView
                     forSection:(NSInteger)section
{
    [self.collectionView reloadData];
}

- (NSInteger)numberOfItems
{
    return 1;
}

- (CGFloat)heightForComponentItemAtIndex:(NSUInteger)index
{
    return 160.f;
}

- (void)didSelectItemAtIndex:(NSUInteger)index
{
    // Override, no action
}

- (__kindof UITableViewCell *)cellForTableView:(UITableView *)tableView
                                   atIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.collectionView.frame = [self collectionViewRectForBounds:cell.bounds];
    [cell.contentView addSubview:self.collectionView];
    return cell;
}

- (void)configureCollectionView:(UICollectionView *)collectionView
{
    collectionView.contentInset = UIEdgeInsetsMake(8, 8, 8, 8);
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.scrollsToTop = NO;
    
    [collectionView registerClass:[UICollectionViewCell class]
       forCellWithReuseIdentifier:@"Cell"];
}

- (void)didDisplayCell:(__kindof UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    self.collectionView.frame = [self collectionViewRectForBounds:cell.contentView.bounds];
}

#pragma mark - Methods

- (CGRect)collectionViewRectForBounds:(CGRect)bounds
{
    return bounds;
}

#pragma mark - UICollection Datasource & Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                           forIndexPath:indexPath];

    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableComponent:didTapItemAtIndex:)]) {
        [self.delegate tableComponent:self
                    didTapItemAtIndex:indexPath.item];
    }
}

@end
