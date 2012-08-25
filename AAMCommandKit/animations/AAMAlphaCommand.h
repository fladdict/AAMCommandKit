//
//  FadeCommand.h
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAMCommand.h"

@interface AAMAlphaCommand : AAMCommand

-(id)initWithTarget:(UIView*)target
               from:(float)from
                 to:(float)to
           duration:(NSTimeInterval)duration
              delay:(NSTimeInterval)delay
            options:(UIViewAnimationOptions)options
      waitAnimation:(BOOL)wait;

+(AAMAlphaCommand*)commandWithTarget:(UIView*)target
               from:(float)from
                 to:(float)to
           duration:(NSTimeInterval)duration
              delay:(NSTimeInterval)delay
            options:(UIViewAnimationOptions)options
      waitAnimation:(BOOL)wait;

@end
