//
//  AAMSelectorCommand.m
//  AAMCommandKitSample
//
//  Created by 深津 貴之 on 2012/08/25.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import "AAMSelectorCommand.h"

enum PerformType{
    AAMPerformTypeSelector,
    AAMPerformTypeSelectorObject,
    AAMPerformTypeSelectorObjectAfterDelay,
    AAMPerformTypeSelectorObjectObject
};

@implementation AAMSelectorCommand{
    NSObject *_target;
    SEL _selector;
    NSArray *_object0;
    NSArray *_object1;
    NSTimeInterval _delay;
    enum PerformType _type;
}

-(id)initWithTarget:(id)target selector:(SEL)selector{
    self = [super init];
    if(self){
        _target = target;
        _selector = selector;
        _type = AAMPerformTypeSelector;
    }
    return self;
}

-(id)initWithTarget:(id)target selector:(SEL)selector ojbect:(id)object{
    self = [self initWithTarget:target selector:selector];
    if(self){
        _object0 = object;
        _type = AAMPerformTypeSelectorObject;
    }
    return self;
}

-(id)initWithTarget:(id)target selector:(SEL)selector object:(id)object0 object:(id)object1{
    self = [self initWithTarget:target selector:selector];
    if(self){
        _object0 = object0;
        _object1 = object1;
        _type = AAMPerformTypeSelectorObjectObject;
    }
    return self;
}



-(id)initWithTarget:(id)target selector:(SEL)selector object:(id)object afterDelay:(NSTimeInterval)delay{
    self = [self initWithTarget:target selector:selector];
    if(self){
        _object0 = object;
        _delay = delay;
        _type = AAMPerformTypeSelectorObjectAfterDelay;
    }
    return self;
}


+(id)commandWithTarget:(id)target selector:(SEL)selector{
    return [[AAMSelectorCommand alloc]initWithTarget:target selector:selector];
}

+(id)commandWithTarget:(id)target selector:(SEL)selector object:(id)object{
    return [[AAMSelectorCommand alloc]initWithTarget:target selector:selector object:object];
}

+(id)commandWithTarget:(id)target selector:(SEL)selector object:(id)object0 object:(id)object1{
    return [[AAMSelectorCommand alloc]initWithTarget:target selector:selector object:object0 object:object1];
}

+(id)commandWithTarget:(id)target selector:(SEL)selector object:(id)object afterDelay:(NSTimeInterval)delay{
    return [[AAMSelectorCommand alloc]initWithTarget:target selector:selector object:object afterDelay:delay];
}


#pragma mark - Internal Methods

-(void)_executeCommand{
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    switch (_type) {
        case AAMPerformTypeSelector:
            [_target performSelector:_selector];
            [self _dispatchComplete];
            break;
        case AAMPerformTypeSelectorObject:
            [_target performSelector:_selector withObject:_object0];
            [self _dispatchComplete];
            break;
        case AAMPerformTypeSelectorObjectAfterDelay:
            [self _delayExecuteCommand];
            break;
        case AAMPerformTypeSelectorObjectObject:
            [_target performSelector:_selector withObject:_object0 withObject:_object1];
            [self _dispatchComplete];
            break;
        default:
            break;
    }
    #pragma clang diagnostic pop
}

-(void)_delayExecuteCommand{
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [_target performSelector:_selector withObject:_object0];
    #pragma clang diagnostic pop
    [self _dispatchComplete];
}

@end
