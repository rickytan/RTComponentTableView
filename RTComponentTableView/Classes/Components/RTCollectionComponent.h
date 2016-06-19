//
//  RTCollectionComponent.h
//  Pods
//
//  Created by ricky on 16/6/19.
//
//

#import "RTHeaderComponent.h"

@interface RTCollectionComponent : RTHeaderComponent <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, readonly, strong) UICollectionView *collectionView;

- (void)configureCollectionView:(UICollectionView *)collectionView NS_REQUIRES_SUPER;

- (CGRect)collectionViewRectForBounds:(CGRect)bounds;

@end
