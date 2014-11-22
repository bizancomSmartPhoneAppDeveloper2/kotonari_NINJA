//
//  failViewController.m
//  ninzya
//
//  Created by ビザンコムマック　13 on 2014/11/22.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "failViewController.h"

@interface failViewController ()

@end

@implementation failViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.returnBtn.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    [super viewWillAppear:animated];
    // アニメーション用画像を配列（imageList）にセット
    NSMutableArray *imageList = [NSMutableArray array];
    for (NSInteger i = 1; i <= 26; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"failBack%02ld.png", (long)i];
        UIImage *img = [UIImage imageNamed:imagePath];
        [imageList addObject:img];
    }
    self.backImageView.animationImages = imageList;
    self.backImageView.animationDuration = 10;// アニメーションの間隔
    self.backImageView.animationRepeatCount = 1;// ?回リピート 0なら永続
    self.backImageView.image = [UIImage imageNamed:@"failBack26.png"];
    [self.backImageView startAnimating];
    
    //11秒後
    [self performSelector:@selector(action) withObject:nil afterDelay:11];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)action{
    self.backImageView.image = [UIImage imageNamed:@"failBack27.png"];
    self.returnBtn.hidden = NO;
}
@end
