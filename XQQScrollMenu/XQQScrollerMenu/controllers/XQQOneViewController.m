//
//  XQQOneViewController.m
//  XQQScrollerMenu
//
//  Created by XQQ on 16/10/13.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQOneViewController.h"
#import "AppDelegate.h"
@interface XQQOneViewController ()

@end

@implementation XQQOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XQQRandomColor;
    NSLog(@"第 -1- 个");
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

@end
