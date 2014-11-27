//
//  seikouViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/14.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "seikouViewController.h"

@interface seikouViewController ()

@end

@implementation seikouViewController{
    AppDelegate *app; //変数管理
    Sound *mySound; //音源クラスのインスタンス
}

- (void)viewDidLoad {
    app = [[UIApplication sharedApplication] delegate]; //変数管理のデリゲート
    mySound = [[Sound alloc]init]; //音源クラスのインスタンス初期化
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"成功画面に遷移");
    [mySound soundSeikou];
    
    //次の任務に移る前に時間を初期化する
    app.time = 0;
    
    if (app.level == 1) {
        self.backImageView.image = [UIImage imageNamed:@"seikoBack01.png"];
    }else if (app.level == 2) {
        self.backImageView.image = [UIImage imageNamed:@"seikoBack02.png"];
    }else if (app.level == 3) {
        self.backImageView.image = [UIImage imageNamed:@"seikoBack03.png"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)btnToTitle:(UIButton *)sender {
    [mySound soundSeikouStop];
}

@end
