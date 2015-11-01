//
//  NoteFunction.m
//  
//
//  Created by 高島良祐 on 2015/10/21.
//
//

#import "NoteFunction.h"

@implementation NoteFunction{
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Called!ViewDidLoad");
    [self secondViewDidLoad];
    [self UITextFieldInit];
    //[self InitToolBar];
    
    self.title = @"ノート";

    // Do any additional setup after loading the view, typically from a nib.}
    
}
-(void)secondViewDidLoad{
    NSLog(@"called!:seconViewController");
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController setToolbarHidden:YES animated:YES];
    self.view.backgroundColor = [UIColor blackColor];
}
-(void)UITextFieldInit{
    NSLog(@"called!:UITextFieldInit");
    // テキストフィールド例文
    
    
    CGRect rect = CGRectMake(0, 8, 320, 400);
    tv = [[UITextView alloc] initWithFrame:rect];
    tv.delegate = self;
    tv.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:20];
    tv.editable = YES;
    tv.scrollEnabled = NO;

    
    [self.view addSubview:tv];
}

-(void)InitToolBar{
    // toolbarの表示をONにする
    [self.navigationController setToolbarHidden:NO animated:NO];
    
    // toolbarを黒色にする
    self.navigationController.toolbar.tintColor = [UIColor blackColor];
    
    // スペーサを生成する
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                               target:nil action:nil];
    
    // ボタン「Hoge」を生成する
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithTitle:@"マーカー"
                               style:UIBarButtonSystemItemCompose
                               target:self action:@selector(hoge)];
    
    UIBarButtonItem *button2 = [[UIBarButtonItem alloc]
                               initWithTitle:@"タイトル"
                               style:UIBarButtonSystemItemCompose
                               target:self action:@selector(titleButton)];
    
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc]
                               initWithTitle:@"テスト対策"
                               style:UIBarButtonSystemItemCompose
                               target:self action:@selector(changebutton)];
    
    
    // toolbarにボタンとラベルをセットする
    NSArray *items =
    [NSArray arrayWithObjects:button,spacer,button1,spacer,button2,nil];
    self.toolbarItems = items;
}

-(void)hoge{
    NSLog(@"ボタンが押されました");
    NSRange selectedRange = self->tv.selectedRange;
    // 1文字以上を選択していたら
    if (selectedRange.length > 0) {
        NSLog(@"called if文");
        // attributedStringを取得して、Mutableにコピー。
        NSMutableAttributedString *theText = [tv.attributedText mutableCopy];
        // 選択部分だけ文字色を赤に変える。
        [theText addAttribute:NSForegroundColorAttributeName value: UIColor.redColor range:selectedRange ];
        
        NSLog(@"my range is %@", NSStringFromRange(selectedRange));
        // 変更を加えたattributedStringを戻す。
        tv.attributedText = theText;
    }

        
        

    
    NSLog(@"処理を実行します。");
    
    return;
    
    NSLog(@"処理は中止されましたか？");
}

-(void)titleButton{
    NSLog(@"titleButtonが押されました。");
    NSRange selectedRange = self->tv.selectedRange;
    // 1文字以上を選択していたら
    if (selectedRange.length > 0) {
        NSLog(@"called if文");
        // attributedStringを取得して、Mutableにコピー。
        NSMutableAttributedString *theText = [tv.attributedText mutableCopy];
        // 選択部分だけ文字色を赤に変える。
        [theText addAttribute:NSForegroundColorAttributeName value: UIColor.grayColor range:selectedRange];
        
        NSLog(@"my range is %@", NSStringFromRange(selectedRange));
        // 変更を加えたattributedStringを戻す。
        tv.attributedText = theText;
    }

}
-(void)changebutton{
    NSLog(@"changebutton");
     NSRange selectedRange = self->tv.selectedRange;
    
    if (selectedRange.length > 0) {
        // attributedStringを取得して、Mutableにコピー。
        NSMutableAttributedString *theText = [self->tv.attributedText mutableCopy];
        // 選択部分だけ文字色を赤に変える。
        [theText addAttribute: NSForegroundColorAttributeName value: UIColor.whiteColor range:selectedRange];
        //[theText addAttribute: NSForegroundColorAttributeName value: UIColor.redColor range: selectedRange];
        // 変更を加えたattributedStringを戻す。
        self->tv.attributedText = theText;
      
    }

}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    NSString *selectedText = [textView.text substringWithRange:textView.selectedRange];
    NSLog(@"selectedText:%@",selectedText);
    if(selectedText == nil || [selectedText isEqualToString:@""]){
        NSLog(@"選択されていません！");
        UITextPosition *position = [self->tv selectedTextRange];
        NSLog(@"position:%@",position);
        int posittionx = position;
        NSLog(@"int posittionx:%d",posittionx );
    }
        
}


-(void)initToolBar{
    UIView* accessoryView =[[UIView alloc] initWithFrame:CGRectMake(0,0,320,50)];
    accessoryView.backgroundColor = [UIColor whiteColor];
    
    // ボタンを作成する。
    UIButton* closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    closeButton.frame = CGRectMake(210,10,100,30);
    [closeButton setTitle:@"閉じる" forState:UIControlStateNormal];
    // ボタンを押したときによばれる動作を設定する。
    [closeButton addTarget:self action:@selector(closeKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    // ボタンをViewに貼る
    [accessoryView addSubview:closeButton];
    
    //inputText.inputAccessoryView = accessoryView;

}







@end
