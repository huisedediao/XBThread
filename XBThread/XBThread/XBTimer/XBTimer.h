//
//  XBTimer.h
//  XBTimer
//
//  Created by xxb on 2018/8/24.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XBTimer;

typedef void (^XBTimerBlock)(XBTimer *timer);

@interface XBTimer : NSObject

+ (void)timerStartWithTimeInterval:(NSTimeInterval)ti owner:(id)owner repeats:(BOOL)yesOrNo onMainThread:(BOOL)onMainThread delay:(BOOL)delay block:(XBTimerBlock)block;

/**
 ti : 执行间隔
 owner : timer的拥有者
 repeats : 是否重复执行
 block : 回调
 */
- (instancetype)initWithTimeInterval:(NSTimeInterval)ti owner:(id)owner repeats:(BOOL)yesOrNo block:(XBTimerBlock)block;

/** 定时器开始工作
 onMainThread : 是否运行在主线程
 delay : YES,则ti秒后才执行第一次回调；NO，立即执行第一次回调
 */
- (void)startOnMainThread:(BOOL)onMainThread delay:(BOOL)delay;

/** 立即停止定时器 */
- (void)stop;

@end
