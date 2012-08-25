//
//  ViewController.m
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "ViewController.h"
#import "AAMSerialCommand.h"
#import "AAMParallelCommand.h"
#import "AAMWaitCommand.h"
#import "LogCommand.h"
#import "AAMAlphaCommand.h"
#import "AAMTransformCommand.h"
#import "AAMSelectorCommand.h"
#import "AAMAnimationCommand.h"
#import "AAMBlockCommand.h"

@interface ViewController ()

@end

@implementation ViewController{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     ------------------------------------------------------------------
     View Creation
     ------------------------------------------------------------------
     */
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:background];
    
    UIView *iconContainer = [[UIView alloc]initWithFrame:CGRectMake(0,0,320,480)];
    [self.view addSubview:iconContainer];
    
    
    
    UIImageView *base_shadow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"base_shadow"]];
    base_shadow.transform = CGAffineTransformMakeScale(0.01, 0.01);
    base_shadow.center = CGPointMake(160,240);
    [iconContainer addSubview:base_shadow];
    
    UIImageView *base_top = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"base_top"]];
    base_top.alpha = 0;
    base_top.center = CGPointMake(160,248); //38
    [iconContainer addSubview:base_top];
    
    UIImageView *papers = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"papers"]];
    papers.center = CGPointMake(160,-233);
    papers.transform = CGAffineTransformMakeRotation(359*M_2_PI);
    [iconContainer addSubview:papers];
    
    UIImageView *papers2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"papers2"]];
    papers2.center = CGPointMake(160,-221);
    //papers2 = CGAffineTransformMakeRotation(359*M_2_PI);
    [iconContainer addSubview:papers2];
    
    UIImageView *papers3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"papers3"]];
    papers3.center = CGPointMake(160,-218);
    //papers3.transform = CGAffineTransformMakeRotation(359*M_2_PI);
    [iconContainer addSubview:papers3];
    
    UIImageView *text = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"text"]];
    text.center = CGPointMake(160, 210);
    text.alpha = 0.0;
    [iconContainer addSubview:text];
    
    UIImageView *binder = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"binder"]];
    binder.transform = CGAffineTransformMakeScale(0.1, 1.0);
    binder.center = CGPointMake(160, 170);
    [iconContainer addSubview:binder];
    
    NSArray *commands = @[
        //背景フェードイン
        [AAMAlphaCommand commandWithTarget:background
                                      from:0
                                        to:1
                                  duration:0.5
                                     delay:0
                                   options:0
                             waitAnimation:YES],
        //土台フェードイン
        [AAMAlphaCommand commandWithTarget:base_shadow
                                  from:0
                                    to:1.0
                              duration:0.1
                                 delay:0
                               options:0
                         waitAnimation:NO],
        //土台拡大（フェードインと同時に)
        [AAMTransformCommand commandWithTarget:base_shadow
                                          from:CGAffineTransformMakeScale(0.8, 0.8)
                                            to:CGAffineTransformMakeScale(1.1, 1.1)
                                      duration:0.1
                                         delay:0.0
                                       options:UIViewAnimationOptionCurveEaseOut
                                 waitAnimation:YES],
    //土台がバネ的反動
    [AAMTransformCommand commandWithTarget:base_shadow
                                      from:CGAffineTransformMakeScale(1.1, 1.1)
                                        to:CGAffineTransformIdentity
                                  duration:0.2
                                     delay:0.0
                                   options:UIViewAnimationOptionCurveEaseOut
                             waitAnimation:YES],
    [AAMWaitCommand commandWithTimeInterval:0.1],
    //土台が競り上がる
    [AAMAnimationCommand commandWithDuration:0.4
                               waitUntilDone:NO
                                  animations:^(void){
                                      base_top.alpha = 1.0;
                                      base_top.center = CGPointMake(160,238);
                                  }],
    //表紙が降ってくる
    [AAMAnimationCommand commandWithDuration:0.3
                                       delay:0.4
                                     options:UIViewAnimationOptionCurveEaseIn
                               waitUntilDone:NO
                                  animations:^(void){
                                      papers2.center = CGPointMake(160,221);
                                  }],
    [AAMAnimationCommand commandWithDuration:0.3
                                       delay:0.5
                                     options:UIViewAnimationOptionCurveEaseIn
                               waitUntilDone:NO
                                  animations:^(void){
                                      papers3.center = CGPointMake(160,218);
                                  }],

    //上から紙の束が降ってくる
    [AAMSerialCommand commandWithCommands:@[
     [AAMAnimationCommand commandWithDuration:0.4
                                        delay:0.2
                                      options:UIViewAnimationOptionCurveEaseIn
                                waitUntilDone:YES
                                   animations:^(void){
                                       papers.transform = CGAffineTransformIdentity;
                                       papers.center = CGPointMake(160,233);
                                   }],
        //紙のバウンド
        [AAMAnimationCommand commandWithDuration:0.05
                                        delay:0
                                      options:UIViewAnimationOptionCurveEaseOut
                                waitUntilDone:NO
                                   animations:^(void){
                                       papers.center = CGPointMake(160,225);
                                   }],
        [AAMAnimationCommand commandWithDuration:0.05
                                        delay:0.
                                      options:UIViewAnimationOptionCurveEaseIn
                                waitUntilDone:NO
                                   animations:^(void){
                                       papers.center = CGPointMake(160,233);
                                   }]]],
    //ジャンプするよ
    [AAMAnimationCommand commandWithDuration:0.05
                                       delay:0.4
                                     options:UIViewAnimationOptionCurveEaseOut
                               waitUntilDone:YES
                                  animations:^(void){
                                      iconContainer.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                  }],
    [AAMAnimationCommand commandWithDuration:0.2
                                       delay:0.0
                                     options:UIViewAnimationOptionCurveEaseIn
                               waitUntilDone:YES
                                  animations:^(void){
                                      CGAffineTransform t = iconContainer.transform;
                                      t = CGAffineTransformTranslate(t, 0, -50);
                                      t = CGAffineTransformScale(t, 1.4, 1.4);
                                      iconContainer.transform = t;
                                  }],
    [AAMAnimationCommand commandWithDuration:0.1
                                       delay:0.0
                                     options:UIViewAnimationOptionCurveEaseIn
                               waitUntilDone:YES
                                  animations:^(void){
                                      iconContainer.transform = CGAffineTransformMakeScale(1, 1);
                                  }],
    
    //ジャンプ
    [AAMAnimationCommand commandWithDuration:0.05
                                       delay:0.2
                                     options:UIViewAnimationOptionCurveEaseOut
                               waitUntilDone:YES
                                  animations:^(void){
                                      iconContainer.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                  }],
    [AAMAnimationCommand commandWithDuration:0.2
                                       delay:0.0
                                     options:UIViewAnimationOptionCurveEaseIn
                               waitUntilDone:YES
                                  animations:^(void){
                                      CGAffineTransform t = iconContainer.transform;
                                      t = CGAffineTransformTranslate(t, 0, -50);
                                      t = CGAffineTransformScale(t, 1.4, 1.4);
                                      iconContainer.transform = t;
                                  }],
    [AAMAnimationCommand commandWithDuration:0.1
                                       delay:0.0
                                     options:UIViewAnimationOptionCurveEaseIn
                               waitUntilDone:YES
                                  animations:^(void){
                                      iconContainer.transform = CGAffineTransformMakeScale(1, 1);
                                  }],
    
    // クリップとか
    [AAMAnimationCommand commandWithDuration:0.2
                                       delay:0.0
                                     options:UIViewAnimationOptionCurveEaseOut
                               waitUntilDone:YES
                                  animations:^(void){
                                      binder.transform = CGAffineTransformMakeScale(1.2, 1.0);
                                  }],
    [AAMAnimationCommand commandWithDuration:0.05
                                       delay:0.
                                     options:UIViewAnimationOptionCurveEaseOut
                               waitUntilDone:YES
                                  animations:^(void){
                                      binder.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                  }],
    
    //ジャンプ
    [AAMAnimationCommand commandWithDuration:0.05
                                       delay:0.2
                                     options:UIViewAnimationOptionCurveEaseOut
                               waitUntilDone:YES
                                  animations:^(void){
                                      iconContainer.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                  }],
    [AAMAnimationCommand commandWithDuration:0.2
                                       delay:0.0
                                     options:UIViewAnimationOptionCurveEaseIn
                               waitUntilDone:YES
                                  animations:^(void){
                                      CGAffineTransform t = iconContainer.transform;
                                      t = CGAffineTransformTranslate(t, 0, -50);
                                      t = CGAffineTransformScale(t, 1.4, 1.4);
                                      iconContainer.transform = t;
                                  }],
    [AAMAnimationCommand commandWithDuration:0.1
                                       delay:0.0
                                     options:UIViewAnimationOptionCurveEaseIn
                               waitUntilDone:YES
                                  animations:^(void){
                                      iconContainer.transform = CGAffineTransformMakeScale(1, 1);
                                  }],
    //文字とか
    [AAMAlphaCommand commandWithTarget:text
                                  from:0
                                    to:1.0
                              duration:1.0
                                 delay:0
                               options:0
                         waitAnimation:NO],
        [LogCommand commandWithString:@"Animation Completed"]
    ];
    
    AAMSerialCommand *c = [AAMSerialCommand commandWithCommands:commands];
    //AAMParallelCommand *c = [AAMParallelCommand commandWithCommands:commands];
    c.delegate = self;
    [c execute];
    
    
}

- (void)selectorTest{
    NSLog(@"selector test");
}

- (void)commandDidComplete:(AAMCommand *)theCommand
{
    NSLog(@"Command did complete");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
