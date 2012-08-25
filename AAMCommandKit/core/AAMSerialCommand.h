//
//  AAMSerialCommand.h
//  AAMCommandKit
//
//  Created by 深津 貴之 on 2012/08/16.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMBatchCommand.h"

@interface AAMSerialCommand : AAMBatchCommand

+(AAMSerialCommand*)commandWithCommands:(NSArray*)theCommands;
-(AAMCommand*)currentCommand;


@end
