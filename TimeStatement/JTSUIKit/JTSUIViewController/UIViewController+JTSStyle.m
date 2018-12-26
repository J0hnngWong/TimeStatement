//
//  UIViewController+JTSStyle.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/20.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import "UIViewController+JTSStyle.h"

@implementation UIViewController (JTSStyle)

- (void)showNavigationBarWithTitle:(NSString *)title {
    self.navigationController.navigationBar.hidden = NO;
    [self setTitle:title];
}

@end
