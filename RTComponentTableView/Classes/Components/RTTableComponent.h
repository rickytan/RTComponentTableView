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
- (NSString *)footerIdentifier;

- (NSInteger)numberOfItems;
- (CGFloat)heightForComponentHeader;
- (CGFloat)heightForComponentFooter;
- (CGFloat)heightForComponentItemAtIndex:(NSUInteger)index;

- (__kindof UITableViewCell *)cellForTableView:(UITableView *)tableView
                                   atIndexPath:(NSIndexPath *)indexPath;

- (void)reloadDataWithTableView:(UITableView *)tableView
                      inSection:(NSInteger)section;
- (void)registerWithTableView:(UITableView *)tableView;

@optional
- (__kindof UIView *)headerForTableView:(UITableView *)tableView;
- (__kindof UIView *)footerForTableView:(UITableView *)tableView;

- (void)willDisplayHeader:(__kindof UIView *)header;
- (void)willDisplayFooter:(__kindof UIView *)footer;
- (void)willDisplayCell:(__kindof UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;

- (void)didSelectItemAtIndex:(NSUInteger)index;

@end
