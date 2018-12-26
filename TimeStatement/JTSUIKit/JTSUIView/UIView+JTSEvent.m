//
//  UIView+JTSEvent.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/25.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import "UIView+JTSEvent.h"
#import <objc/runtime.h>

@implementation UIView (JTSEvent)

- (UITapGestureRecognizer *)tapGesture
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, _cmd);
    if (gesture == nil) {
        gesture = [[UITapGestureRecognizer alloc] init];
        objc_setAssociatedObject(self, _cmd, gesture, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:gesture];
    }
    return gesture;
}

@end
