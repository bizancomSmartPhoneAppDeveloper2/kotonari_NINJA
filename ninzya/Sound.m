//
//  Sound.m
//  ninzya
//
//  Created by ビザンコムマック　13 on 2014/11/22.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "Sound.h"

@implementation Sound

-(void)soundKatana{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"katana-slash5"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.sound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    [self.sound play];
}

-(void)soundSilent{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"silent"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.silentSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    self.silentSound.numberOfLoops = -1; //ループする回数の指定。（-1： 無限、0：１回、1：２回）
    [self.silentSound play];
}

-(void)soundSilentStop{
    [self.silentSound stop];
}
@end
