//
//  kaihiViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/20.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "kaihiViewController.h"

@interface kaihiViewController ()

@end

@implementation kaihiViewController{
AppDelegate *app; //変数管理
}
- (void)viewDidLoad {
    [super viewDidLoad];
    app = [[UIApplication sharedApplication] delegate]; //変数管理のデリゲート
    //判定待ちのアニメーション表示
    //回避成功のアニメーション表示
}

- (void)viewDidAppear:(BOOL)animated
{
    //経過時間（app.time）がクリア時間（cleartime）をこえていた場合はsucsesssegueを実行
    if (app.time >= app.cleartime) {
        [self performSegueWithIdentifier:@"sucsesssegue" sender:self];
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

@end
