//
//  RTBaseComponent.h
//  Pods
//
//  Created by ricky on 16/6/18.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "RTTableComponent.h"


@interface RTBaseComponent : NSObject <RTTableComponent>
@property (nonatomic, weak) id<RTTableComponentDelegate> delegate;

@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, strong) NSString *headerIdentifier;

+ (instancetype)componentWithTableView:(UITableView *)tableView;
+ (instancetype)componentWithTableView:(UITableView *)tableView delegate:(id<RTTableComponentDelegate>)delegate;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithTableView:(UITableView *)tableView;
- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<RTTableComponentDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)registerWithTableView:(UITableView *)tableView NS_REQUIRES_SUPER;
- (void)setNeedUpdateHeightForSection:(NSInteger)section;

@end
