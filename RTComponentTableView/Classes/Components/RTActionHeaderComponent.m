//
//  RTActionHeaderComponent.m
//  Pods
//
//  Created by ricky on 16/6/19.
//
//

#import "RTActionHeaderComponent.h"

@interface RTActionHeaderComponent ()
@property (nonatomic, strong) UIButton *actionButton;
@end


@implementation RTActionHeaderComponent
@dynamic delegate;

- (instancetype)initWithTableView:(UITableView *)tableView withDelegate:(id<RTBaseComponentDelegate>)delegate
{
    self = [super initWithTableView:tableView delegate:delegate];
    if (self) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self
                   action:@selector(onActionButton:)
         forControlEvents:UIControlEventTouchUpInside];
        self.actionView = button;
    }
    return self;
}

- (UIButton *)actionButton
{
    return (UIButton *)self.actionView;
}

- (void)setActionTitle:(NSString *)actionTitle
{
    if (_actionTitle != actionTitle) {
        _actionTitle = actionTitle;

        [self.actionButton setTitle:_actionTitle
                           forState:UIControlStateNormal];
    }
}

- (void)onActionButton:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(tableComponentDidTapActionButton:)]) {
        [self.delegate tableComponentDidTapActionButton:self];
    }
}

@end
