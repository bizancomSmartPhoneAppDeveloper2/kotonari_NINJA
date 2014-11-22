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
        
        
            //見つかった見つからない判定（viewDidLoadで発生させた乱数を元に）
                if(random >= app.kaihi){
                    //成功（見つからなかった）
                    NSLog(@"成功した");
                    [self performSegueWithIdentifier:@"kaihi" sender:self]; //成功画面に移動するセグエ
                }else{
                    //失敗（見つかった）
                    NSLog(@"失敗した");
                    app.time = 0; //経過時間を0にする
                    app.point = app.point/2; //ポイントを半分にする
                    [self performSegueWithIdentifier:@"failsegue" sender:self]; //失敗画面に移動するセグエ
                }
    }
}


//タイマーで1秒ごとに呼ばれるメソッド
-(void)hogeMethod{
    //app.timeを1秒ごとに増やす
    app.time++;
    NSLog(@"秒数は%d",app.time);
    
    //初級では2秒に1ポイント増えるようにする。中級上級は後ほど考える。
    if(app.time%2 == 0){
        app.point++;
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
}

//戻ってくるボタンのためにSegueを設定
- (IBAction)returnSyokyu:(UIStoryboardSegue *)segue {
    NSLog(@"攻略画面に戻る");
    [self viewDidLoad];
}
@end


