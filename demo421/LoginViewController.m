//
//  LoginViewController.m
//  demo421backup
//
//  Created by 王伟 on 16/4/21.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "LoginViewController.h"
#import "WWTabBarController.h"

@interface LoginViewController ()
- (IBAction)login:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(id)sender {
    NSLog(@"login");
    
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WWTabBarController *tabarVC=[storyBoard instantiateInitialViewController];
    
    [UIApplication sharedApplication].keyWindow.rootViewController=tabarVC;
}
@end
