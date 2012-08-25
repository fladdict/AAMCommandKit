//
//  AAMAnimationCommand.h
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAMCommand.h"
#import "AAMBlockCommand.h"

@interface AAMAnimationCommand : AAMCommand

-(id)initWithDuration:(NSTimeInterval)duration
        waitUntilDone:(BOOL)wait
           animations:(AAMCommandExecuteBlock)block;

-(id)initWithDuration:(NSTimeInterval)duration
                delay:(NSTimeInterval)delay
              options:(UIViewAnimationOptions)options
        waitUntilDone:(BOOL)wait
           animations:(AAMCommandExecuteBlock)block;

+(id)commandWithDuration:(NSTimeInterval)duration
           waitUntilDone:(BOOL)wait
              animations:(AAMCommandExecuteBlock)block;

+(id)commandWithDuration:(NSTimeInterval)duration
                   delay:(NSTimeInterval)delay
                 options:(UIViewAnimationOptions)options
           waitUntilDone:(BOOL)wait
              animations:(AAMCommandExecuteBlock)block;

@end
