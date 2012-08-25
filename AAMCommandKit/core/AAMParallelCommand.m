 //
//  AAMParallelCommand.m
//  AAMCommandKit
//
//  Created by 深津 貴之 on 2012/08/16.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMParallelCommand.h"

@implementation AAMParallelCommand

+(AAMParallelCommand*)commandWithCommands:(NSArray*)theCommands
{
    return [[AAMParallelCommand alloc]initWithCommands:theCommands];
}


-(void)_executeCommand{
    for(int i=0; i<[commands count]; i++){
        AAMCommand *c = [commands objectAtIndex:i];
        [self _observeCommand:c];
        [c execute];
    }
}


#pragma mark - Notification Handler

-(void)commandDidCompleteNotification:(NSNotification*)theNotification{
    //Stop observation
    AAMCommand *command = (AAMCommand*)theNotification.object;
    [self _unobserveCommand:command];
    
    numberOfCompletedCommands++;
    
    if(numberOfCompletedCommands==[commands count]){
        [self _dispatchComplete];
    }
}

-(void)commandDidCancelNotification:(NSNotification*)theNotification{
    [self cancel];
}

-(void)commandDidStopWithErrorNotification:(NSNotification*)theNotification{
    [self _dispatchError:[theNotification.userInfo objectForKey:@"error" ]];
}

@end
