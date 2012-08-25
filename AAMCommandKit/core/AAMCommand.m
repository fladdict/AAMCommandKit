//
//  AAMCommand.m
//  AAMCommandKit
//
//  Created by 深津 貴之 on 2012/08/16.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMCommand.h"

@implementation AAMCommand

@synthesize delegate;

-(id)init{
    self = [super init];
    if(self){
        status = AAMCommandStatusReady;
    }
    return self;
}

-(void)execute
{
    if(status!=AAMCommandStatusReady){
        return;
    }
    // invoke thie method after execution is complete.
    [self _setupCommand];
    [self _executeCommand];
}

-(void)cancel
{
    if(status!=AAMCommandStatusExecuting){
        return;
    }
    // invoke this method after cancel is complete
    [self _dispatchCancel];
}



#pragma mark - Internal Methods

-(void)_setupCommand{
    status = AAMCommandStatusExecuting;
    [[AAMCommandManager sharedManager]registerCommand:self];
}

-(void)_executeCommand
{
    //Write your own execution and call
    //[self _dispatchComplete] after execution.
}

-(void)_tearDownCommand{
    [[AAMCommandManager sharedManager]unregisterCommand:self];
}


-(void)_dispatchComplete
{
    status = AAMCommandStatusCompleted;
    if([self.delegate respondsToSelector:@selector(commandDidComplete:)]){
        [self.delegate commandDidComplete:self];
    }
    NSNotification *n = [NSNotification notificationWithName:AAMCommandDidCompleteNotification
                                                      object:self];
    [[NSNotificationCenter defaultCenter]postNotification:n];
    [self _tearDownCommand];
}

-(void)_dispatchCancel
{
    status = AAMCommandStatusCancelled;
    if([self.delegate respondsToSelector:@selector(commandDidCancel:)]){
        [self.delegate commandDidCancel:self];
    }
    NSNotification *n = [NSNotification notificationWithName:AAMCommandDidCompleteNotification
                                                      object:self];
    [[NSNotificationCenter defaultCenter]postNotification:n];
    [self _tearDownCommand];
}


-(void)_dispatchError:(NSError*)theError
{
    status = AAMCommandStatusErrored;
    if([self.delegate respondsToSelector:@selector(command:didStopWithError:)]){
        [self.delegate command:self didStopWithError:theError];
    }

    NSNotification *n = [NSNotification notificationWithName:AAMCommandDidStopWithErrorNotification
                                                      object:self
                                                    userInfo:@{@"error":theError}];
    [[NSNotificationCenter defaultCenter]postNotification:n];
    [self _tearDownCommand];
}
@end
