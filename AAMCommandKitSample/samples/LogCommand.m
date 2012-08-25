//
//  LogCommand.m
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "LogCommand.h"

@implementation LogCommand{
    NSString *_string;
}

-(id)initWithString:(NSString*)string{
    self = [super init];
    if(self){
        _string = string;
    }
    return self;
}

+(LogCommand*)commandWithString:(NSString *)string
{
    return [[LogCommand alloc]initWithString:string];
}

-(void)_executeCommand{
    NSLog(@"%@",_string);
    [self _dispatchComplete];
}

@end
