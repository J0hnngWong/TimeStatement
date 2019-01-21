//
//  JTSMainViewController.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/19.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import "JTSMainViewController.h"
#import "SettingViewController.h"
#import "MBProgressHUD.h"
#import "JTSUIKit.h"
#import "Masonry.h"
#import "ReactiveObjC.h"
#import "UIViewController+JTSRouter.h"
#import "JTSStatementEditorViewController.h"

@interface JTSMainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *addNewStatementButton;

@end

@implementation JTSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _assignSubView];
    [self _assignEvent];
}

#pragma mark - private

- (void)_assignSubView
{
    [self.addNewStatementButton setButtonWithStyle:JTSButtonStyleFullColor theme:JTSButtonThemeDefault cornerRadius:JTSButtonCornerRadiusFull];
    [self.view bringSubviewToFront:self.addNewStatementButton];
}

- (void)_assignEvent
{
    [[self.addNewStatementButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self presentViewController:[JTSStatementEditorViewController class]];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(showMsg)];
    self.navigationItem.rightBarButtonItem = backBtn;
}

- (void)jump {
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)showMsg {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    [hud hideAnimated:YES afterDelay:1];
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
