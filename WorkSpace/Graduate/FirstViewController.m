//
//  FirstViewController.m
//  test
//
//  Created by 高島良祐 on 2015/09/11.
//  Copyright (c) 2015年 高島良祐. All rights reserved.
//

#import "FirstViewController.h"
#import "AddTheGoal.h" //add
#import "SecondViewController.h"


@implementation FirstViewController{
    
}
@synthesize items;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Called!:firstVieController");
     self.navigationItem.title = @"目標管理";
    self.title = @"目標管理";
    self.hidesBottomBarWhenPushed = NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController setToolbarHidden:YES animated:YES];
    [self deBugInit];
    [self secondViewDidLoad];
    [self UINavigationController];
    [self myTableView];
    [self ipadoriphone];

   
   
    count = 0;
    
   
    // Do any additional setup after loading the view, typically from a nib.}
}

-(void)ipadoriphone{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        NSLog(@"iPhoneの処理");
    }
    else{
        NSLog(@"iPadの処理");
    }
}

-(void)secondViewDidLoad{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _array = [defaults objectForKey:@"Key01"];
    
    NSLog(@"array:%@",_array);
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults persistentDomainForName:appDomain];
    NSLog(@"FirstVCdefualts:%@", dic);
    items = _array;
    NSLog(@"items:%@",items);

}

-(void)myTableView{
    NSLog(@"myTableView");
    myTableView = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStyleGrouped];
    //myTableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//セクションに含まれる行の数

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
//行に表示するデータの生成

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath");
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
       if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
    }
    else {

        cell.textLabel.text = [items objectAtIndex:indexPath.row];

        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    // セルにテキストを設定
    // セルの内容はNSArray型の「items」にセットされているものとする
    
   
    
    
    return cell;

}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"科目",(long)section];
}
/*- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"",(long)section];
}*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath");
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //後続処理
    NSLog(@"didselect items:%@",items);
    x = [items count];
    
    NSLog(@"didSelectRowAtIndexPath 要素数:%d",x);
    //cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    if(count < x){
        count++;
        NSLog(@"if文：count %d",count);
        cell.textLabel.text = [items objectAtIndex:indexPath.row];
    }
    
    else{
        NSLog(@"countover:%d",count);
    }
    SecondViewController *second = [SecondViewController new];
    
    [self.navigationController pushViewController:second animated:NO];
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

    
    
    UIBarButtonItem *btn_left =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemCompose  // スタイルを指定
     target:self  // デリゲートのターゲットを指定
     action:@selector(buttonPressed:)  // ボタンが押されたときに呼ばれるメソッドを指定
     ];
    self.navigationItem.leftBarButtonItem = btn_left;
   
}

//selector


- (void)ButtonPressed:(id) sender{
    // ここに処理を書く
    NSLog(@"ButtonPreesed");
}

- (void)buttonPressed:(id) sender{
    // ここに処理を書く
    NSLog(@"buttonPreesed");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _array = [defaults objectForKey:@"mar"];

    NSLog(@"array:%@",_array);

    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults persistentDomainForName:appDomain];
    NSLog(@"FirstVCdefualts:%@", dic);
    items = _array;
    NSLog(@"items:%@",items);
    
    int x = [items count];
    NSLog(@"要素数:%d",x);
    
}

-(void)deBugInit{
    
    NSLog(@"Call!deBugInit");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _array = [defaults objectForKey:@"mar"];
    
    NSLog(@"array:%@",_array);
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults persistentDomainForName:appDomain];
    NSLog(@"FirstVCdefualts:%@", dic);
    items = _array;
    NSLog(@"items:%@",items);
    
    x = [items count];
    NSLog(@"要素数:%d",x);
}


@end
