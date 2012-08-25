//
//  AAMBlockCommand.m
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMBlockCommand.h"

@implementation AAMBlockCommand{
    AAMCommandExecuteBlock _block;
    AAMCommandExecuteBlockWithUserInfo _blockWithUserInfo;
    NSDictionary *_userInfo;
}

-(id)initWithBlock:(AAMCommandExecuteBlock)block
{
    self = [super init];
    if(self){
        _block = block;
    }
    return self;
}

-(id)initWithBlock:(AAMCommandExecuteBlock)block userInfo:(NSDictionary*)userInfo
{
    self = [super init];
    if(self){
        _block = block;
        _userInfo = userInfo;
    }
    return self;
}

+(id)commandWithBlock:(AAMCommandExecuteBlock)block
{
    return [[AAMBlockCommand alloc]initWithBlock:block];
}



+(id)commandWithBlock:(AAMCommandExecuteBlock)block userInfo:(NSDictionary*)userInfo
{
    return [[AAMBlockCommand alloc]initWithBlock:block userInfo:userInfo];
}

#pragma mark Internal Method

-(void)_executeCommand
{
    if(_block){
        _block();
    }else if(_blockWithUserInfo){
        _blockWithUserInfo(_userInfo);
    }
    
    [self _dispatchCancel];
}

-(void)_teardownCommand{
    [super _teardownCommand];
    _block = nil;
}

@end
