//
//  ThirdTabarViewController.m
//  demo421
//
//  Created by 王伟 on 16/4/21.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ThirdTabarViewController.h"
#import "AddNewCustomViewController.h"
@interface ThirdTabarViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *myBackgroundImage;

@end

@implementation ThirdTabarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myScrollView.delegate=self;
    self.myScrollView.contentSize=self.myBackgroundImage.bounds.size;
    self.myBackgroundImage.userInteractionEnabled=YES;
    self.myScrollView.directionalLockEnabled=YES;
    self.myScrollView.bounces=NO;
    self.myScrollView.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    
    self.navigationItem.rightBarButtonItem=leftItem;
}

- (void)add
{
    [self.navigationController pushViewController:[[AddNewCustomViewController alloc] init] animated:YES];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"";
    
    self.navigationItem.backBarButtonItem = backItem;
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

@end
