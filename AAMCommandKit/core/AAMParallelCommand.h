//
//  AAMParallelCommand.h
//  AAMCommandKit
//
//  Created by 深津 貴之 on 2012/08/16.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMBatchCommand.h"

@interface AAMParallelCommand : AAMBatchCommand

+(AAMParallelCommand*)commandWithCommands:(NSArray*)theCommands;

@end
