//
//  LogCommand.h
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMCommand.h"

@interface LogCommand : AAMCommand

-(id)initWithString:(NSString*)string;
+(LogCommand*)commandWithString:(NSString*)string;
@end
