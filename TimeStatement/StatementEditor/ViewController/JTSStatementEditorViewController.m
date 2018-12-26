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
    
    
}

- (void)_assignEvent
{
    @weakify(self);
    [self.eventTimeView.tapGesture.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        NSLog(@"Tap");
        [UIView animateWithDuration:0.2 animations:^{
            @strongify(self);
            self.eventTimeViewHeight.constant = self.eventTimeViewHeight.constant == 48 ? 300 : 48;
            [self.view layoutIfNeeded];
        }];
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
