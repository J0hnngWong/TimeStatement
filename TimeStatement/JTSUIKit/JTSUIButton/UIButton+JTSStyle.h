//
//  UIButton+JTSStyle.h
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/20.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JTSButtonStyle) {
    JTSButtonStyleDefault,
    JTSButtonStyleFullColor,
    JTSButtonStyleBoarder,
};

typedef NS_ENUM(NSInteger, JTSButtonTheme) {
    JTSButtonThemeDefault,
};

typedef NS_ENUM(NSInteger, JTSButtonCornerRadius) {
    JTSButtonCornerRadiusFull,
    JTSButtonCornerRadiusMedium,
    JTSButtonCornerRadiusSmall,
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JTSStyle)

//UIButton切圆角
- (void)setButtonWithStyle:(JTSButtonStyle)style theme:(JTSButtonTheme)theme cornerRadius:(JTSButtonCornerRadius)radius;

- (void)setButtonWithBackGroundImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
