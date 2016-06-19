//
//  RTTableComponent.h
//  Pods
//
//  Created by ricky on 16/6/19.
//
//

#import <Foundation/Foundation.h>


@protocol RTTableComponent;


@protocol RTTableComponentDelegate <NSObject>
@optional
- (void)tableComponent:(id<RTTableComponent>)component didTapItemAtIndex:(NSUInteger)index;
@end



@protocol RTTableComponent <NSObject>
@required

- (NSString *)cellIdentifier;
- (NSString *)headerIdentifier;

- (NSInteger)numberOfItems;
- (CGFloat)heightForComponentHeader;
- (CGFloat)heightForComponentItemAtIndex:(NSUInteger)index;

- (__kindof UITableViewCell *)cellForTableView:(UITableView *)tableView
                                   atIndexPath:(NSIndexPath *)indexPath;
- (__kindof UIView *)headerForTableView:(UITableView *)tableView;

- (void)reloadComponentData;

@optional

- (void)willDisplayHeader:(__kindof UIView *)header;
- (void)didDisplayHeader:(__kindof UIView *)header;
- (void)willDisplayCell:(__kindof UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;
- (void)didDisplayCell:(__kindof UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;

- (void)didSelectItemAtIndex:(NSUInteger)index;

@end
