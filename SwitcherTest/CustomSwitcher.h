//
//  CustomSwitcher.h
//  TaoTaoPoker
//
//  Created by zgy on 2017/1/18.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSwitcher : UIControl

@property (nonatomic,   copy) NSArray *titles;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) NSUInteger selectedIndex;

@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) UIColor *selectTextColor;
@property (nonatomic, strong) UIColor *indicatorColor;

- (instancetype)initWithTitles:(NSArray *)titles;

@end
