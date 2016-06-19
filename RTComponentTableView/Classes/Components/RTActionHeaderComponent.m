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

- (void)setActionButton:(UIButton *)actionButton
{
    self.accessoryView = actionButton;
}

- (UIButton *)actionButton
{
    if (!self.accessoryView) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button addTarget:self
                   action:@selector(onActionButton:)
         forControlEvents:UIControlEventTouchUpInside];

        self.actionButton = button;
    }
    return (UIButton *)self.accessoryView;
}

- (void)setActionTitle:(NSString *)actionTitle
{
    if (_actionTitle != actionTitle) {
        _actionTitle = actionTitle;

        [self.actionButton setTitle:_actionTitle
                           forState:UIControlStateNormal];
        [self.actionButton sizeToFit];
    }
}

- (void)onActionButton:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(tableComponent:didTapActionButton:)]) {
        [self.delegate tableComponent:self didTapActionButton:self.actionButton];
    }
}

@end
