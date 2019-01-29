//
//  JTSDatePickerViewController.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2019/1/28.
//  Copyright © 2019 Johnny. All rights reserved.
//

#import "JTSDatePickerViewController.h"
#import "ReactiveObjC.h"

@interface JTSDatePickerViewController () <UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIView *backGroundView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIDatePicker *mainDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewBottomMargin;

@property (strong, nonatomic) JTSDatePickerViewControllerViewModel *viewModel;

@end

@implementation JTSDatePickerViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _assignSubView];
    [self _assignEvents];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self presentStartupAnimation];
}

- (void)_assignSubView
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.backGroundView addGestureRecognizer:tapGesture];
    self.view.backgroundColor = [UIColor clearColor];
    self.backGroundView.backgroundColor = [UIColor blackColor];
    self.backGroundView.alpha = 0.0;
    self.containerViewBottomMargin.constant = self.containerView.frame.size.height + 34;
    [self.mainDatePicker setDatePickerMode:UIDatePickerModeCountDownTimer];
}

- (void)_assignEvents
{
    @weakify(self)
    [[self.doneButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        [self dismiss];
    }];
}

- (void)presentStartupAnimation
{
    @weakify(self)
    [UIView animateWithDuration:ANIMATE_DURATION delay:0 usingSpringWithDamping:SPRING_DAMPING initialSpringVelocity:SPRING_INITIAL options:UIViewAnimationOptionCurveEaseInOut animations:^{
        @strongify(self)
        self.containerViewBottomMargin.constant = 0;
        self.backGroundView.alpha = 0.3;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss
{
    @weakify(self)
    [UIView animateWithDuration:ANIMATE_DURATION delay:0 usingSpringWithDamping:SPRING_DAMPING initialSpringVelocity:SPRING_INITIAL options:UIViewAnimationOptionCurveEaseInOut animations:^{
        @strongify(self)
        self.containerViewBottomMargin.constant = self.containerView.frame.size.height + self.view.safeAreaInsets.bottom;
        self.backGroundView.alpha = 0.0;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        @strongify(self)
        if ([self.delegate respondsToSelector:@selector(getSelectedDate:)]) {
            [self.delegate getSelectedDate:self.mainDatePicker.date];
        }
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (JTSDatePickerViewControllerViewModel *)viewModel
{
    if (_viewModel == nil) {
        _viewModel = [[JTSDatePickerViewControllerViewModel alloc] init];
    }
    return _viewModel;
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
