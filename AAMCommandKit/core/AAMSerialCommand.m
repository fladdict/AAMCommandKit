//
//  AAMSerialCommand.m
//  AAMCommandKit
//
//  Created by 深津 貴之 on 2012/08/16.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMSerialCommand.h"

@implementation AAMSerialCommand

+(AAMSerialCommand*)commandWithCommands:(NSArray*)theCommands
{
    return [[AAMSerialCommand alloc]initWithCommands:theCommands];
}

-(AAMCommand*)currentCommand{
    return [commands objectAtIndex:numberOfCompletedCommands];
}


-(void)_executeCommand{
    [self _executeNextCommand];
}

-(void)_executeNextCommand{
    AAMCommand *command = [self currentCommand];
    [self _observeCommand:command];
    [command execute];
}

-(void)commandDidCompleteNotification:(NSNotification*)theNotification{
    //Stop observation
    AAMCommand *command = (AAMCommand*)theNotification.object;
    [self _unobserveCommand:command];
    
    numberOfCompletedCommands++;
    
    if(numberOfCompletedCommands==[commands count]){
        [self _dispatchComplete];
    }else{
        [self _executeNextCommand];
    }
}

-(void)commandDidCancelNotification:(NSNotification*)theNotification{
    [self cancel];
}

-(void)commandDidStopWithErrorNotification:(NSNotification*)theNotification{
    [self _dispatchError:[theNotification.userInfo objectForKey:@"error" ]];
}

@end
