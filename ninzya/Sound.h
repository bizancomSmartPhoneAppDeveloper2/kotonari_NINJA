//
//  Sound.h
//  ninzya
//
//  Created by ビザンコムマック　13 on 2014/11/22.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface Sound : NSObject

@property AVAudioPlayer *sound;
@property AVAudioPlayer *silentSound;
@property AVAudioPlayer *OpeningSound;
@property AVAudioPlayer *siroSound;
@property AVAudioPlayer *itemSound;
@property AVAudioPlayer *kaihiSound;
@property AVAudioPlayer *buttonSound;
@property AVAudioPlayer *itembuttonSound;
@property AVAudioPlayer *itemkounyuSound;
@property AVAudioPlayer *missSound;
@property AVAudioPlayer *seikouSound;


-(void)soundKatana; //刀の音
-(void)soundbutton; //ボタンの音
-(void)sounditembutton; //アイテムボタンの音
-(void)sounditemkounyu;//アイテム購入ボタンの音
-(void)soundmiss;//失敗の音


-(void)soundSilent; //無音の音声ファイル（無限リピート）
-(void)soundSilentStop; //無音の音声ファイルを止める

-(void)soundOpening; //オープニングの音声ファイル（無限リピート）
-(void)soundOpeningStop; //オープニングの音声ファイルを止める

-(void)soundsiro; //BGMファイル（無限リピート）
-(void)soundsiroStop; //BGMファイルを止める

-(void)sounditem; //BGM2ファイル（無限リピート）
-(void)sounditemStop; //BGM2ファイルを止める

-(void)soundkaihi; //回避の音声ファイル（無限リピート）
-(void)soundkaihiStop; //回避の音声ファイルを止める

-(void)soundSeikou; //回避の音声ファイル（無限リピート）
-(void)soundSeikouStop; //回避の音声ファイルを止める



@end
