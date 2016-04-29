//
//  CalculationViewController.m
//  demo421backup
//
//  Created by 王伟 on 16/4/21.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "CalculationViewController.h"

@interface CalculationViewController ()
- (IBAction)calculator:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *coverView;
- (IBAction)close:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *jieguoimage;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@end

@implementation CalculationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"保费试算";
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

- (IBAction)calculator:(id)sender {
    self.coverView.hidden=NO;
    self.jieguoimage.hidden=NO;
    self.closeBtn.hidden=NO;
    [self.view bringSubviewToFront:self.jieguoimage];
    [self.view bringSubviewToFront:self.closeBtn];
}
- (IBAction)close:(id)sender {
    self.coverView.hidden=YES;
    self.jieguoimage.hidden=YES;
    self.closeBtn.hidden=YES;
    
}
@end
