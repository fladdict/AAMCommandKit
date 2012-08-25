//
//  AAMWaitCommand.m
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMWaitCommand.h"
#import "AAMCommand.h"

@implementation AAMWaitCommand : AAMCommand

-(id)initWithTimeInterval:(NSTimeInterval)theInterval{
    self = [super init];
    if(self){
        timeInterval = theInterval;
    }
    return self;
}

+(AAMWaitCommand*)commandWithTimeInterval:(NSTimeInterval)theInterval{
    return [[AAMWaitCommand alloc]initWithTimeInterval:theInterval];
}

-(void)_executeCommand{
    [self performSelector:@selector(_dispatchComplete) withObject:nil afterDelay:timeInterval];
}


@end
