//
//  FileViewController.h
//  test
//
//  Created by 高島良祐 on 2015/11/03.
//  Copyright © 2015年 高島良祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileViewController : UIViewController <UITableViewDelegate>{
    NSArray *dataSource;
    NSArray *list;
    NSString *homedir;
    UITableView *myTableView;
}

@property (strong, nonatomic) UIWindow *window;

@end