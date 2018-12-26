//
//  UINavigationController+JTSStyle.h
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/24.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JTSNavigationBarStyle) {
    JTSNavigationBarStyleDoneDismiss,
    JTSNavigationBarStylePushBack,
};

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (JTSStyle)

- (void)showNavigationBarWithStyle:(JTSNavigationBarStyle)style;

- (void)doneDismiss;

@end

NS_ASSUME_NONNULL_END
