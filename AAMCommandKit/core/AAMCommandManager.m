//
//  AAMCommandManager.m
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMCommandManager.h"

@implementation AAMCommandManager{
    NSMutableSet *commands;
}

-(id)init{
    self = [super init];
    if(self){
        commands = [[NSMutableSet alloc]initWithCapacity:10];
    }
    return self;
}

static AAMCommandManager *_instance;
+(id)sharedManager{
    if(!_instance){
        _instance = [[AAMCommandManager alloc]init];
    }
    return _instance;
}

-(void)registerCommand:(AAMCommand*)theCommand
{
    [commands addObject:theCommand];
}

-(void)unregisterCommand:(AAMCommand*)theCommand
{
    [commands removeObject:theCommand];
}

@end
