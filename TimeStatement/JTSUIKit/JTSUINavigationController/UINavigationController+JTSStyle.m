//
//  UINavigationController+JTSStyle.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/24.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import "UINavigationController+JTSStyle.h"
#import "ReactiveObjC.h"

@implementation UINavigationController (JTSStyle)

- (void)showNavigationBarWithStyle:(JTSNavigationBarStyle)style
{
    self.navigationBar.hidden = NO;
    switch (style) {
        case JTSNavigationBarStyleDoneDismiss:
            {
                UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneDismiss)];
                self.topViewController.navigationItem.rightBarButtonItem = doneButton;
            }
            break;
            
        default:
            break;
    }
}

- (void)doneDismiss
{
    [self.topViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
