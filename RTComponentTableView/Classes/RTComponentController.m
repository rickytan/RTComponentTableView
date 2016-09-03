//
//  RTComponentTableView.m
//  Pods
//
//  Created by ricky on 16/6/18.
//
//

#import "RTComponentController.h"

#import "RTBaseComponent.h"

@interface RTComponentController ()
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation RTComponentController

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = [self tableViewRectForBounds:self.view.bounds];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[self tableViewRectForBounds:self.view.bounds]
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - Methods

- (void)setComponents:(NSArray<id<RTTableComponent>> *)components
{
    if (_components != components) {
        _components = components;
        [self.tableView reloadData];
    }
}

- (CGRect)tableViewRectForBounds:(CGRect)bounds
{
    return bounds;
}

#pragma mark - UITableView Datasource & Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.components.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.components[section].numberOfItems;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.components[section].heightForComponentHeader;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return self.components[section].heightForComponentHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.components[indexPath.section] heightForComponentItemAtIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.components[indexPath.section] heightForComponentItemAtIndex:indexPath.row];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([self.components[section] respondsToSelector:@selector(headerForTableView:)]) {
        return [self.components[section] headerForTableView:tableView];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if ([self.components[section] respondsToSelector:@selector(footerForTableView:)]) {
        return [self.components[section] footerForTableView:tableView];
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.components[indexPath.section] cellForTableView:tableView atIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView
willDisplayHeaderView:(UIView *)view
       forSection:(NSInteger)section
{
    if ([self.components[section] respondsToSelector:@selector(willDisplayHeader:)]) {
        [self.components[section] willDisplayHeader:view];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view
       forSection:(NSInteger)section
{
    if ([self.components[section] respondsToSelector:@selector(willDisplayFooter:)]) {
        [self.components[section] willDisplayFooter:view];
    }
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.components[indexPath.section] respondsToSelector:@selector(willDisplayCell:forIndexPath:)]) {
        [self.components[indexPath.section] willDisplayCell:cell
                                               forIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.components[indexPath.section] respondsToSelector:@selector(didSelectItemAtIndex:)]) {
        [self.components[indexPath.section] didSelectItemAtIndex:indexPath.row];
    }
}

@end
