//
//  FileViewController.m
//  test
//
//  Created by 高島良祐 on 2015/11/03.
//  Copyright © 2015年 高島良祐. All rights reserved.
//

#import "FileViewController.h"
#import "NoteFunction.h"

@implementation FileViewController

-(void)viewDidLoad{
    myTableView = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStyleGrouped];
    [self secondViewDidLoad];
    [self myTableView];
    [self fileInit];
    [self UINavigationController];
     NSLog(@" dataSource = %@", dataSource);
 
}

-(void)secondViewDidLoad{
    NSLog(@"FileViewControllerに遷移しました");
    self.title = @"ファイル作成";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    //[list removeAllObjects];
 

}

-(void)myTableView{
    NSLog(@"myTableView");
 
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
    dataSource = list;
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
    return [dataSource count];
    //return [list count];
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
    //NSLog(@"list = %@ new!",list);
    NSLog(@"datasource = %@ ",dataSource);
    
    cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
    NSLog(@"cell = %@",cell.textLabel.text);
    
    return cell;
}

/**
 * セルが選択されたとき
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"「%@」が選択されました", [list objectAtIndex:indexPath.row]);
    NoteFunction *note = [NoteFunction new];
    
    [self.navigationController pushViewController:note animated:NO];
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
    
    //左ボタン
    UIBarButtonItem *btn2 =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemCompose  // スタイルを指定
     target:self  // デリゲートのターゲットを指定
     action:@selector(ButtonDelete:)  // ボタンが押されたときに呼ばれるメソッドを指定
     ];
    
    self.navigationItem.leftBarButtonItem = btn;

    
}

-(void)ButtonPressed:(id) sender{
    NSLog(@"呼ばれました！");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
                                                
                                                NSLog(@"OK pushed");
                                                NoteFunction *note =[NoteFunction new];
                                                [self.navigationController pushViewController:note animated:NO];
                                                
                                            }]];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"text input";
        textField.delegate = self;
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)ButtonDelete:(id) sender{
    
    NSLog(@"newFileInit");
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
    NSLog(@"list = %@ new !",list);
    
    NSString *docpath = [documentsDir stringByAppendingPathComponent:string];
    
    //ファイル作成
    BOOL result = [fileManager createDirectoryAtPath:docpath
                         withIntermediateDirectories:YES
                                          attributes:nil
                                               error:&error];
    
    
    BOOL test = [fileManager removeItemAtPath:documentsDir error:&error];
    if (test) {
        NSLog(@"ファイルを削除に成功：%@", documentsDir);
        dataSource = list;
        [self -> myTableView reloadData];
        
    } else {
        NSLog(@"ファイルの削除に失敗：%@", error.description);
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    string = [NSString new];
    string = textField.text;
    NSLog(@"text = %@です",string);
    [self newFileInit];
    
    //---------------------------------
}

-(void)newFileInit{
    
    NSLog(@"newFileInit");
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
    NSLog(@"list = %@ new !",list);
    
    NSString *docpath = [documentsDir stringByAppendingPathComponent:string];
    
    //ファイル作成
    BOOL result = [fileManager createDirectoryAtPath:docpath
                         withIntermediateDirectories:YES
                                          attributes:nil
                                               error:&error];
  
    if (result) {
        NSLog(@"ディレクトリの作成に成功：%@", docpath);
    
        dataSource = list;
        NSLog(@"dataSource = %@ ",dataSource);
     [self -> myTableView reloadData];
     //[self.view addSubview:myTableView];
    } else {
        NSLog(@"ディレクトリの作成に失敗：%@", error.description);
    }
    
    /*ファイルの削除
    
    BOOL result = [fileManager removeItemAtPath:documentsDir error:&error];
    if (result) {
        NSLog(@"ファイルを削除に成功：%@", documentsDir);
    } else {
        NSLog(@"ファイルの削除に失敗：%@", error.description);
    }
  */
    
    /*ファイルの作成
     BOOL result = [fileManager createDirectoryAtPath:docpath
                         withIntermediateDirectories:YES
                                          attributes:nil
                                               error:&error];
    if (result) {
        NSLog(@"ディレクトリの作成に成功：%@", docpath);
        [myTableView reloadData];
    } else {
        NSLog(@"ディレクトリの作成に失敗：%@", error.description);
    }
    */

}



@end
