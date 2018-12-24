//
//  SettingViewController.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/19.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import "SettingViewController.h"
#import "JTSUIKit.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO];
    [self showNavigationBarWithTitle:@"Setting"];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(40, 0, 300, 64)];
    tabBar.barTintColor = [UIColor redColor];
    [self.view addSubview:tabBar];
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
