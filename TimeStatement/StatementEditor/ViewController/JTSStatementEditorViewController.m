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
    [self.timeDurationSelectorView setLeftButtonWithTitle:@"Remove"];
    [self.timeDurationSelectorView setRightButtonWithTitle:@"Done"];
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
