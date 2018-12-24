//
//  UIButton+JTSStyle.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/20.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import "UIButton+JTSStyle.h"

@interface UIButton ()

@property (assign, nonatomic) JTSButtonStyle style;
@property (assign, nonatomic) JTSButtonTheme theme;
@property (assign, nonatomic) JTSButtonCornerRadius cornerRadius;

@end

@implementation UIButton (JTSStyle)

- (void)setButtonWithStyle:(JTSButtonStyle)style theme:(JTSButtonTheme)theme cornerRadius:(JTSButtonCornerRadius)cornerRadius
{
    switch (style) {
        case JTSButtonStyleFullColor:
            {
                [self _setButtonBackGroundColorWithTheme:theme];
                [self _setButtonWithCornerRadius:cornerRadius];
            }
            break;
        case JTSButtonStyleBoarder:
            {
                [self _setButtonBorderColorWithTheme:theme];
                [self _setButtonWithCornerRadius:cornerRadius];
            }
            break;
            
        default:
            break;
    }
}

- (void)setButtonWithBackGroundImage:(UIImage *)image {
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

#pragma mark - private function

- (void)_setButtonBackGroundColorWithTheme:(JTSButtonTheme)theme
{
    switch (theme) {
        case JTSButtonThemeDefault:
            self.backgroundColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
}

- (void)_setButtonBorderColorWithTheme:(JTSButtonTheme)theme
{
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderWidth = 1.0;
    switch (theme) {
        case JTSButtonThemeDefault:
            {
                self.layer.borderColor = [[UIColor redColor] CGColor];
            }
            break;
            
        default:
            break;
    }
}

- (void)_setButtonWithCornerRadius:(JTSButtonCornerRadius)cornerRadius
{
    switch (cornerRadius) {
        case JTSButtonCornerRadiusFull:
            {
                self.layer.cornerRadius = CGRectGetHeight(self.bounds) * 0.5;
            }
            break;
        case JTSButtonCornerRadiusSmall:
            {
                self.layer.cornerRadius = 3.0;
            }
        case JTSButtonCornerRadiusMedium:
            {
                self.layer.cornerRadius = CGRectGetHeight(self.bounds) * 0.3;
            }
            
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
