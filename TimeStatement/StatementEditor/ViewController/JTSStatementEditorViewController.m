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

@interface JTSStatementEditorViewController () <JTSDatePickerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIView *eventTimeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *eventTimeViewHeight;

@property (strong, nonatomic) RACCommand *resetDateCommand;
@property (strong, nonatomic) RACCommand *confirmDateCommand;

@property (strong, nonatomic) JTSDatePickerViewController *datePickerViewController;
@property (nonatomic, strong, readwrite) JTSDateSelectorView *timeDurationSelectorView;

@property (strong, nonatomic) JTSStatementEditorViewControllerViewModel *viewModel;

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
    self.datePickerViewController.delegate = self;
    [self showNavigationBarWithTitle:@"Editor"];
    [self.navigationController showNavigationBarWithStyle:JTSNavigationBarStyleDoneDismiss];
    self.mainScrollView.alwaysBounceVertical = YES;
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
        [self presentViewController:self.datePickerViewController animated:NO completion:nil];
        
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

#pragma mark - delegate

- (void)getSelectedDate:(NSDate *)date
{
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
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

- (JTSDatePickerViewController *)datePickerViewController
{
    if (_datePickerViewController == nil) {
        _datePickerViewController = [[JTSDatePickerViewController alloc] init];
    }
    return _datePickerViewController;
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
