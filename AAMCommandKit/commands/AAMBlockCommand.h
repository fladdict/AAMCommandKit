//
//  AAMBlockCommand.h
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMCommand.h"

typedef void (^AAMCommandExecuteBlock)(void);
typedef void (^AAMCommandExecuteBlockWithUserInfo)(NSDictionary* userinfo);

@interface AAMBlockCommand : AAMCommand

-(id)initWithBlock:(AAMCommandExecuteBlock)block;
-(id)initWithBlock:(AAMCommandExecuteBlock)block userInfo:(NSDictionary*)userInfo;
+(id)commandWithBlock:(AAMCommandExecuteBlock)block;
+(id)commandWithBlock:(AAMCommandExecuteBlock)block userInfo:(NSDictionary*)userInfo;

@end
