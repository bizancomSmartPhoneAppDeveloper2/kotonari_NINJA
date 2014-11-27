//
//  prologueViewController.m
//  ninzya
//
//  Created by ビザンコムマック　13 on 2014/11/22.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "prologueViewController.h"

@interface prologueViewController ()

@end

@implementation prologueViewController{
    int i;
    Sound *mySound; //音源クラスのインスタンス
}


- (void)viewDidLoad {
    mySound = [[Sound alloc]init]; //音源クラスのインスタンス初期化
    [mySound soundbutton];
    [super viewDidLoad];
    
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

- (IBAction)nextBtn:(UIButton *)sender {
    if(i == 0){
        //背景を説明画像に差し替える
        self.backImageView.image = [UIImage imageNamed:@"prologue_back_02.png"];
        i++;
    }else if(i == 1){
        //背景を説明画像に差し替える
        self.backImageView.image = [UIImage imageNamed:@"prologue_back_03.png"];
        i++;
    }else{
        [mySound soundbutton];
        [self performSegueWithIdentifier:@"prologueToSentaku" sender:self]; //選択画面に移動するセグエ
    }
    
}

@end
