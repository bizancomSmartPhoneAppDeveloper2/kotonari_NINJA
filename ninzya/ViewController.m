//
//  ViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/11.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    AppDelegate *app; //変数管理
    Sound *mySound; //音源クラスのインスタンス
}

- (void)viewDidLoad {
    app = [[UIApplication sharedApplication] delegate]; //変数管理のデリゲート
    mySound = [[Sound alloc]init]; //音源クラスのインスタンス初期化
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myButton.hidden = YES;
    app.opsound = [[Sound alloc]init];
    [app.opsound soundOpening];

    //1.5秒後にメソッドを実行
    [self performSelector:@selector(backChange) withObject:nil afterDelay:1.5];
    
    //ポイントをUserDefaultsから取り出して変数に代入
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    app.point = (int)[defaults integerForKey:@"ポイント"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backChange{
    self.backImageView.image = [UIImage imageNamed:@"title_back_02.png"];
    self.myButton.hidden = NO;
    [mySound soundKatana];
}

@end

