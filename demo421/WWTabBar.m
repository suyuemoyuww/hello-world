//
//  WWTabBar.m
//  彩票01-搭建基本框架ww
//
//  Created by 王伟 on 15/7/23.
//  Copyright (c) 2015年 王伟. All rights reserved.
//

#import "WWTabBar.h"
#import "WWTabBarButton.h"

@interface WWTabBar ()
@property (nonatomic,weak) UIButton *selectedBtn;
@end

@implementation WWTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (instancetype)init
//{
//    if (self=[super init]) {
////        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancelSelectedBtn) name:@"backToHome" object:nil];
////        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(firsttabarclick) name:@"blickfirsttabar" object:nil];
//    }
//    return self;
//}

- (void)firsttabarclick
{
    [self btnClick:[self.subviews firstObject]];
}

- (void)cancelSelectedBtn
{
    self.selectedBtn.selected=NO;
    self.selectedBtn=nil;
}

- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName
{
    WWTabBarButton *button=[WWTabBarButton buttonWithType:UIButtonTypeCustom];
    
    
    //设置普通状态下得背景图片
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    
    //设置选中状态下得背景图片
    [button setImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    //将按钮添加岛自定义的TabBar中
    [self addSubview:button];
    button.tag=self.subviews.count-1;
    
    //添加按钮监听
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    if (button.tag==0) {
        [self btnClick:button];
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    for (int i=0; i<self.subviews.count; i++) {
        WWTabBarButton *button=self.subviews[i];
        
        CGFloat buttonY=0+10;
        CGFloat buttonW=self.frame.size.width/self.subviews.count;
        CGFloat buttonH=41;
        CGFloat buttonX=i*buttonW;
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
//        button.backgroundColor=[UIColor redColor];
    }
}

- (void)btnClick:(WWTabBarButton *)button
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:To:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedBtn.tag To:button.tag];
    }
    
    self.selectedBtn.selected=NO;
    
    button.selected=YES;
    
    self.selectedBtn=button;
    
//    self.selectedIndex=button.tag;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
