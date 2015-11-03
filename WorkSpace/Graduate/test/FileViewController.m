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
    
    list = [fileManager contentsOfDirectoryAtPath:homedir error:&error];
    NSLog(@"list = %@",list);
    
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





@end
