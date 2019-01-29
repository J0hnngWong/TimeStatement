//
//  JTSDateSelectorView.h
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/27.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveObjC.h"

NS_ASSUME_NONNULL_BEGIN

@interface JTSDateSelectorView : UIView

- (void)setStyle:(UIDatePickerMode)datePickerMode;

- (void)setTitle:(NSString *)title;
- (void)setLeftButtonWithTitle:(NSString *)title;
- (void)setRightButtonWithTitle:(NSString *)title;
- (void)setLeftButtonWithTitle:(NSString *)title command:(nullable RACCommand *)command;
- (void)setRightButtonWithTitle:(NSString *)title command:(nullable RACCommand *)command;

- (void)setDate:(NSDate *)date;
- (NSDate *)readDate;

- (void)appearInView:(UIView *)view;
- (void)appearInView:(UIView *)view height:(CGFloat)height;
- (void)disappearInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END