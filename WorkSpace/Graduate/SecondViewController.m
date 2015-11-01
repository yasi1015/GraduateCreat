//
//  SecondViewController.m
//  test
//
//  Created by 高島良祐 on 2015/09/11.
//  Copyright (c) 2015年 高島良祐. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    cource = [[UITextField alloc] initWithFrame:CGRectMake(106,100,160,80)];
    alltime = [[UITextField alloc]initWithFrame:CGRectMake(106, 145, 160, 80)];
    averageTime = [[UITextField alloc]initWithFrame:CGRectMake(220, 190, 160, 80)];
    hope = [[UITextField alloc]initWithFrame:CGRectMake(150, 290, 160, 80)];
    place = [[UITextField alloc]initWithFrame:CGRectMake(180,332,160,80)];
    time =[[UITextField alloc]initWithFrame:CGRectMake(175, 377, 160, 80)];
    [self titleInit];
    [self myTableView];
    // Do any additional setup after loading the view, typically from a nib.}
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

-(void)titleInit{
    NSLog(@"called!:titleInit");
    //titleList = [NSArray arrayWithObject:@"科目名:",@"総時間:",@"1日当たりの平均時間:",nil];
    //cellの内容
    //科目内のセル内容
    //タイムマシン内のセル内容
    titleList = [NSArray arrayWithObjects:@"科目名:", @"総時間:", @"1日当たりの平均時間:", nil ];
    NSLog(@"titleList:%@", [NSString stringWithCString:[titleList.description cStringUsingEncoding:NSASCIIStringEncoding] encoding:NSNonLossyASCIIStringEncoding]);
    
    
    sectionList = [NSArray arrayWithObjects:@"科目名",@"動機",nil];
    timeMachine = [NSArray arrayWithObjects:@"動機の理由:",@"勉強をする場所:",@"勉強をする時間:",nil];
    //データをまとめる
    datas = [NSArray arrayWithObjects:titleList,timeMachine,nil];
    dataSource = [NSDictionary dictionaryWithObjects:datas forKeys:sectionList];
    

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"called!:numberOfSectionsInTableView");
    return [sectionList count];
}
//セクションに含まれる行の数

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"called! numberOfRowsInSection");
    NSString *sectionName = [sectionList objectAtIndex:section];
    return [[dataSource objectForKey:sectionName ]count];
}
//行に表示するデータの生成

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
  
    
    if (cell == nil) {
   
        //cource.delegate = self;
        //alltime.delegate = self;
        //passTextFld.autocapitalizationType = UITextAutocapitalizationTypeNone;
        //passTextFld.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
        
        
        if( indexPath.row == 0 ) {
                    if(indexPath.section == 0){
                        NSLog(@"called! indexpath.row = 0");
                        cource.placeholder = @"xxxxxxxxx";
                        cource.returnKeyType = UIReturnKeyNext;
                        cource.secureTextEntry = NO;
                        [self.view addSubview:cource];
                        }
        }
        
        
        if(indexPath.section == 0){
                if(indexPath.row == 1){
                    NSLog(@"called! indexpath.row = 1");
                    alltime.placeholder = @"xxxxxxxxx";
                    [self.view addSubview:alltime];
                }
            if(indexPath.row == 2){
                NSLog(@"called! indexpath.row = 2");
                averageTime.placeholder = @"平均時間を入力してください";
                [self.view addSubview:averageTime];
            }
       }
        
        if(indexPath.section == 1){
            if(indexPath.row == 0){
                NSLog(@"indexPath.row = 1-0");
                hope.placeholder = @"動機を記入してください";
                [self.view addSubview:hope];
                
            }
            if(indexPath.row == 1){
                NSLog(@"indexPath.row = 1-1");
                place.placeholder = @"場所を入力してください";
                [self.view addSubview:place];
            }
            if(indexPath.row == 2){
                NSLog(@"indexPath.row = 1-2 ");
                time.placeholder = @"時間を入力してください";
                [self.view addSubview:time];
            }
        }

        

    }
    NSString *sectionName = [sectionList objectAtIndex:indexPath.section];
    NSArray *items = [dataSource objectForKey:sectionName];
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    // セルにテキストを設定
    // セルの内容はNSArray型の「items」にセットされているものとする
    
    
    
    
    return cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [sectionList objectAtIndex:section];
}

    /*- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
 return [NSString stringWithFormat:@"",(long)section];
 }*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath");
    NSLog(@"indexPath.section:%ld",(long)indexPath.section);
    //セルの処理分け
    if((long)indexPath.section == 0){
        NSLog(@"section:%ldがタップされました",(long)indexPath.section);
        switch(indexPath.row){
         case 0:
         NSLog(@"indexPath.rowがタップされました：%ld",(long)indexPath.row);
         //passTextFld.delegate = self;
         [cource becomeFirstResponder];
         break;
         case 1:
         NSLog(@"indexPath.row：%ld",(long)indexPath.row);
         [alltime becomeFirstResponder];
         break;
         case 2:
         NSLog(@"indexPath.row：%ld",(long)indexPath.row);
         [averageTime becomeFirstResponder];
         break;
        }
    }
    else{
      NSLog(@"section:%dがタップされました",indexPath.section);
        switch(indexPath.row){
            case 0:
                NSLog(@"indexPath.rowがタップされました：%ld",(long)indexPath.row);
                [hope becomeFirstResponder];
                break;
            case 1:
                NSLog(@"indexPath.row：%ld",(long)indexPath.row);
                [place becomeFirstResponder];
                break;
            case 2:
                NSLog(@"indexPath.row：%ld",(long)indexPath.row);
                [time becomeFirstResponder];
                break;
        }

    }
 
 
}

-(void)hoge:(UITextField*)textfield{
    // ここに何かの処理を記述する
    // （引数の textfield には呼び出し元のUITextFieldオブジェクトが引き渡されてきます）
    NSLog(@"called! hoge");
}






@end
