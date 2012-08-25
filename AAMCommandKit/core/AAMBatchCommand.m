//
//  AAMBatchCommand.m
//  AAMCommandKit
//
//  Created by 深津 貴之 on 2012/08/16.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMBatchCommand.h"

@implementation AAMBatchCommand

-(id)initWithCommands:(NSArray*)theCommands
{
    self = [super init];
    if(self){
        commands = theCommands;
        numberOfCompletedCommands = 0;
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}






#pragma mark - Internal Methods


-(void)_teardownCommand{
    [super _teardownCommand];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)_observeCommand:(AAMCommand*)theCommand{
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(commandDidCompleteNotification:)
                                                name:AAMCommandDidCompleteNotification object:theCommand];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(commandDidCancelNotification:)
                                                name:AAMCommandDidCancelNotification object:theCommand];

    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(commandDidStopWithErrorNotification:)
                                                name:AAMCommandDidStopWithErrorNotification object:theCommand];

}

-(void)_unobserveCommand:(AAMCommand*)theCommand{
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:AAMCommandDidCompleteNotification
                                                 object:theCommand];
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:AAMCommandDidCancelNotification
                                                 object:theCommand];
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:AAMCommandDidStopWithErrorNotification
                                                 object:theCommand];
}



#pragma mark - Notification Handlers

-(void)commandDidCompleteNotification:(NSNotification*)theNotification{
    //Override here
}

-(void)commandDidCancelNotification:(NSNotification*)theNotification{
    [self cancel];
}

-(void)commandDidStopWithErrorNotification:(NSNotification*)theNotification{
    [self _dispatchError:[theNotification.userInfo objectForKey:@"error" ]];
}

@end
