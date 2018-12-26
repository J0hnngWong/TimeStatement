//
//  UIViewController+JTSRouter.h
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/24.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JTSRouter)

- (void)pushViewController:(Class)viewControllerClass;
- (void)presentViewController:(Class)viewControllerClass;

@end

NS_ASSUME_NONNULL_END
