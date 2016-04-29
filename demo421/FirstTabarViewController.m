//
//  FirstTabarViewController.m
//  demo421
//
//  Created by 王伟 on 16/4/21.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "FirstTabarViewController.h"
#import "ZhuangYuanHongViewController.h"


#define SelfH self.view.frame.size.height

#define SelfW self.view.frame.size.width

#define CorlorValue 234

@interface FirstTabarViewController ()
{
    UIView *view1;
    UIView *view2;

    
    UIButton *btn11;
    UIButton *btn13;
    UIButton *btn24;
    UIImageView *image21;
    UIImageView *image22;
    UIImageView *image23;
    UIImageView *image12;
    BOOL change1;
    BOOL change2;
    
    UIScrollView *myScroll;
}

/**
 表格内容数组1
 */
@property (nonatomic, strong) NSMutableArray *contents1;
/**
 表格内容数组2
 */
@property (nonatomic, strong) NSMutableArray *contents2;
@end

@implementation FirstTabarViewController



- (instancetype)init
{
    if (self=[super init]) {
        UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self=[storyBoard instantiateViewControllerWithIdentifier:@"FirstTabarViewController"];
    }
    return self;
}



- (void)setupView1
{
    btn11=[UIButton buttonWithType:UIButtonTypeCustom];
    btn11.adjustsImageWhenHighlighted=NO;
    btn11.frame=CGRectMake(0, 0, 375, 103);
    [btn11 setImage:[UIImage imageNamed:@"状元红"] forState:UIControlStateNormal];
    [btn11 addTarget:self action:@selector(zhuangyuanhong) forControlEvents:UIControlEventTouchUpInside];
    
    [myScroll addSubview:btn11];
    myScroll.contentSize = CGSizeMake(SelfW, self.view.frame.size.height-49);
    
    btn13 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn13.adjustsImageWhenHighlighted=NO;
    btn13.frame = CGRectMake(0, CGRectGetMaxY(btn11.frame), 375, 45);
    [btn13 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn13.tag = 1;
    //    btn13.backgroundColor = [UIColor whiteColor];
    [btn13 setImage:[UIImage imageNamed:@"查看更多_down"] forState:UIControlStateNormal];
    //[btn1 setBackgroundImage:[UIImage imageNamed:@"arrow_up"] forState:UIControlStateNormal];
    
    [myScroll addSubview:btn13];
    myScroll.scrollEnabled=NO;
}


- (void)setupView2
{
    image21=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"安全保"]];
    image21.frame=CGRectMake(0, CGRectGetMaxY(btn13.frame), 375, 95);
    
    [myScroll addSubview:image21];
    
    btn24=[UIButton buttonWithType:UIButtonTypeCustom];
    btn24.adjustsImageWhenHighlighted=NO;
    btn24.frame = CGRectMake(0, CGRectGetMaxY(image21.frame), 375, 45);
    [btn24 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn24.tag = 2;
    //    btn13.backgroundColor = [UIColor whiteColor];
    [btn24 setImage:[UIImage imageNamed:@"查看更多_down"] forState:UIControlStateNormal];

//    btn24.backgroundColor=[UIColor greenColor];
    [myScroll addSubview:btn24];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    image12=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"满堂红"]];
    image22=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"幸福相伴"]];
    image22.frame=CGRectMake(0, CGRectGetMaxY(image21.frame), 375, 81);
    image23=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"如意安康"]];
    image23.frame=CGRectMake(0, CGRectGetMaxY(image22.frame), 375, 84);
    change1 = YES;
    change2 = NO;
    
    //    self.view.backgroundColor=[UIColor colorWithRed:CorlorValue/255.0 green:CorlorValue/255.0 blue:CorlorValue/255.0 alpha:1];
    
    self.view.backgroundColor=[UIColor redColor];
    myScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SelfW, SelfH-49)];
    [self.view addSubview:myScroll];
    [self setupView1];
    [self setupView2];
//    self.contents1 = [[NSMutableArray alloc] initWithObjects:
//                      @"状元红",
//                      @"满堂红",
//                      nil];
//    
//    self.contents2 = [[NSMutableArray alloc] initWithObjects:
//                      @"安全保",
//                      @"幸福相伴",
//                      @"如意安康",
//                      nil];

//        myScroll.backgroundColor=[UIColor yellowColor];
    myScroll.backgroundColor=[UIColor colorWithRed:CorlorValue/255.0 green:CorlorValue/255.0 blue:CorlorValue/255.0 alpha:1];
    [self reloadView1];
}

- (void)zhuangyuanhong
{
    NSLog(@"zhuangyuanhong");
    ZhuangYuanHongViewController *zhuangyuanhongVC = [[ZhuangYuanHongViewController alloc] init];
    zhuangyuanhongVC.hidesBottomBarWhenPushed = YES;// 进入后隐藏tabbar
    [self.navigationController pushViewController:zhuangyuanhongVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;// 退出时显示tabbar
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"";
    
    self.navigationItem.backBarButtonItem = backItem;
}

- (void)reloadView1
{
    NSLog(@"reloadView1");
    
    if (change1) {//展开
        [btn13 setImage:[UIImage imageNamed:@"查看更多_up"] forState:UIControlStateNormal];
        image12.frame=CGRectMake(0, CGRectGetMaxY(btn11.frame)-1, 375, 82);
        [myScroll addSubview:image12];
        btn13.frame=CGRectMake(0, CGRectGetMaxY(image12.frame), 375, 45);
        image21.frame=CGRectMake(0, CGRectGetMaxY(btn13.frame), 375, 95);
        image22.frame=CGRectMake(0, CGRectGetMaxY(image21.frame), 375, 81);
        image23.frame=CGRectMake(0, CGRectGetMaxY(image22.frame), 375, 84);
        if (change2) {
            btn24.frame = CGRectMake(0, CGRectGetMaxY(image23.frame), 375, 45);
        } else {
            btn24.frame = CGRectMake(0, CGRectGetMaxY(image21.frame), 375, 45);
        }
    } else {
        [btn13 setImage:[UIImage imageNamed:@"查看更多_down"] forState:UIControlStateNormal];
        [image12 removeFromSuperview];
        btn13.frame = CGRectMake(0, CGRectGetMaxY(btn11.frame)-1, 375, 45);
        image21.frame=CGRectMake(0, CGRectGetMaxY(btn13.frame), 375, 95);
        image22.frame=CGRectMake(0, CGRectGetMaxY(image21.frame), 375, 81);
        image23.frame=CGRectMake(0, CGRectGetMaxY(image22.frame), 375, 84);
        if (change2) {
            btn24.frame = CGRectMake(0, CGRectGetMaxY(image23.frame), 375, 45);
        } else {
            btn24.frame = CGRectMake(0, CGRectGetMaxY(image21.frame), 375, 45);
        }
        
    }
    
}

- (void)reloadView2
{
    NSLog(@"reloadView2");
    if (change2) {//展开
        [btn24 setImage:[UIImage imageNamed:@"查看更多_up"] forState:UIControlStateNormal];
        image21.frame=CGRectMake(0, CGRectGetMaxY(btn13.frame), 375, 95);
        image22.frame=CGRectMake(0, CGRectGetMaxY(image21.frame), 375, 81);
        image23.frame=CGRectMake(0, CGRectGetMaxY(image22.frame), 375, 84);
        btn24.frame=CGRectMake(0, CGRectGetMaxY(image23.frame), 375, 45);
        [myScroll addSubview:image22];
        [myScroll addSubview:image23];
    } else {
        [btn24 setImage:[UIImage imageNamed:@"查看更多_down"] forState:UIControlStateNormal];
        [image22 removeFromSuperview];
        [image23 removeFromSuperview];
        btn24.frame = CGRectMake(0, CGRectGetMaxY(image21.frame), 375, 45);
    }
}


-(void)btnAction:(UIButton *)btn
{
    if(btn.tag == 1)
    {
        change1 = !change1;
        [self reloadView1];
        
    }
    else
    {
        change2 = !change2;
        [self reloadView2];
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
