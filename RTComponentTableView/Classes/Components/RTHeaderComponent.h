//
//  RTHeaderComponent.h
//  Pods
//
//  Created by ricky on 16/6/19.
//
//

#import "RTBaseComponent.h"

@interface RTHeaderComponent : RTBaseComponent
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIView *accessoryView;

- (CGRect)accessoryRectForBounds:(CGRect)bounds;

@end
