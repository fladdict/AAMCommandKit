//
//  AAMFadeOutCommand.h
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAMCommand.h"

@interface AAMTransformCommand : AAMCommand

-(id)initWithTarget:(UIView*)target
               from:(CGAffineTransform)from
                 to:(CGAffineTransform)to
           duration:(NSTimeInterval)duration
              delay:(NSTimeInterval)delay
            options:(UIViewAnimationOptions)options
      waitUntilDone:(BOOL)wait;

+(AAMTransformCommand*)commandWithTarget:(UIView*)target
                                 from:(CGAffineTransform)from
                                   to:(CGAffineTransform)to
                             duration:(NSTimeInterval)duration
                                delay:(NSTimeInterval)delay
                              options:(UIViewAnimationOptions)options
                        waitUntilDone:(BOOL)wait;

@end
