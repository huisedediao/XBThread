//
//  XBThread.m
//  smarthome
//
//  Created by xxb on 2020/5/29.
//  Copyright © 2020 DreamCatcher. All rights reserved.
//

#import "XBThread.h"

@interface XBThread ()
{
    NSThread *_thread;
}
@end

@implementation XBThread

- (instancetype)init
{
    if (self = [super init])
    {
        _thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadRun:) object:nil];
        [_thread start];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init])
    {
        _thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadRun:) object:nil];
        if (name.length)
        {
            [_thread setName:name];
        }
        [_thread start];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"XBThread 销毁");
}

- (void)threadRun:(NSThread *)thread
{
    [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
    while (_thread)
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    NSLog(@"XBThread ：invalidate");
}

- (void)invalidate
{
    if (_thread == nil) {
        return;
    }
    [self performSelector:@selector(invalidateInside) onThread:_thread withObject:nil waitUntilDone:true];
}

- (void)invalidateInside
{
    if (_thread == nil)
    {
        return;
    }
    CFRunLoopStop(CFRunLoopGetCurrent());
    _thread = nil;
}

- (void)excuteTask:(void (^)(void))task
{
    if (_thread == nil)
    {
        NSLog(@"XBThread ： 线程已被弃用");
        return;
    }
    if (task == nil)
    {
        return;
    }
    [self performSelector:@selector(excuteTaskInSide:) onThread:_thread withObject:task waitUntilDone:true];
}

- (void)excuteTaskInSide:(void (^)(void))task
{
    task();
}

@end
