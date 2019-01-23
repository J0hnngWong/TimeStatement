//
//  JTSStatmentEditorViewController.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/24.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import "JTSStatementEditorViewController.h"
#import "JTSUIKit.h"
#import "ReactiveObjC.h"
#import "RACEXTScope.h"

@interface JTSStatementEditorViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIView *eventTimeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *eventTimeViewHeight;

@property (strong, nonatomic) RACCommand *resetDateCommand;
@property (strong, nonatomic) RACCommand *confirmDateCommand;

@property (nonatomic, strong, readwrite) JTSDateSelectorView *timeDurationSelectorView;

@end

@implementation JTSStatementEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _assignSubView];
    [self _assignEvent];
}

- (void)_assignSubView
{
    //[self.navigationController showNavigationBarWithStyle:JTSNavigationBarStylePresentDone];
    [self showNavigationBarWithTitle:@"Editor"];
    [self.navigationController showNavigationBarWithStyle:JTSNavigationBarStyleDoneDismiss];
    self.mainScrollView.alwaysBounceVertical = YES;
    _timeDurationSelectorView = [JTSDateSelectorView instanceSelectorView];
    [self.timeDurationSelectorView setTitle:@"title"];
    [self.timeDurationSelectorView setLeftButtonWithTitle:@"Reset" command:self.resetDateCommand];
    [self.timeDurationSelectorView setRightButtonWithTitle:@"Confirm" command:self.confirmDateCommand];
}

- (void)_assignEvent
{
    @weakify(self);
    [self.eventTimeView.tapGesture.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        NSLog(@"Tap");
        @strongify(self);
        if ([self.timeDurationSelectorView isDescendantOfView:self.view]) {
            [self.timeDurationSelectorView disappearInView:self.view];
        } else {
            [self.timeDurationSelectorView appearInView:self.view];
        }
    }];
    [self.resetDateCommand.executionSignals.switchToLatest.deliverOnMainThread subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self.timeDurationSelectorView setDate:[NSDate date]];
    }];
    [self.confirmDateCommand.executionSignals.switchToLatest.deliverOnMainThread subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        NSDate *date = [self.timeDurationSelectorView readDate];
        NSLog(@"%@", date);
    }];
}

#pragma mark - command

- (RACCommand *)resetDateCommand
{
    if (_resetDateCommand == nil) {
        _resetDateCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal return:@(YES)];
        }];
    }
    return _resetDateCommand;
}

- (RACCommand *)confirmDateCommand
{
    if (_confirmDateCommand == nil) {
        _confirmDateCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal return:@(YES)];
        }];
    }
    return _confirmDateCommand;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
