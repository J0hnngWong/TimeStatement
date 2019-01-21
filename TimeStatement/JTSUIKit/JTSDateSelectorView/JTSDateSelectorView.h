//
//  JTSDateSelectorView.h
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/27.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JTSDateSelectorView : UIView

+ (instancetype)instanceSelectorView;

- (void)setTitle:(NSString *)title;
- (void)setLeftButtonWithTitle:(NSString *)title;
- (void)setRightButtonWithTitle:(NSString *)title;

- (void)appearInView:(UIView *)view;
- (void)appearInView:(UIView *)view height:(CGFloat)height;
- (void)disappearInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
