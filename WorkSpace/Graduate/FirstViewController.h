//
//  FirstViewController.h
//  test
//
//  Created by 高島良祐 on 2015/09/11.
//  Copyright (c) 2015年 高島良祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UIWindow *window;
    UITableView *table;
    NSDictionary *dataSource;
    UITableView *myTableView;
    
    NSString *textFieldSave;
    NSDictionary *dict;
    NSArray *sectionList;
    NSString *MY_KEY;
    int count;
    int x;

    
}

@property (nonatomic, strong) NSArray *timeZoneNames;
@property  NSArray *items;
@property  NSArray *array;
@property  NSArray *test;


@end
