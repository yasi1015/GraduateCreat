//
//  SecondViewController.h
//  test
//
//  Created by 高島良祐 on 2015/09/11.
//  Copyright (c) 2015年 高島良祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UITextViewDelegate,UITextFieldDelegate>{
   UITableView *myTableView;
    NSArray *titleList;
    NSArray *sectionList;
    NSArray *timeMachine;
    NSArray *datas;
    NSDictionary *dataSource;
    UITextField *cource;
    UITextField *alltime;
    UITextField *averageTime;
    UITextField *hope;
    UITextField *place;
    UITextField *time;
}

@end
