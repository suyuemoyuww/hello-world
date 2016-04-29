//
//  LiyiyanshiViewController.m
//  demo421backup
//
//  Created by 王伟 on 16/4/22.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "LiyiyanshiViewController.h"

@interface LiyiyanshiViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *mybackgroundImage;
- (IBAction)segmentClick:(id)sender;
- (IBAction)lingqushezhi:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *lingqushezhi;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UIImageView *lingqushezhiimage;
- (IBAction)close:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
- (IBAction)quedingclick:(id)sender;


@end

@implementation LiyiyanshiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView *backgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, 64, 375, 60)];
    backgroundView.backgroundColor=[UIColor whiteColor];
    [self.view insertSubview:backgroundView belowSubview:self.segmentControl];
    self.title=@"状元红（尊享版）";
    self.myScrollView.delegate=self;
    self.myScrollView.contentSize=self.mybackgroundImage.bounds.size;
    self.mybackgroundImage.userInteractionEnabled=YES;
    self.myScrollView.directionalLockEnabled=YES;
    self.myScrollView.bounces=NO;
    self.segmentControl.frame=CGRectMake(40, 75, 295, 35);
    self.segmentControl.segmentedControlStyle= UISegmentedControlStyleBar;//设置
    self.segmentControl.tintColor = [UIColor colorWithRed:23/255.0 green:116/255.0 blue:185/255.0 alpha:1.0];
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

- (IBAction)segmentClick:(id)sender {
    NSLog(@"segmentControlclick");
    switch (self.segmentControl.selectedSegmentIndex) {
        case 0:
            self.lingqushezhi.hidden=NO;
            self.mybackgroundImage.image=[UIImage imageNamed:@"liyiyanshi.jpg"];
            self.mybackgroundImage.frame=CGRectMake(0, 0, 375, 1734);
            self.myScrollView.contentSize=self.mybackgroundImage.bounds.size;
            break;
        case 1:
            self.lingqushezhi.hidden=YES;
            self.mybackgroundImage.image=[UIImage imageNamed:@"companyjiesao.jpg"];
            self.mybackgroundImage.frame=CGRectMake(0, 0, 375, 1015);
            self.myScrollView.contentSize=self.mybackgroundImage.bounds.size;
            break;
        default:
            self.lingqushezhi.hidden=YES;
            self.mybackgroundImage.image=[UIImage imageNamed:@"baoxianlinian.jpg"];
            self.mybackgroundImage.frame=CGRectMake(0, 0, 375, 1741);
            self.myScrollView.contentSize=self.mybackgroundImage.bounds.size;
            break;
    }
}

- (IBAction)lingqushezhi:(id)sender {
    NSLog(@"领取设置");
    NSLog(@"addfujianxianclick");
    self.coverView.hidden=NO;
    self.lingqushezhiimage.hidden=NO;
    self.closeBtn.hidden=NO;
    self.confirmBtn.hidden=NO;
    [self.myScrollView bringSubviewToFront:self.lingqushezhiimage];
    [self.myScrollView bringSubviewToFront:self.closeBtn];
    [self.myScrollView bringSubviewToFront:self.confirmBtn];
}
- (IBAction)close:(id)sender {
    NSLog(@"close");
    self.coverView.hidden=YES;
    self.lingqushezhiimage.hidden=YES;
    self.closeBtn.hidden=YES;
    self.confirmBtn.hidden=YES;
}
- (IBAction)quedingclick:(id)sender {
    NSLog(@"确定");
    [self close:nil];
}
@end
