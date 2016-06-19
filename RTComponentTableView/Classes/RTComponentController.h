//
//  RTComponentTableView.h
//  Pods
//
//  Created by ricky on 16/6/18.
//
//

#import <UIKit/UIKit.h>
#import "RTTableComponent.h"

@interface RTComponentController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, readonly, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray <id<RTTableComponent> > *components;


- (CGRect)tableViewRectForBounds:(CGRect)bounds;

@end
