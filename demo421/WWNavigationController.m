//
//  WWNavigationController.m
//  彩票01-搭建基本框架ww
//
//  Created by 王伟 on 15/7/23.
//  Copyright (c) 2015年 王伟. All rights reserved.
//

#import "WWNavigationController.h"
#import "WWTabBar.h"
@interface WWNavigationController ()

@end

@implementation WWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

/**
 *  系统在第一次使用这个类的时候调用
 */
+ (void)initialize
{
    
    UINavigationBar *navBar=[UINavigationBar appearance];
    navBar.tintColor=[UIColor whiteColor];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbackground.jpg"] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName]=[UIColor whiteColor];
    dict[NSFontAttributeName]=[UIFont boldSystemFontOfSize:18];
    
    [navBar setTitleTextAttributes:dict];
    
    
    UIBarButtonItem *barBtn=[UIBarButtonItem appearance];
    NSMutableDictionary *itemDict=[NSMutableDictionary dictionary];
    itemDict[NSForegroundColorAttributeName]=[UIColor whiteColor];
    itemDict[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    
    [barBtn setTitleTextAttributes:itemDict forState:UIControlStateNormal];
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

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    viewController.hidesBottomBarWhenPushed=YES;
    [super pushViewController:viewController animated:animated];
}

@end
