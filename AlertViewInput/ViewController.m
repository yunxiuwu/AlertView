//
//  ViewController.m
//  AlertViewInput
//
//  Created by admin on 16/10/28.
//  Copyright © 2016年 wyx. All rights reserved.
//

#import "ViewController.h"
#import "CustomAletViewInput.h"
@interface ViewController ()<CustomAletViewInputDelegate>
- (IBAction)popAlertView:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popAlertView:(id)sender {
    
    CustomAletViewInput *alertView = [[CustomAletViewInput alloc]init];
    alertView.delegate = self;
     [alertView showActionViewInView:self.view];
    
}

- (void)sendToUsername:(NSString *)username password:(NSString *)password
{

}
@end
