//
//  XBThread.h
//  XBThread
//
//  Created by xxb on 2018/8/27.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBThread : NSThread
@property (nonatomic,assign,readonly) BOOL isLoopRunning;
+ (instancetype)threadWithName:(NSString *)name;
- (void)stop;
@end
