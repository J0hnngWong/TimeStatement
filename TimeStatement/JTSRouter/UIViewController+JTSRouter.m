//
//  UIViewController+JTSRouter.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/24.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import "UIViewController+JTSRouter.h"

@implementation UIViewController (JTSRouter)

- (void)pushViewController:(Class)viewControllerClass
{
    UIViewController *viewController = [[viewControllerClass alloc] init];
    if (viewController.navigationController) {
        [self.navigationController pushViewController:viewController animated:YES];
    } else {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self.navigationController pushViewController:nav animated:YES];
    }
}

- (void)presentViewController:(Class)viewControllerClass
{
    UIViewController *viewController = [[viewControllerClass alloc] init];
    if (viewController.navigationController) {
        [self.navigationController presentViewController:viewController animated:YES completion:^{
            
        }];
    } else {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self.navigationController presentViewController:nav animated:YES completion:^{
            
        }];
    }
}

@end
