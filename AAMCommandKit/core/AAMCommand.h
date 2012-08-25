//
//  AAMCommand.h
//  AAMCommandKit
//
//  Created by 深津 貴之 on 2012/08/16.
//  Copyright (c) 2012年 artandmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAMCommandManager.h"

@class AAMCommand;

#define AAMCommandDidCompleteNotification @"AAMCommandDidCompleteNotification"
#define AAMCommandDidCancelNotification @"AAMCommandDidCancelNotification"
#define AAMCommandDidStopWithErrorNotification @"AAMCommandDidStopWithErrorNotification"

enum AAMCommandStatus{
    AAMCommandStatusReady,
    AAMCommandStatusExecuting,
    AAMCommandStatusCancelled,
    AAMCommandStatusErrored,
    AAMCommandStatusCompleted
};

@protocol AAMCommandDelegate <NSObject>
@optional
-(void)commandDidComplete:(AAMCommand*)theCommand;
-(void)commandDidCancel:(AAMCommand*)theCommand;
-(void)command:(AAMCommand*)theCommand didStopWithError:(NSError*)theError;
@end



@interface AAMCommand : NSObject{
    enum AAMCommandStatus status;
}

@property (weak, nonatomic) id<AAMCommandDelegate> delegate;
@property (readonly, nonatomic) enum AAMCommandStatus status;

//Public Methods
-(void)execute;
-(void)cancel;

//Internal Methods that override with subclasses

-(void)_setupCommand;
-(void)_executeCommand;
-(void)_teardownCommand;

-(void)_dispatchComplete;
-(void)_dispatchCancel;
-(void)_dispatchError:(NSError*)theError;

@end
