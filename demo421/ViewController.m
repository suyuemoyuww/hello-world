//
//  ViewController.m
//  demo421
//
//  Created by 王伟 on 16/4/21.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ViewController.h"
#import "ZhuangYuanHongViewController.h"
#import "FirstTabarViewController.h"
@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
//@property (nonatomic,strong) UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImag;
@property (nonatomic,strong) FirstTabarViewController *firstTabarVC;
- (IBAction)renshouxian:(id)sender;
- (IBAction)dongfanghong:(id)sender;

- (IBAction)fenhongxian:(id)sender;
@end

@implementation ViewController


//- (UIScrollView *)myScrollView
//{
//    if (nil==_myScrollView) {
//        _myScrollView=[[UIScrollView alloc] init];
//        _myScrollView.frame=[UIScreen mainScreen].bounds;
//        _myScrollView.delegate=self;
//    }
//    return _myScrollView;
//}

- (FirstTabarViewController *)firstTabarVC
{
    if (nil==_firstTabarVC) {
        _firstTabarVC=[[FirstTabarViewController alloc] init];
    }
    return _firstTabarVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myScrollView.delegate=self;
    self.myScrollView.contentSize=self.backgroundImag.bounds.size;
    self.backgroundImag.userInteractionEnabled=YES;
    self.myScrollView.directionalLockEnabled=YES;
    self.myScrollView.bounces=NO;
    UIButton *moreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    moreBtn.backgroundColor=[UIColor redColor];
    [moreBtn setBackgroundImage:[UIImage imageNamed:@"btn_more_normal"] forState:UIControlStateNormal];
    [moreBtn setBackgroundImage:[UIImage imageNamed:@"btn_more_highlighted"] forState:UIControlStateHighlighted];
    moreBtn.frame=CGRectMake(109, 809, 157, 44);
    [moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.backgroundImag addSubview:moreBtn];
}

- (void)moreBtnClick
{
    NSLog(@"moreBtnClick");
    self.firstTabarVC.hidesBottomBarWhenPushed=NO;
    [self.navigationController pushViewController:self.firstTabarVC animated:YES];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"";
    
    self.navigationItem.backBarButtonItem = backItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*人寿险*/
- (IBAction)renshouxian:(id)sender {
    NSLog(@"人寿险");
    self.firstTabarVC.hidesBottomBarWhenPushed=NO;
    [self.navigationController pushViewController:self.firstTabarVC animated:YES];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"";
    
    self.navigationItem.backBarButtonItem = backItem;
//    self.tabBarController.selectedIndex=1;
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"blickfirsttabar" object:self];
}

/*东方红-状元红*/
- (IBAction)dongfanghong:(id)sender {
    NSLog(@"东方红-状元红");
    ZhuangYuanHongViewController *vc=[[ZhuangYuanHongViewController alloc] init];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"";
    
    self.navigationItem.backBarButtonItem = backItem;
}

/*分红险*/
- (IBAction)fenhongxian:(id)sender {
    NSLog(@"分红险");
    self.firstTabarVC.hidesBottomBarWhenPushed=NO;
    [self.navigationController pushViewController:self.firstTabarVC animated:YES];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"";
    
    self.navigationItem.backBarButtonItem = backItem;
//    self.tabBarController.selectedIndex=1;
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"blickfirsttabar" object:self];
}

//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
@end
