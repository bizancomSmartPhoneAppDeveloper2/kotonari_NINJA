//
//  syokyuViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/14.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "syokyuViewController.h"

@interface syokyuViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointup;
@end

@implementation syokyuViewController {
    AppDelegate *app; //変数管理
    Sound *mySound; //音源クラスのインスタンス
    NSTimer *tm; //タイマー
    int random;
}

- (void)viewDidLoad {
    app = [[UIApplication sharedApplication] delegate]; //変数管理のデリゲート
    mySound = [[Sound alloc]init]; //音源クラスのインスタンス初期化
    srand((unsigned)time(NULL));//被らない数値を渡して初期化
    random = rand() % 10;//0～9の数値をランダムに取得 → 見つかった、見つからないの判定をするため
    
    [super viewDidLoad];
    
    [mySound soundsiro];
    
    // 近接センサをONに
    if ([UIDevice currentDevice].proximityMonitoringEnabled == NO) {
        NSLog(@"センサーオン");
        
        // 近接センサをオン
        [UIDevice currentDevice].proximityMonitoringEnabled = YES;
        // 近接センサ監視
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(proximitySensorStateDidchange:)
                                                     name:UIDeviceProximityStateDidChangeNotification
                                                   object:nil];
    }
    
    //ラベルに数字を表示
    int hours = app.time/3600;
    int minutes = (app.time%3600)/60;
    int seconds = (app.time%3600)%60;
    self.countLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d",hours,minutes,seconds];
    self.pointup.text = [NSString stringWithFormat:@"%d",app.point];
    NSLog(@"時間は%dポイントは%d",app.time,app.point);
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    
    //背景画像を変更する
    NSLog(@"レベルは%d",app.level);
    if (app.level == 1) {
        self.backImageView.image = [UIImage imageNamed:@"kouryaku_back_01.png"];
    }else if (app.level == 2) {
        self.backImageView.image = [UIImage imageNamed:@"kouryaku_back_02.png"];
    }else if(app.level == 3) {
        self.backImageView.image = [UIImage imageNamed:@"kouryaku_back_03.png"];
    }
    
    //攻略度合いの画像を変更する
    if (app.cleartime/5 > app.time) {
        self.shinnyuImageView.image = [UIImage imageNamed:@"shinnyuimage01.png"];
    }else if ((app.cleartime/5)*2 > app.time) {
        self.shinnyuImageView.image = [UIImage imageNamed:@"shinnyuimage02.png"];
    }else if ((app.cleartime/5)*3 > app.time) {
        self.shinnyuImageView.image = [UIImage imageNamed:@"shinnyuimage03.png"];
    }else if ((app.cleartime/5)*4 > app.time) {
        self.shinnyuImageView.image = [UIImage imageNamed:@"shinnyuimage04.png"];
    }else{
        self.shinnyuImageView.image = [UIImage imageNamed:@"shinnyuimage05.png"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//近接センサーの状態が変わった時に呼ばれるメソッド
- (void)proximitySensorStateDidchange:(NSNotification *)notification {
    // 近接センサーの状態をチェック
    if([UIDevice currentDevice].proximityState == YES) {
        //本体に近接したときの処理
        NSLog(@"センサー反応");
        [mySound soundKatana];
        [mySound soundSilent]; //無音の音声ファイルを再生し続ける
        
        [mySound soundsiroStop];
        
        //タイマー生成
        tm = [NSTimer scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(hogeMethod)
                                            userInfo:@"YES"
                                             repeats:YES];
    }
    else {
        //本体から離れたときの処理
        NSLog(@"センサー停止");
        [mySound soundKatana];
        [mySound soundSilentStop];
        [tm invalidate];
        
        // 近接センサオフ
        [UIDevice currentDevice].proximityMonitoringEnabled = NO;
        // 近接センサ監視解除
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIDeviceProximityStateDidChangeNotification object:nil];
        
        
        //見つかった見つからない判定（viewDidLoadで発生させた乱数を元に）隠れ身の術を使用中は無条件で成功
        if (app.kakuremi == YES) {
            NSLog(@"隠れ身の術を使用して成功した");
            [self performSegueWithIdentifier:@"kaihi" sender:self]; //成功画面に移動するセグエ
        }else if(random >= app.kaihi){
            //成功（見つからなかった）
            NSLog(@"成功した");
            [self performSegueWithIdentifier:@"kaihi" sender:self]; //成功画面に移動するセグエ
        }else{
            //失敗（見つかった）
            NSLog(@"失敗した");
            app.time = 0; //経過時間を0にする
            [self performSegueWithIdentifier:@"failsegue" sender:self]; //失敗画面に移動するセグエ
        }
        //アイテム使用の変数を初期化
        app.bunshin = NO;
        app.renkin = NO;
        app.kakuremi = NO;
    }
}


//タイマーで1秒ごとに呼ばれるメソッド
-(void)hogeMethod{
    //app.timeを1秒ごとに増やす
    app.time++;
    //分身の術を使用中は倍のスピード
    if (app.bunshin == YES) {
        app.time++;
    }
    NSLog(@"秒数は%d",app.time);
    
    //60秒に1ポイント増えるようにする。ただし分身の術使用中は120秒に1ポイントにする
    if (app.bunshin == NO) {
        if(app.time%60 == 0){
            app.point++;
            //錬金の術使用時は更に増える
            if (app.renkin == YES){
                app.point++;
            }
        }
    }else{
        if(app.time%120 == 0){
            app.point++;
            //錬金の術使用時は更に増える
            if (app.renkin == YES){
                app.point++;
            }
        }
    }
    NSLog(@"ポイントは%d",app.point);
}

//アイテム画面に移動するボタン
- (IBAction)itemBtn:(UIButton *)sender {
    // 近接センサオフ
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
    // 近接センサ監視解除
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceProximityStateDidChangeNotification object:nil];
    [mySound soundsiroStop];
    [mySound soundbutton];
    
}

//戻ってくるボタンのためにSegueを設定
- (IBAction)returnSyokyu:(UIStoryboardSegue *)segue {
    NSLog(@"攻略画面に戻る");
    [self viewDidLoad];
}
@end


