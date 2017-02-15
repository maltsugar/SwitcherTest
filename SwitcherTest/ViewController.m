//
//  ViewController.m
//  SwitcherTest
//
//  Created by zgy on 2017/2/15.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "ViewController.h"
#import "CustomSwitcher.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CustomSwitcher *customSwitcher;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_customSwitcher setTitles:@[@"9人桌", @"6人桌", @"3人桌"]];
    _customSwitcher.indicatorColor = [UIColor grayColor];
//    UIColorFromHex(0xee8a07);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
