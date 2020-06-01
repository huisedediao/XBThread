//
//  XBThread.h
//  smarthome
//
//  Created by xxb on 2020/5/29.
//  Copyright © 2020 DreamCatcher. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBThread : NSObject
- (instancetype)init;
- (instancetype)initWithName:(NSString *)name;
- (void)invalidate;
- (void)excuteTask:(void(^)(void))task;
@end

NS_ASSUME_NONNULL_END
