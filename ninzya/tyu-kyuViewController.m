//
//  tyu-kyuViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/14.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "tyu-kyuViewController.h"
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>

@interface tyu_kyuViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property AVAudioPlayer *mySound;
@end

@implementation tyu_kyuViewController {
    BOOL isVibe;
    NSTimer *myTimer;
    int i;
    int p;
    NSTimer *tm;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 近接センサをONに
    
    // 近接センサをオン
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    // 近接センサ監視
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(proximitySensorStateDidchange:)
                                                 name:UIDeviceProximityStateDidChangeNotification
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 近接センサの値が変更
- (void)proximitySensorStateDidchange:(NSNotification *)notification {
    if (isVibe == NO)
    {
        isVibe = YES;
        [self soundstart];
        //        [tm fire];
        [self countTimer];
    }
    else
    {
        //止まるメソッド
        isVibe = NO;
        [myTimer invalidate];
        [self.mySound stop];
        [tm invalidate];
    }
}

-(void)countTimer{
    tm =
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(hogeMethod)
                                   userInfo:nil
                                    repeats:YES
     ];
}

- (void)stopSensor {
    // 近接センサオフ
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
    // 近接センサ監視解除
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceProximityStateDidChangeNotification                                                  object:nil];
}

-(void)soundstart{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"katana-slash5" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.mySound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    [self.mySound play];
    
}

-(void)hogeMethod{
    
    
    i++;
    NSLog(@"%d",i);
    
    self.countLabel.text = [NSString stringWithFormat:@"%d",i];
}
-(void)point{
    
    p = i / 300;
    NSLog(@"ポイントは%d",p);
    self.countLabel.text = [NSString stringWithFormat:@"%d",p];
}



@end