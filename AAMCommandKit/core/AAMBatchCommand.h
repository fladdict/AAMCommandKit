//
//  AAMBatchCommand.h
//  AAMCommandKit
//
//  Created by 深津 貴之 on 2012/08/16.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMCommand.h"

@interface AAMBatchCommand : AAMCommand{
    NSArray *commands;
    int commandIndex;
    int numberOfCompletedCommands;
}

-(id)initWithCommands:(NSArray*)theCommands;


#pragma mark - internal methods for override

-(void)_observeCommand:(AAMCommand*)theCommand;
-(void)_unobserveCommand:(AAMCommand*)theCommand;

@end
