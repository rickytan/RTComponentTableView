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

@protocol RTBaseComponentDelegate <NSObject>
@optional
- (void)tableComponent:(id<RTTableComponent>)component
     didTapItemAtIndex:(NSUInteger)index;

@end


@interface RTBaseComponent : NSObject <RTTableComponent>
@property (nonatomic, weak) id<RTBaseComponentDelegate> delegate;

@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, strong) NSString *headerIdentifier;

+ (instancetype)componentWithTableView:(UITableView *)tableView;
+ (instancetype)componentWithTableView:(UITableView *)tableView delegate:(id<RTBaseComponentDelegate>)delegate;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithTableView:(UITableView *)tableView;
- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<RTBaseComponentDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)registerWithTableView:(UITableView *)tableView NS_REQUIRES_SUPER;
- (void)setNeedUpdateHeight;

@end
