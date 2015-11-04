//
//  FileViewController.m
//  test
//
//  Created by 高島良祐 on 2015/11/03.
//  Copyright © 2015年 高島良祐. All rights reserved.
//

#import "FileViewController.h"

@implementation FileViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self secondViewDidLoad];
    [self myTableView];
    [self fileInit];
    [self UINavigationController];
 
}

-(void)secondViewDidLoad{
    NSLog(@"FileViewControllerに遷移しました");
    self.title = @"ファイル作成";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

-(void)myTableView{
    NSLog(@"myTableView");
    myTableView = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStyleGrouped];
    //myTableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)fileInit{
    homedir = NSHomeDirectory();
    NSLog(@"homedir = %@",homedir);
    //NSArrayのhomedirのファイルの中を検索する
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSLog(@"fileManager %@",fileManager);
    //エラー用の変数を作成
    NSError *error;
    NSLog(@"error = %@",error);
    
    NSString *documentsDir = [homedir stringByAppendingString:@"/Documents"];
    NSLog(@"現在のディレクトリは%@です",documentsDir);
    
    list = [fileManager contentsOfDirectoryAtPath:documentsDir error:&error];
    NSLog(@"list = %@",list);
    
    NSString *docpath = [documentsDir stringByAppendingPathComponent:@"/sample"];
    BOOL result = [fileManager createDirectoryAtPath:docpath
                         withIntermediateDirectories:YES
                                          attributes:nil
                                               error:&error];
    if (result) {
        NSLog(@"ディレクトリの作成に成功：%@", docpath);
    } else {
        NSLog(@"ディレクトリの作成に失敗：%@", error.description);
    }
    
    
}
/**
 * テーブルのセルの数を返す
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [list count];
}

/**
 * 指定されたインデックスパスのセルを作成する
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // セルにテキストを設定
    NSLog(@"list = %@ new!",list);
    cell.textLabel.text = [list objectAtIndex:indexPath.row];
    NSLog(@"cell = %@",cell.textLabel.text);
    
    return cell;
}

/**
 * セルが選択されたとき
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"「%@」が選択されました", [list objectAtIndex:indexPath.row]);
    switch (indexPath.row) {
        case 0:
            NSLog(@"indexPath.row%dが選択されました",indexPath.row);
            break;
        case 1:
            NSLog(@"indexPath.row%dが選択されました",indexPath.row);
            NSString *documentsDir = [homedir stringByAppendingString:@"/Documents"];
            NSLog(@"現在のディレクトリは%@です",documentsDir);
            //SecondViewController *con = [[SecondViewController alloc]init];
            //[self.navigationController pushViewController:con animated:NO];
            //[self.window addSubview:con.view];
            //[con secondViewController];
            //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            break;
    }
}


-(void)UINavigationController{
    NSLog(@"UINavigationController");
    
    
    UIBarButtonItem *btn =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemCompose  // スタイルを指定
     target:self  // デリゲートのターゲットを指定
     action:@selector(ButtonPressed:)  // ボタンが押されたときに呼ばれるメソッドを指定
     ];
    self.navigationItem.rightBarButtonItem = btn;
    
}

-(void)ButtonPressed:(id) sender{
    NSLog(@"呼ばれました！");
   /* UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"ファイルを作成しますか？"
                               message:nil
                              delegate:self
                     cancelButtonTitle:@"YES"
                     otherButtonTitles:@"NO"];*/
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"タイトルを入力してください"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"cancel"
                                          otherButtonTitles:@"OK", nil];
    
    alert.delegate = self;
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;  //←追加
    alert.frame = CGRectMake( 0, 50, 300, 300);
    
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
    field.placeholder = @"Input data, here.";
    
    field.borderStyle = UITextBorderStyleRoundedRect;
    [field setBackgroundColor:[UIColor whiteColor]];
    field.delegate = self;
    field = [alert textFieldAtIndex:0];  //←追加
    [alert addSubview:field];//重要
    [alert show];

}


-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            NSLog(@"YESが押されました");
            //１番目のボタンが押されたときの処理を記述する
            
            break;
        case 1:
            //２番目のボタンが押されたときの処理を記述する
            break;
    }
    
}



@end
