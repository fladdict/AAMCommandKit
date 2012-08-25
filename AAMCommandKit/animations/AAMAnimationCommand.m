//
//  AAMAnimationCommand.m
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMAnimationCommand.h"

@implementation AAMAnimationCommand{
    NSTimeInterval _duration;
    NSTimeInterval _delay;
    UIViewAnimationOptions _options;
    AAMCommandExecuteBlock _animationBlock;
    BOOL _waitUntilDone;
}

-(id)initWithDuration:(NSTimeInterval)duration
        waitUntilDone:(BOOL)wait
           animations:(AAMCommandExecuteBlock)block
{
    return [self initWithDuration:duration delay:0 options:0 waitUntilDone:wait animations:block];
}


-(id)initWithDuration:(NSTimeInterval)duration
                delay:(NSTimeInterval)delay
              options:(UIViewAnimationOptions)options
        waitUntilDone:(BOOL)wait
           animations:(AAMCommandExecuteBlock)block
{
    self = [super init];
    if(self){
        _duration = duration;
        _delay = delay;
        _options = options;
        _waitUntilDone = wait;
        _animationBlock = block;
    }
    return self;
}


+(id)commandWithDuration:(NSTimeInterval)duration
           waitUntilDone:(BOOL)wait
              animations:(AAMCommandExecuteBlock)block
{
    return [[AAMAnimationCommand alloc]initWithDuration:duration waitUntilDone:wait animations:block];
}


+(id)commandWithDuration:(NSTimeInterval)duration
                   delay:(NSTimeInterval)delay
                 options:(UIViewAnimationOptions)options
           waitUntilDone:(BOOL)wait
              animations:(AAMCommandExecuteBlock)block
{
    return [[AAMAnimationCommand alloc]initWithDuration:duration delay:delay options:options waitUntilDone:wait animations:block];
}


-(void)_executeCommand
{
    __weak __block id s = self;
    [UIView animateWithDuration:_duration
                          delay:_delay
                        options:_options
                     animations:_animationBlock
                     completion:^(BOOL finished){
                         if(_waitUntilDone){
                             [s _dispatchComplete];
                         }
                     }];
    
    if(!_waitUntilDone){
        [s _dispatchComplete];
    }
}

@end
