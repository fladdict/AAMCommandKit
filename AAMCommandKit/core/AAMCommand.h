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


/*
 *  Abstract class for all commands.
 *  Do not use it directly.
 */

@interface AAMCommand : NSObject{
    enum AAMCommandStatus status;
}


#pragma mark - properties

@property (weak, nonatomic) id<AAMCommandDelegate> delegate;
@property (readonly, nonatomic) enum AAMCommandStatus status;


#pragma mark - public methods

-(void)execute;
-(void)cancel;


#pragma mark - internal methods for override

-(void)_setupCommand;
-(void)_executeCommand;
-(void)_teardownCommand;
-(void)_dispatchComplete;
-(void)_dispatchCancel;
-(void)_dispatchError:(NSError*)theError;

@end
