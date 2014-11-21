//
//  itemViewController.h
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/17.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *item1btn;
@property (weak, nonatomic) IBOutlet UIButton *item2btn;
@property (weak, nonatomic) IBOutlet UIButton *item3btn;

//item使うボタン
@property (weak, nonatomic) IBOutlet UIButton *itemUsebtn;

//アイテムの画像表示ビュー
@property (weak, nonatomic) IBOutlet UIImageView *itemImageVIew;

@end
