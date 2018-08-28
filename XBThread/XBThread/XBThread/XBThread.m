//
//  XBThread.m
//  XBThread
//
//  Created by xxb on 2018/8/27.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "XBThread.h"


@implementation XBThread
BOOL isLoopRunning;
CFRunLoopRef currentRunLoopRef;

+ (instancetype)threadWithName:(NSString *)name
{
    XBThread *thread = [[XBThread alloc] initWithTarget:self selector:@selector(customThreadEntryPoint:) object:nil];
    [thread start];
    if (name.length)
    {
        [thread setName:name];
    }
    return thread;
}

- (void)stop
{
    isLoopRunning = NO;
    CFRunLoopStop(currentRunLoopRef);
}

- (void)dealloc
{
    NSLog(@"XBThread 销毁");
}

+ (void)customThreadEntryPoint:(id)__unused object
{
    @autoreleasepool {
        //记录
        currentRunLoopRef = CFRunLoopGetCurrent();
        
        NSRunLoop *myLoop = [NSRunLoop currentRunLoop];
        //        [myLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        isLoopRunning = YES; // global

        while (isLoopRunning)
        {
            [myLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
    }
}
@end
