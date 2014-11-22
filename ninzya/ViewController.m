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
    Sound *mySound; //音源クラスのインスタンス
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    mySound = [[Sound alloc]init]; //音源クラスのインスタンス初期化
    self.myButton.hidden = YES;

    //1.5秒後にメソッドを実行
    [self performSelector:@selector(backChange) withObject:nil afterDelay:1.5];
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

