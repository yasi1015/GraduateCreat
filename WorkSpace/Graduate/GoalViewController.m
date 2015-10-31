//
//  GoalViewController.m
//  test
//
//  Created by 高島良祐 on 2015/09/12.
//  Copyright (c) 2015年 高島良祐. All rights reserved.
//

#import "GoalViewController.h"
#import "AppDelegate.h"
#import "FirstViewController.h"

@implementation GoalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"遷移しました");

    //[self SaveButtonInit];
    //[self delButtonInit];
    //ViewDidLoad内に書かなければならない
    sectionList =  [NSArray arrayWithObjects:@"人間", @"犬", @"その他", nil];
    
    // セルの項目を作成する
    NSArray *peple = [NSArray arrayWithObjects:@"Charlie", @"Sally", @"Lucy", nil];
    NSArray *dogs = [NSArray arrayWithObjects:@"Snoopy", @"Spike", @"Olaf", nil];
    NSArray *others = [NSArray arrayWithObjects:@"Woodstock", nil];
    
    // セルの項目をまとめる
    NSArray *datas = [NSArray arrayWithObjects:peple, dogs, others, nil];
    
    dataSource = [NSDictionary dictionaryWithObjects:datas forKeys:sectionList];
}

/**
 * テーブル全体のセクションの数を返す
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionList count];
}

/**
 * 指定されたセクションのセクション名を返す
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionList objectAtIndex:section];
}

/**
 * 指定されたセクションの項目数を返す
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionName = [sectionList objectAtIndex:section];
    return [[dataSource objectForKey:sectionName ]count];
}

/**
 * 指定された箇所のセルを作成する
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // セクション名を取得する
    NSString *sectionName = [sectionList objectAtIndex:indexPath.section];
    
    // セクション名をキーにしてそのセクションの項目をすべて取得
    NSArray *items = [dataSource objectForKey:sectionName];
    
    // セルにテキストを設定
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    return cell;
}

/**
 * セルが選択されたとき
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // セクション名を取得する
    NSString *sectionName = [sectionList objectAtIndex:indexPath.section];
    
    // セクション名をキーにしてそのセクションの項目をすべて取得
    NSArray *items = [dataSource objectForKey:sectionName];
    
    NSLog(@"「%@」が選択されました", [items objectAtIndex:indexPath.row]);
}




/*
-(void)UILabelInit{
    NSLog(@"UILabelInit");
    
    CGRect rect = CGRectMake(0, 70, 190, 60);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    // ラベルのテキストを設定
    label.text = @"目標設定";
    
    // ラベルのテキストのフォントを設定
    label.font = [UIFont fontWithName:@"Helvetica" size:16];
    // ラベルのテキストの位置を設定
    label.textAlignment = UITextAlignmentLeft;
    // ラベルの背景色を設定
    label.backgroundColor = [UIColor whiteColor];
    
    
    

    
    // ラベルをビューに追加
    [self.view addSubview:label];

}

-(void)UITextFieldInit{
    NSLog(@"UITextFieldInit");
    

    textField1 = [[UITextField alloc]initWithFrame:CGRectMake(80, 80, 190, 40)];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.placeholder = @"入力してください";
    
    
    
     [self.view addSubview:textField1];
    
 
}

-(void)TimeLabelInit{
    NSLog(@"TimeLabelInit");
    
    CGRect rect = CGRectMake(0, 140, 190, 60);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    // ラベルのテキストを設定
    label.text = @"達成時間の設定";
    
    // ラベルのテキストのフォントを設定
    label.font = [UIFont fontWithName:@"Helvetica" size:16];
    // ラベルのテキストの位置を設定
    label.textAlignment = UITextAlignmentLeft;
    // ラベルの背景色を設定
    label.backgroundColor = [UIColor whiteColor];
    
    
    
    // ラベルをビューに追加
    [self.view addSubview:label];
    
    
    UITextField *text2 = [[UITextField alloc]initWithFrame:CGRectMake(120, 150, 190, 40)];
    text2.borderStyle = UITextBorderStyleRoundedRect;
    text2.placeholder = @"入力してください";
    
    
    
    [self.view addSubview:text2];
}

-(void)lastLabeltextinit{
    NSLog(@"TimeLabelInit");
    
    CGRect rect = CGRectMake(0, 190, 190, 60);
    UILabel *label3 = [[UILabel alloc]initWithFrame:rect];
    // ラベルのテキストを設定
    label3.text = @"目標達成日";
    
    // ラベルのテキストのフォントを設定
    label3.font = [UIFont fontWithName:@"Helvetica" size:16];
    // ラベルのテキストの位置を設定
    label3.textAlignment = UITextAlignmentLeft;
    // ラベルの背景色を設定
    label3.backgroundColor = [UIColor whiteColor];
    
    
    
    // ラベルをビューに追加
    [self.view addSubview:label3];
    
    
    UITextField *text3 = [[UITextField alloc]initWithFrame:CGRectMake(120, 200, 190, 40)];
    text3.borderStyle = UITextBorderStyleRoundedRect;
    text3.placeholder = @"入力してください";
    
    
    
    [self.view addSubview:text3];
}
-(void)UItimelabeliit{
    
    CGRect rect = CGRectMake(0, 210, 190, 80);
    UILabel *label3 = [[UILabel alloc]initWithFrame:rect];
    // ラベルのテキストを設定
    label3.text = @"目標達成日";
    
    // ラベルのテキストのフォントを設定
    label3.font = [UIFont fontWithName:@"Helvetica" size:16];
    // ラベルのテキストの位置を設定
    label3.textAlignment = UITextAlignmentLeft;
    // ラベルの背景色を設定
    label3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label3];
}

-(void)UIdayTImeLabelinit{
    
    CGRect rect = CGRectMake(0, 280, 280, 80);
    UILabel *label4 = [[UILabel alloc]initWithFrame:rect];
    // ラベルのテキストを設定
    label4.text = @"1日当たりの必要勉強時間は・・・";
    
    // ラベルのテキストのフォントを設定
    label4.font = [UIFont fontWithName:@"Helvetica" size:20];
    // ラベルのテキストの位置を設定
    label4.textAlignment = UITextAlignmentLeft;
    // ラベルの背景色を設定
    label4.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label4];
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
  [textField becomeFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField1{
    // 引き続き既定の動作を行わせたい場合に YES を返します。

    [textField1 resignFirstResponder];
    
    //[self deBug];
    return NO;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Called!:textFieldDidEndEditing");
    //textfieldの格納
   
    //追加
    [mar addObject:textField1.text];
    NSLog(@"mar:%@",mar);
    
    //Userdefaultの生成
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:mar forKey:@"mar"];
    
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        NSDictionary *dic = [defaults persistentDomainForName:appDomain];
        NSLog(@"defualts:%@", dic);
    }

}
-(void)deBug{

}
-(void)saveTextField{
    NSLog(@"saveTextField");
    //-------------------------------------------------------
    //NSString型の変数にtextFieldを渡す
    textFieldSave = textField1.text;
   
    NSLog(@"textfield: %@",textFieldSave);
    //-------------------------------------------------------
    
    // UserDefaultsの生成
    userDefaults = [NSUserDefaults standardUserDefaults];
    //textfieldsaveをuserdefaultに渡す
    [userDefaults setObject:textFieldSave forKey:@"Key01"];
 
    
    FirstViewController *firstViewController =[[FirstViewController alloc]init];
    //-------------------------------------------------------
    //Logをはかせる
    NSDictionary *bundleInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleId = [bundleInfo objectForKey: @"CFBundleIdentifier"];
    
    NSUserDefaults *appUserDefaults = [[NSUserDefaults alloc] init];
    NSLog(@"Start dumping userDefaults for %@", bundleId);
    NSLog(@"userDefaults dump: %@", [appUserDefaults persistentDomainForName: bundleId]);
    NSLog(@"Finished dumping userDefaults for %@", bundleId);
    //-------------------------------------------------------
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"保存しました"
                                                  message:nil
                                                 delegate:nil
                                        cancelButtonTitle:@"ok"
                                        otherButtonTitles:nil];
    
    [alert show];
   
 

    
}

-(void)SaveButtonInit{
    // save button
    
    NSLog(@"SaveButtonInit");
    UIButton *savebtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [savebtn setTitle:@"SAVE" forState:UIControlStateNormal];
    savebtn.frame = CGRectMake(-20, 180, 100, 30);
    [self.view addSubview:savebtn];
    [savebtn addTarget:self action:@selector(Savebutton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:savebtn];
}


- (void)Savebutton:(id)sender{
    NSLog(@"Savebutton");
    
    //NSString型の変数にtextFieldを渡す
    textFieldSave = textField1.text;
    NSLog(@"textfield: %@",textFieldSave);
    
    // UserDefaultsの生成
    userDefaults = [NSUserDefaults standardUserDefaults];
    //textfieldsaveをuserdefaultに渡す
    [userDefaults setObject:textFieldSave forKey:@"Key01"];
    //NSString型のtempにuserDefault値を渡す

    
    
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"保存しました"
                                                  message:nil
                                                 delegate:nil
                                        cancelButtonTitle:@"ok"
                                        otherButtonTitles:nil];
    
    NSLog(@"NSUserDefaults dump: %@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
                         
                         
    [alert show];
   
    
}

-(void)delButtonInit{
    // dell button
    
    NSLog(@"delButtonInit");
    //delbuttonの生成
    UIButton *delbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [delbtn setTitle:@"削除" forState:UIControlStateNormal];
    delbtn.frame = CGRectMake(80, 180, 100, 30);
    [self.view addSubview:delbtn];
    [delbtn addTarget:self action:@selector(delBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delbtn];
}
  


-(void)delBtnPressed:(id)sender{
    NSLog(@"delBtnPressed");
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"削除しました"
                                                  message:nil
                                                 delegate:nil
                                        cancelButtonTitle:@"ok"
                                        otherButtonTitles:nil];
    
    [alert show];
}
*/
@end
