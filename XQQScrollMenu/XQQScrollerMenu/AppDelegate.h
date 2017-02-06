//
//  AppDelegate.h
//  XQQScrollerMenu
//
//  Created by XQQ on 16/10/13.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#define XQQColorAlpa(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define XQQColor(r,g,b)         XQQColorAlpa((r),(g),(b),255)
#define XQQRandomColor          XQQColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
#define XQQGrayColor(r)  XQQColor((r),(r),(r))
#define XQQBGColor       XQQGrayColor(214)
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

