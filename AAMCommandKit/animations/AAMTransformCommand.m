//
//  AAMFadeOutCommand.m
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMTransformCommand.h"

@implementation AAMTransformCommand{
    UIView *_target;
    CGAffineTransform _from;
    CGAffineTransform _to;
    NSTimeInterval _duration;
    NSTimeInterval _delay;
    UIViewAnimationOptions _options;
    BOOL _waitAnimation;
}

-(id)initWithTarget:(UIView*)target
               from:(CGAffineTransform)from
                 to:(CGAffineTransform)to
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

+(AAMTransformCommand*)commandWithTarget:(UIView*)target
                                    from:(CGAffineTransform)from
                                      to:(CGAffineTransform)to
                                duration:(NSTimeInterval)duration
                                   delay:(NSTimeInterval)delay
                                 options:(UIViewAnimationOptions)options
                           waitAnimation:(BOOL)wait
{
    return [[AAMTransformCommand alloc]initWithTarget:target from:from to:to duration:duration delay:delay options:options waitAnimation:wait];
}

-(void)_executeCommand{
    __weak id s = self;
    
    _target.transform = _from;
    [UIView animateWithDuration:_duration
                          delay:_delay
                        options:_options
                     animations:^(void){
                         _target.transform = _to;
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
