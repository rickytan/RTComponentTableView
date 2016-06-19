//
//  RTCollectionComponent.h
//  Pods
//
//  Created by ricky on 16/6/19.
//
//

#import "RTActionHeaderComponent.h"

@interface RTCollectionComponent : RTActionHeaderComponent <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, readonly, strong) UICollectionView *collectionView;

- (void)configureCollectionView:(UICollectionView *)collectionView NS_REQUIRES_SUPER;

- (CGRect)collectionViewRectForBounds:(CGRect)bounds;

@end
