//
//  SecondTabarViewController.m
//  demo421
//
//  Created by 王伟 on 16/4/21.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "SecondTabarViewController.h"

@interface SecondTabarViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *mybackgroundImage;

@end

@implementation SecondTabarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myScrollView.delegate=self;
    
    self.myScrollView.contentSize=self.mybackgroundImage.bounds.size;
    self.mybackgroundImage.userInteractionEnabled=YES;
    self.myScrollView.directionalLockEnabled=YES;
    self.myScrollView.bounces=NO;

    self.myScrollView.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
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
