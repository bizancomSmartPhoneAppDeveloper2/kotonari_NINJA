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
    Sound *mySound; //音源クラスのインスタンス
}
- (void)viewDidLoad {
    app = [[UIApplication sharedApplication] delegate]; //変数管理のデリゲート
    mySound = [[Sound alloc]init]; //音源クラスのインスタンス初期化

    [super viewDidLoad];
    [mySound soundkaihi];
    self.returnBtn.hidden = YES;
    
    //ポイントをUserDefaultsで保存
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *num = [NSNumber numberWithInt:app.point];
    [defaults setObject:num forKey:@"ポイント"];
    [mySound soundkaihi];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    [super viewWillAppear:animated];
    // アニメーション用画像を配列（imageList）にセット
    NSMutableArray *imageList = [NSMutableArray array];
    for (NSInteger i = 1; i <= 26; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"kaihiBack%02ld.png", (long)i];
        UIImage *img = [UIImage imageNamed:imagePath];
        [imageList addObject:img];
    }
    self.backImageView.animationImages = imageList;
    self.backImageView.animationDuration = 10;// アニメーションの間隔
    self.backImageView.animationRepeatCount = 1;// ?回リピート 0なら永続
    self.backImageView.image = [UIImage imageNamed:@"kaihiBack26.png"];
    [self.backImageView startAnimating];
    
    //11秒後
    [self performSelector:@selector(action) withObject:nil afterDelay:11];
}

- (void)viewDidAppear:(BOOL)animated{
    //    //経過時間（app.time）がクリア時間（cleartime）をこえていた場合はsucsesssegueを実行
    //    if (app.time >= app.cleartime) {
    //        //攻略へボタン隠したほうが良さげ
    //        [self performSegueWithIdentifier:@"sucsesssegue" sender:self];
    //    }
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

-(void)action{
    self.backImageView.image = [UIImage imageNamed:@"kaihiBack27.png"];
    self.returnBtn.hidden = NO;
}

- (IBAction)btnKouryaku:(UIButton *)sender {
    //経過時間（app.time）がクリア時間（cleartime）をこえていた場合はsucsesssegueを実行
    if (app.time >= app.cleartime) {
        //攻略へボタン隠したほうが良さげ
        [mySound soundkaihiStop];
        [self performSegueWithIdentifier:@"sucsesssegue" sender:self];
    }else{
        [mySound soundkaihiStop];
        [self performSegueWithIdentifier:@"kaihiToSyokyu" sender:self];
    }
    
}
@end
