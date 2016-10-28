//
//  CustomActionSheetTextFieldView.h
//  boxasst_iosphone
//
//  Created by WYX on 16/5/21.
//  Copyright © 2016年 taixin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomAletViewInputDelegate <NSObject>

- (void)sendToUsername:(NSString *)username password:(NSString *)password ;

@end

@interface CustomAletViewInput : UIView

@property (nonatomic, strong) UIButton *commitBtn;
@property (nonatomic, strong) UIButton *cancelBtn;

@property (nonatomic, strong) UITextField *nameText;
@property (nonatomic, strong) UITextField *passwdText;


@property (nonatomic, assign) id<CustomAletViewInputDelegate>delegate;

- (void)showActionViewInView:(UIView *)view;

@end
