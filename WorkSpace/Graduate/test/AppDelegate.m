//
//  AppDelegate.m
//  test
//
//  Created by 高島良祐 on 2015/09/11.
//  Copyright (c) 2015年 高島良祐. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h" //add
#import "SecondViewController.h" //add
#import "NoteFunction.h"
#import "FileViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


@synthesize window; //追加
//@synthesize tabBarController; //追加


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1 ステータスバー領域を含む画面のサイズを返す
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //2 UIViewControllerの生成
    FirstViewController *firstViewController = [[FirstViewController alloc] initWithNibName:nil bundle:nil];
    FileViewController *fileViewController = [[FileViewController alloc] initWithNibName:nil bundle:nil];
    NoteFunction *noteFunction = [[NoteFunction alloc]initWithNibName:nil bundle:nil];
    
    
    


    //3 UINavigationControllerの生成
    navigationController1 = [[UINavigationController alloc]initWithRootViewController:firstViewController];
    navigationController2 = [[UINavigationController alloc]initWithRootViewController:noteFunction];
    navigationController3 = [[UINavigationController alloc]initWithRootViewController:fileViewController];

    //4 NavigationControllerを配列にしてまとめる
    navi = [NSArray arrayWithObjects:navigationController1,navigationController3,nil];
    //5 tabbarcontrollerの生成
    UITabBarController *tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    [tabBarController setViewControllers:navi animated:NO];

    self.window.rootViewController = tabBarController;
    noteFunction.title = @"ノート";
    fileViewController.title = @"メモ一覧";

    [window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
    
    
    /*
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(detectedTapGesture:)];
    [window addGestureRecognizer:tapGestureRecognizer];
    */
  
    return YES;
     
}

/*- (void)detectedTapGesture:(UITapGestureRecognizer *)sender {
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    CGPoint point = [sender locationOfTouch:0 inView:window];
    NSLog(@"tap point: %@", NSStringFromCGPoint(point));
    
}
 */

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
