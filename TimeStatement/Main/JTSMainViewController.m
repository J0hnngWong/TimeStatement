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

@interface JTSMainViewController ()

@end

@implementation JTSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _assignSubView];
}

- (void)_assignSubView
{
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(300, 300, 30, 30)];
    [btn setButtonWithStyle:JTSButtonStyleFullColor theme:JTSButtonThemeDefault cornerRadius:JTSButtonCornerRadiusFull];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
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
