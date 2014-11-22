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


-(void)soundKatana; //刀の音
-(void)soundSilent; //無音の音声ファイル（無限リピート）

-(void)soundSilentStop; //音声ファイルを止める


@end
