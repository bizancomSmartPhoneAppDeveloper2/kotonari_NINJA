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
-(void)soundbutton{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"highspeed-movement1"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.buttonSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    [self.buttonSound play];
    //[mySound soundbutton];
}
-(void)sounditembutton{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"setup1"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.itembuttonSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    [self.itembuttonSound play];
    //[mySound sounditembutton];
}
-(void)sounditemkounyu{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"wahuonngenn"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.itemkounyuSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    [self.itemkounyuSound play];
    //[mySound sounditemkounyu];
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

-(void)soundOpening{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"opening"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.OpeningSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    self.OpeningSound.numberOfLoops = -1; //ループする回数の指定。（-1： 無限、0：１回、1：２回）
    [self.OpeningSound play];
}

-(void)soundOpeningStop{
    [self.OpeningSound stop];
}

-(void)soundsiro{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"sironogamen"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.siroSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    self.siroSound.numberOfLoops = -1; //ループする回数の指定。（-1： 無限、0：１回、1：２回）
    [self.siroSound play];
}

-(void)soundsiroStop{
    [self.siroSound stop];
}

-(void)sounditem{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"itemkounyuu"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.itemSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    self.itemSound.numberOfLoops = -1; //ループする回数の指定。（-1： 無限、0：１回、1：２回）
    [self.itemSound play];
    //[mySound sounditem];
}

-(void)sounditemStop{
    [self.itemSound stop];
}

-(void)soundkaihi{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"sinonndesou"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.kaihiSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    self.kaihiSound.numberOfLoops = 0; //ループする回数の指定。（-1： 無限、0：１回、1：２回）
    [self.kaihiSound play];
    //[mySound soundkaihi];
}

-(void)soundkaihiStop{
    [self.kaihiSound stop];
}

-(void)soundmiss{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"mitukatta"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.missSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    self.missSound.numberOfLoops = 0; //ループする回数の指定。（-1： 無限、0：１回、1：２回）
    [self.missSound play];
}

-(void)soundSeikou{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"harugakita"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.seikouSound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    self.seikouSound.numberOfLoops = 0; //ループする回数の指定。（-1： 無限、0：１回、1：２回）
    [self.seikouSound play];
}

-(void)soundSeikouStop{
    [self.seikouSound stop];
}
@end
