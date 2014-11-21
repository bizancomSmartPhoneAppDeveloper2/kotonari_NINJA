//
//  sentakuviewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/20.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "sentakuviewController.h"

@interface sentakuviewController ()

@end

@implementation sentakuviewController{
    AppDelegate *app; //変数管理
}

- (void)viewDidLoad {
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
    app.cleartime = 10;
}

- (IBAction)tyukyu:(id)sender {
    app.cleartime = 1000;
}

- (IBAction)zyokyu:(id)sender {
    app.cleartime = 10000;
}
@end
