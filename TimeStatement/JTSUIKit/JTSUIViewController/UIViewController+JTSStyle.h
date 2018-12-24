//
//  UIViewController+JTSStyle.h
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/20.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTSMacroDefination.h"

typedef  void(^ _Nullable JTSNavigationBarButtonActionBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JTSStyle)

- (void)showNavigationBarWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
