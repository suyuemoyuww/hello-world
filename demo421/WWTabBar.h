//
//  WWTabBar.h
//  彩票01-搭建基本框架ww
//
//  Created by 王伟 on 15/7/23.
//  Copyright (c) 2015年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WWTabBar;

@protocol WWTabBarDelegate <NSObject>

@optional

- (void)tabBar:(WWTabBar *)wwTabBar didSelectButtonFrom:(int)from To:(int)to;

@end

@interface WWTabBar : UIView

@property (nonatomic,weak) id<WWTabBarDelegate> delegate;

- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName;

@end
