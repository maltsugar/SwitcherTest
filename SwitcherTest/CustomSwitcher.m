//
//  CustomSwitcher.m
//  TaoTaoPoker
//
//  Created by zgy on 2017/1/18.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "CustomSwitcher.h"
#import "UIView+Extension.h"

@interface CustomSwitcher ()
{
    UIView *_bgIndicator;
}
@property (nonatomic, strong) NSMutableArray *menuBtns;

@end

@implementation CustomSwitcher

#pragma mark- initialize
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatIndicator];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self creatIndicator];
    }
    return self;
}

- (instancetype)initWithTitles:(NSArray *)titles
{
    self = [super init];
    if (self) {
        _titles = titles;
        [self creatIndicator];
        [self setupMenuBtn];
    }
    return self;
}

#pragma mark- setter
- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
    [self setupMenuBtn];
    [self layoutIfNeeded];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    if (selectedIndex > self.menuBtns.count - 1) {
        selectedIndex = (int)self.menuBtns.count - 1;
    }
    
    _selectedIndex = selectedIndex;
    
    if (self.menuBtns.count) {
        for (UIButton *btn in self.menuBtns) {
            btn.selected = NO;
        }
        
        
        UIButton *btn = self.menuBtns[selectedIndex];
        btn.selected = YES;
        _bgIndicator.center = btn.center;
    }
    
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    for (UIButton *btn in self.menuBtns) {
        btn.titleLabel.font = font;
    }
}

- (void)setNormalTextColor:(UIColor *)normalTextColor
{
    _normalTextColor = normalTextColor;
    for (UIButton *btn in self.menuBtns) {
        [btn setTitleColor:normalTextColor forState:UIControlStateNormal];
    }
}

- (void)setSelectTextColor:(UIColor *)selectTextColor
{
    _selectTextColor = selectTextColor;
    for (UIButton *btn in self.menuBtns) {
        [btn setTitleColor:selectTextColor forState:UIControlStateSelected];
    }

}

- (void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    _bgIndicator.backgroundColor = indicatorColor;
}

#pragma mark- setupContent
- (void)setupMenuBtn
{
    [self.menuBtns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.menuBtns removeAllObjects];
    
    for (NSString *title in _titles) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:_normalTextColor?:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:_selectTextColor?:[UIColor whiteColor] forState:UIControlStateSelected];
        if (_font) {
            btn.titleLabel.font = _font;
        }
        [btn addTarget:self action:@selector(switchBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.menuBtns addObject:btn];
    }
}

- (void)switchBtnAction:(UIButton *)sender
{
    NSUInteger idx = [self.menuBtns indexOfObject:sender];
    self.selectedIndex = idx;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark-
- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.menuBtns.count) {
        
        
        CGFloat width = CGRectGetWidth(self.frame);
        CGFloat height = CGRectGetHeight(self.frame);
        
        CGFloat btnW = (width-4)/self.menuBtns.count;
        CGFloat btnH = height - 4;
        
        _bgIndicator.width = btnW;
        _bgIndicator.height = btnH;
        
        for (int i = 0; i < self.menuBtns.count; i ++) {
            UIButton *btn = self.menuBtns[i];
            btn.frame = CGRectMake(2+(btnW*i), 2, btnW, btnH);
        }
        
        self.selectedIndex = self.selectedIndex;
    } 
}

- (NSMutableArray *)menuBtns
{
    if (nil == _menuBtns) {
        _menuBtns = [[NSMutableArray alloc]init];
    }
    return _menuBtns;
}

- (void)creatIndicator
{
    self.layer.cornerRadius = 5.0;
    self.clipsToBounds = YES;
    
    _bgIndicator = [[UIView alloc]init];
    _bgIndicator.backgroundColor = _indicatorColor?:[UIColor orangeColor];
    _bgIndicator.layer.cornerRadius = 5.0;
    _bgIndicator.clipsToBounds = YES;
    [self addSubview:_bgIndicator];
}



@end
