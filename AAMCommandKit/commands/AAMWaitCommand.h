//
//  AAMWaitCommand.h
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMCommand.h"

@interface AAMWaitCommand : AAMCommand{
    NSTimeInterval timeInterval;
}

-(id)initWithTimeInterval:(NSTimeInterval)theInterval;
+(AAMWaitCommand*)commandWithTimeInterval:(NSTimeInterval)theInterval;

@end
