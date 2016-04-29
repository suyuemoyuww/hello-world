//
//  ZhuangYuanHongViewController.m
//  demo421backup
//
//  Created by 王伟 on 16/4/21.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZhuangYuanHongViewController.h"
#import "LiyiyanshiViewController.h"
@interface ZhuangYuanHongViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *mybackgroundImage;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
- (IBAction)selectdidClick:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UIButton *tianjiafujiaxianBtn;
- (IBAction)addfujianxian:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIImageView *addfujianxianImage;
@property (nonatomic,strong) UIButton *liyiyanshiBtn;
- (IBAction)close:(id)sender;

@end

@implementation ZhuangYuanHongViewController

- (UIButton *)liyiyanshiBtn
{
    if (nil==_liyiyanshiBtn) {
        _liyiyanshiBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 950-20, 375, 54+20)];
//        _liyiyanshiBtn.backgroundColor=[UIColor greenColor];
        [self.myScrollView addSubview:_liyiyanshiBtn];
        [_liyiyanshiBtn addTarget:self action:@selector(liyiyanshi) forControlEvents:UIControlEventTouchUpInside];
    }
    return _liyiyanshiBtn;
}

- (void)liyiyanshi
{
    NSLog(@"利益演示");
    [self.navigationController pushViewController:[[LiyiyanshiViewController alloc] init] animated:YES];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"";
    
    self.navigationItem.backBarButtonItem = backItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView *backgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, 64, 375, 60)];
    backgroundView.backgroundColor=[UIColor whiteColor];
    [self.view insertSubview:backgroundView belowSubview:self.segmentControl];
//    [self.view addSubview:backgroundView];
    self.title=@"状元红（尊享版）";
    self.myScrollView.delegate=self;
    self.myScrollView.contentSize=self.mybackgroundImage.bounds.size;
    self.mybackgroundImage.userInteractionEnabled=YES;
    self.myScrollView.directionalLockEnabled=YES;
    self.myScrollView.bounces=NO;
//    self.myScrollView.hidden = YES;
    self.segmentControl.segmentedControlStyle= UISegmentedControlStyleBar;//设置
    self.segmentControl.tintColor = [UIColor colorWithRed:23/255.0 green:116/255.0 blue:185/255.0 alpha:1.0];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(action)];
    self.segmentControl.frame=CGRectMake(40, 75, 295, 35);
    self.navigationItem.rightBarButtonItem=rightItem;
}

- (void)action
{
    NSLog(@"UIBarButtonSystemItemActionclick");
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

- (IBAction)selectdidClick:(UISegmentedControl *)sender {
    NSLog(@"segmentControlclick");
    switch (self.segmentControl.selectedSegmentIndex) {
        case 0:
            self.mybackgroundImage.image=[UIImage imageNamed:@"product.jpg"];
            self.mybackgroundImage.frame=CGRectMake(0, 0, 375, 2244);
            self.myScrollView.contentSize=self.mybackgroundImage.bounds.size;
            self.tianjiafujiaxianBtn.hidden=YES;
            self.liyiyanshiBtn.hidden=YES;
            break;
        case 1:
            self.mybackgroundImage.image=[UIImage imageNamed:@"toubaoshili.jpg"];
            self.mybackgroundImage.frame=CGRectMake(0, 0, 375, 2596);
            self.myScrollView.contentSize=self.mybackgroundImage.bounds.size;
            self.tianjiafujiaxianBtn.hidden=YES;
            self.liyiyanshiBtn.hidden=YES;
            break;
        default:
            self.mybackgroundImage.image=[UIImage imageNamed:@"ziuojihuashubackimage.jpg"];
            self.mybackgroundImage.frame=CGRectMake(0, 0, 375, 1004);
            self.myScrollView.contentSize=self.mybackgroundImage.bounds.size;
            self.tianjiafujiaxianBtn.hidden=NO;
            self.liyiyanshiBtn.hidden=NO;
            break;
    }
}
- (IBAction)addfujianxian:(id)sender {
    NSLog(@"addfujianxianclick");
    self.coverView.hidden=NO;
    self.addfujianxianImage.hidden=NO;
    self.closeBtn.hidden=NO;
    [self.myScrollView bringSubviewToFront:self.addfujianxianImage];
    [self.myScrollView bringSubviewToFront:self.closeBtn];
}
- (IBAction)close:(id)sender {
    self.coverView.hidden=YES;
    self.addfujianxianImage.hidden=YES;
    self.closeBtn.hidden=YES;
}
@end
