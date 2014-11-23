//
//  itemViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/17.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "itemViewController.h"
#import "AppDelegate.h"

@interface itemViewController ()
@end

@implementation itemViewController{
    AppDelegate *app; //変数管理
    int itemselect;
}


- (void)viewDidLoad
    {
        app = [[UIApplication sharedApplication] delegate]; //変数管理のデリゲート
        
        [super viewDidLoad];
        //アイテムを使うボタンは隠しておく
        self.itemUsebtn.hidden = YES;
        
        //使用中のアイテムのボタンは半透明にして使用不能にする
        if (app.bunshin == YES) {
            self.item1btn.enabled = NO;
            self.item1btn.alpha = 0.5;
        }
        if (app.renkin == YES) {
            self.item2btn.enabled = NO;
            self.item2btn.alpha = 0.5;
        }
        if (app.kakuremi == YES) {
            self.item3btn.enabled = NO;
            self.item3btn.alpha = 0.5;
        }

    }
    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//item1のボタン
- (IBAction)item1btn:(UIButton *)sender {
    itemselect = 1;
    //アイテム使用ボタンを表示し、イメージビューにアイテム１の画像を表示
    self.itemUsebtn.hidden = NO;
    self.itemImageVIew.image = [UIImage imageNamed:@"itemImage02.png"];
}

//item2のボタン
- (IBAction)item2btn:(UIButton *)sender {
    itemselect = 2;
    self.itemUsebtn.hidden = NO;
    self.itemImageVIew.hidden =NO;
    self.itemImageVIew.image = [UIImage imageNamed:@"itemImage03.png"];
}

//item3のボタン
- (IBAction)item3btn:(UIButton *)sender {
    itemselect = 3;
    self.itemUsebtn.hidden = NO;
    self.itemImageVIew.hidden =NO;
    self.itemImageVIew.image = [UIImage imageNamed:@"itemImage04.png"];
}

//item使用ボタン
- (IBAction)itemUsebtn:(UIButton *)sender {
    if(itemselect == 1){
        NSLog(@"アイテム1を使った");
        if(app.point >= 10){
            //ポイントが減ってアイテムの効果がプラスされる
            app.point = app.point - 100;
            app.bunshin = YES;
            
            //アイテムを使用したことを告げるアラートが表示される
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"分身の術！"
                                  message:@"\n時間の進行が速くなった！"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];
        }else{
            //アラートを出す
            [self alert];
        }
    }else if(itemselect == 2){
        NSLog(@"アイテム2を使った");
        if(app.point >= 10){
            //ポイントが減ってアイテムの効果がプラスされる
            app.point = app.point - 50;
            app.renkin = YES;
            
            //アイテムを使用したことを告げるアラートが表示される
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"錬金の術！"
                                  message:@"\n時間あたりの獲得ポイントが増えた！"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];
        }else{
            //アラートを出す
            [self alert];
        }
    }else if(itemselect == 3){
        NSLog(@"アイテム3を使った");
        if(app.point >= 10){
            //ポイントが減ってアイテムの効果がプラスされる
            app.point = app.point - 300;
            app.kakuremi = YES;
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"隠れ身の術！"
                                  message:@"\n敵に発見される危険性がなくなった！"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];
        }else{
            //アラートを出す
            [self alert];
        }
    }
    
    //ポイントをUserDefaultsで保存
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *num = [NSNumber numberWithInt:app.point];
    [defaults setObject:num forKey:@"ポイント"];
}


//ポイントが足りない時のアラートのメソッド
-(void)alert{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"ポイントが足りません"
                          message:@"\nアイテムを使用するためのポイントが足りません"
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}
@end
