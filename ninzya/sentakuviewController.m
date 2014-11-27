//
//  sentakuviewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/20.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "sentakuviewController.h"
#import "ViewController.h"

@interface sentakuviewController ()

@end

@implementation sentakuviewController{
    AppDelegate *app; //変数管理
    Sound *mySound; //音源クラスのインスタンス
}

- (void)viewDidLoad {
    mySound = [[Sound alloc]init]; //音源クラスのインスタンス初期化
    [super viewDidLoad];
    app = [[UIApplication sharedApplication] delegate]; //変数管理のデリゲート
    
    // Do any additional setup after loading the view.
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

- (IBAction)syokyu:(id)sender {
    app.cleartime = 600;
    app.kaihi = 2;
    app.level = 1;
    [app.opsound soundOpeningStop];
    app.opsound = nil;
    [mySound soundbutton];
}

- (IBAction)tyukyu:(id)sender {
    app.cleartime = 3600;
    app.kaihi = 4;
    app.level = 2;
    [app.opsound soundOpeningStop];
    app.opsound = nil;
    [mySound soundbutton];}

- (IBAction)zyokyu:(id)sender {
    app.cleartime = 10800;
    app.kaihi = 6;
    app.level = 3;
    [app.opsound soundOpeningStop];
    app.opsound = nil;
    [mySound soundbutton];
    
}
@end
