//
//  FadeCommand.m
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMAlphaCommand.h"

@implementation AAMAlphaCommand{
    UIView *_target;
    float _from;
    float _to;
    NSTimeInterval _duration;
    NSTimeInterval _delay;
    UIViewAnimationOptions _options;
    BOOL _waitAnimation;
}

-(id)initWithTarget:(UIView*)target
               from:(float)from
                 to:(float)to
           duration:(NSTimeInterval)duration
              delay:(NSTimeInterval)delay
            options:(UIViewAnimationOptions)options
      waitAnimation:(BOOL)wait
{
    self = [super init];
    if(self){
        _target = target;
        _from = from;
        _to = to;
        _duration = duration;
        _delay = delay;
        _options = options;
        _waitAnimation = wait;
    }
    return self;
}

+(AAMAlphaCommand*)commandWithTarget:(UIView*)target
                                 from:(float)from
                                   to:(float)to
                             duration:(NSTimeInterval)duration
                                delay:(NSTimeInterval)delay
                              options:(UIViewAnimationOptions)options
                        waitAnimation:(BOOL)wait
{
    return [[AAMAlphaCommand alloc]initWithTarget:target from:from to:to duration:duration delay:delay options:options waitAnimation:wait];
}

-(void)_executeCommand{
    __weak id s = self;
    _target.alpha = _from;
    [UIView animateWithDuration:_duration
                          delay:_delay
                        options:_options
                     animations:^(void){
                         _target.alpha = _to;
                     }
                     completion:^(BOOL finished){
                         if(_waitAnimation){
                             [s _dispatchComplete];
                         }
                     }];
    
    if(!_waitAnimation){
        [self _dispatchComplete];
    }
}

@end
