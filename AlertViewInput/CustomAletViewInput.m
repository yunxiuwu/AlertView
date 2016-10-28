//
//  CustomActionSheetTextFieldView.m
//  boxasst_iosphone
//
//  Created by WYX on 16/5/21.
//  Copyright © 2016年 taixin. All rights reserved.
//添加\编辑用户

#import "CustomAletViewInput.h"


#define Main_Screen_Height  [[UIScreen mainScreen] bounds].size.height

#define Main_Screen_Width  [[UIScreen mainScreen] bounds].size.width

#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define PADING_X  20

@implementation CustomAletViewInput
{
    UIView *bgView;
}
-(void)showActionViewInView:(UIView *)view
{
    self.backgroundColor = [UIColor colorWithWhite:0.121 alpha:0.5];
    self.frame = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height);
    [view addSubview:self];
    [self createUI];
}

- (void)createUI
{
    bgView = [[UIView alloc]initWithFrame:CGRectMake(PADING_X, Main_Screen_Height/3, Main_Screen_Width - PADING_X*2, Main_Screen_Height/4)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 5.0f;
    [self addSubview:bgView];
    
    CGFloat W = bgView.frame.size.width;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, W , 30)];
    headView.backgroundColor = RGBACOLOR(24, 180, 237, 1);
    [bgView addSubview:headView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:headView.frame];
    label.text = @"输入";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17];
    [headView addSubview:label];
    
    _nameText = [[UITextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(headView.frame)+10, W-30, PADING_X*2)];
    _nameText.layer.borderColor = [RGBACOLOR(198, 198, 198, 1)CGColor];
    _nameText.layer.borderWidth = 1;
    _nameText.font = [UIFont systemFontOfSize:14];
    _nameText.placeholder = @"账号:";
    _nameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_nameText isFirstResponder];
    [bgView addSubview:_nameText];
    
    _passwdText = [[UITextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_nameText.frame)+10, CGRectGetWidth(_nameText.frame), PADING_X*2)];
    _passwdText.layer.borderColor = [RGBACOLOR(198, 198, 198, 1)CGColor];
    _passwdText.layer.borderWidth = 1;
    _passwdText.font = [UIFont systemFontOfSize:14];
    _passwdText.placeholder = @"密码:";
    _passwdText.keyboardType = UIKeyboardTypeNumberPad;
    [_passwdText isFirstResponder];
    [bgView addSubview:_passwdText];
    
    _commitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _commitBtn.frame = CGRectMake(W-80, CGRectGetMaxY(_passwdText.frame)+5,60,30);
    [_commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [_commitBtn setTitleColor:headView.backgroundColor forState:UIControlStateNormal];
    _commitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_commitBtn addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:_commitBtn];
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _cancelBtn.frame = CGRectMake(PADING_X, CGRectGetMaxY(_passwdText.frame)+5, 60, 30);
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:headView.backgroundColor forState:UIControlStateNormal];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:_cancelBtn];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGREvent:)];
    [self addGestureRecognizer:tapGR];
}

- (void)submit:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sendToUsername:password:)]) {
        [self.delegate sendToUsername:_nameText.text password:_passwdText.text];
    }
    
    [self removeFromSuperview];
}
-(void)cancel
{
    [self removeFromSuperview];
}

-(void)keyboardShow:(NSNotification *)notification
{
    
    [UIView animateWithDuration:0.2 animations:^{
        bgView.frame = CGRectMake(PADING_X, 64, Main_Screen_Width-PADING_X*2, Main_Screen_Height/4);
    }];
    
}

-(void)keyboardHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.2 animations:^{
        bgView.frame = CGRectMake(PADING_X, Main_Screen_Height/3, Main_Screen_Width - PADING_X*2, Main_Screen_Height/4);
    }];
}
- (void)tapGREvent:(UITapGestureRecognizer *)tapGR
{
    [_nameText resignFirstResponder];
    [_passwdText resignFirstResponder];
}



@end
