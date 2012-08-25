//
//  AAMCommandManager.h
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAMCommand.h"

@class AAMCommand;

@interface AAMCommandManager : NSObject

+(id)sharedManager;
-(void)registerCommand:(AAMCommand*)theCommand;
-(void)unregisterCommand:(AAMCommand*)theCommand;

@end
