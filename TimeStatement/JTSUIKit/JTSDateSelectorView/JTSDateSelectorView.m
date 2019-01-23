//
//  JTSDateSelectorView.m
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/27.
//  Copyright © 2018 Johnny. All rights reserved.
//

#import "JTSDateSelectorView.h"
#import "Masonry.h"
#import "JTSMacroDefination.h"

@interface JTSDateSelectorView ()

@property (weak, nonatomic) IBOutlet UIView *menuAreaView;
@property (weak, nonatomic) IBOutlet UIDatePicker *mainDateSelector;

@end

@implementation JTSDateSelectorView

#pragma mark - init

- (void)awakeFromNib
{
    [super awakeFromNib];
}

+ (instancetype)instanceSelectorView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JTSDateSelectorView class]) owner:nil options:nil] firstObject];
}

#pragma mark - menuAreaView

- (void)setTitle:(NSString *)title
{
    //title
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    [self.menuAreaView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.menuAreaView.mas_centerX).offset(0);
        make.centerY.equalTo(self.menuAreaView.mas_centerY).offset(0);
    }];
}

- (void)setLeftButtonWithTitle:(NSString *)title
{
    [self setLeftButtonWithTitle:title command:nil];
}

- (void)setRightButtonWithTitle:(NSString *)title
{
    [self setRightButtonWithTitle:title command:nil];
}

- (void)setLeftButtonWithTitle:(NSString *)title command:(nullable RACCommand *)command
{
    if (command == nil) {
        command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal return:@(YES)];
        }];
    }
    
    UIButton *leftButton = [[UIButton alloc] init];
    [leftButton setTitle:title forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftButton.rac_command = command;
    [self.menuAreaView addSubview:leftButton];
    //设定位置约束
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.menuAreaView.mas_left).offset(8);
        make.centerY.equalTo(self.menuAreaView.mas_centerY).offset(0);
    }];
}

- (void)setRightButtonWithTitle:(NSString *)title command:(nullable RACCommand *)command
{
    if (command == nil) {
        command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal return:@(YES)];
        }];
    }
    
    UIButton *rightButton = [[UIButton alloc] init];
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightButton.rac_command = command;
    [self.menuAreaView addSubview:rightButton];
    //设定位置约束
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.menuAreaView.mas_right).offset(-8);
        make.centerY.equalTo(self.menuAreaView.mas_centerY).offset(0);
    }];
}

#pragma mark - action

- (void)appearInView:(UIView *)view
{
    [self appearInView:view height:300.0f];
}

- (void)appearInView:(UIView *)view height:(CGFloat)height
{
    [view addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_safeAreaLayoutGuideLeft).offset(0);
        make.right.equalTo(view.mas_safeAreaLayoutGuideRight).offset(0);
        make.height.mas_equalTo(height);
        make.bottom.equalTo(view.mas_safeAreaLayoutGuideBottom).offset(height + view.safeAreaInsets.bottom);
    }];
    [view layoutIfNeeded];
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        [weakSelf mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(view.mas_safeAreaLayoutGuideBottom).offset(0);
        }];
        [view layoutIfNeeded];
    }];
}

- (void)disappearInView:(UIView *)view
{
    __weak typeof(self) weakSelf = self;
    [view layoutIfNeeded];
    [UIView animateWithDuration:0.2 animations:^{
        [weakSelf mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(view.mas_safeAreaLayoutGuideBottom).offset(weakSelf.frame.size.height + view.safeAreaInsets.bottom);
        }];
        [view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
