//
//  AppDelegate.h
//  test
//
//  Created by 高島良祐 on 2015/09/11.
//  Copyright (c) 2015年 高島良祐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UIWindow *window;
    FirstViewController *tableViewController;
    UINavigationController *navigationController1;
    UINavigationController *navigationController2;
    UINavigationController *navigationController3;
    NSArray * navi;
 
}

@property (strong, nonatomic) UIWindow *window;

//@property (nonatomic, retain) UITabBarController *tabBarController;

@end

