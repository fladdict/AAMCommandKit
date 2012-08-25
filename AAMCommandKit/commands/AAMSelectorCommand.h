//
//  AAMSelectorCommand.h
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMCommand.h"

@interface AAMSelectorCommand : AAMCommand

-(id)initWithTarget:(id)target selector:(SEL)selector;
-(id)initWithTarget:(id)target selector:(SEL)selector object:(id)object;
-(id)initWithTarget:(id)target selector:(SEL)selector object:(id)object0 object:(id)object1;
-(id)initWithTarget:(id)target selector:(SEL)selector object:(id)object afterDelay:(NSTimeInterval)delay;
+(id)commandWithTarget:(id)target selector:(SEL)selector;
+(id)commandWithTarget:(id)target selector:(SEL)selector object:(id)object;
+(id)commandWithTarget:(id)target selector:(SEL)selector object:(id)object0 object:(id)object1;
+(id)commandWithTarget:(id)target selector:(SEL)selector object:(id)object afterDelay:(NSTimeInterval)delay;

@end
