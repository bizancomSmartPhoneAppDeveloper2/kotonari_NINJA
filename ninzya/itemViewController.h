//
//  itemViewController.h
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/17.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemViewController : UIViewController
{
BOOL isFadeIn;
BOOL isFadeIn2;
BOOL isFadeIn3;
}

@property (weak, nonatomic) IBOutlet UIButton *sampleButton;
@property (weak, nonatomic) IBOutlet UIButton *sampleButton2;
@property (weak, nonatomic) IBOutlet UIButton *sampleButton3;

//アイテムを使うためのボタン
@property (weak, nonatomic) IBOutlet UIButton *usebtn;

//アイテムに関する説明が表示されるイメージビュー
@property (weak, nonatomic) IBOutlet UIImageView *sampleImageView;

- (IBAction)buttonFadeInOut:(id)sender;
- (IBAction)useitem:(id)sender;

@end
