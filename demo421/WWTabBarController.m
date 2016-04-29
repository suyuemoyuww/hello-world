//
//  WWTabBarController.m
//  彩票01-搭建基本框架ww
//
//  Created by 王伟 on 15/7/23.
//  Copyright (c) 2015年 王伟. All rights reserved.
//

#import "WWTabBarController.h"
#import "WWTabBar.h"
#import "WWTabBarButton.h"

@interface WWTabBarController ()<WWTabBarDelegate>

@end

@implementation WWTabBarController

- (void)viewWillLayoutSubviews{
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 60;
    tabFrame.origin.y = self.view.frame.size.height - 60;
    self.tabBar.frame = tabFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.添加自己的TabBar
    WWTabBar *myTabbar=[[WWTabBar alloc] init];
//    myTabbar.backgroundColor=[UIColor greenColor];
    CGRect tabarFrame=myTabbar.frame;
    tabarFrame=CGRectMake(0, 0, 375, 60);
    myTabbar.frame=tabarFrame;
    myTabbar.delegate=self;
    //tabbar.backgroundColor=[UIColor greenColor];

    for (int i=0; i<self.childViewControllers.count; i++) {
        NSString *name=[NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *selName=[NSString stringWithFormat:@"TabBar%dSel",i+1];
        
        [myTabbar addTabBarButtonWithName:name selName:selName];
    }
    UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottombackground"]];
//    img.frame=self.tabBar.bounds;
    img.frame=CGRectMake(0, 0, 375, 60);
    [self.tabBar addSubview:img];
    [self.tabBar addSubview:myTabbar];
    
}

- (void)tabBar:(WWTabBar *)wwTabBar didSelectButtonFrom:(int)from To:(int)to
{
    self.selectedIndex=to;
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
