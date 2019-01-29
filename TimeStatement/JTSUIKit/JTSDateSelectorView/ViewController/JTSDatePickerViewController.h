//
//  JTSDatePickerViewController.h
//  TimeStatement
//
//  Created by 王嘉宁 on 2019/1/28.
//  Copyright © 2019 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTSTools.h"
#import "JTSDatePickerViewControllerViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol JTSDatePickerDelegate;

@interface JTSDatePickerViewController : UIViewController

@property (nonatomic, weak, nullable) id <JTSDatePickerDelegate> delegate;

@end

@protocol JTSDatePickerDelegate <NSObject>

@required
@optional

- (void)getSelectedDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
