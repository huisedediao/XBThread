//
//  TestViewController.m
//  XBThread
//
//  Created by xxb on 2018/8/28.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "TestViewController.h"
#import "XBThread.h"
#import "XBTimer.h"

@interface TestViewController ()
{
    NSInteger count;
    XBThread *_thread;
    XBTimer *_timer;
}
@end

@implementation TestViewController
//BOOL isLoopRunning;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"back" forState:UIControlStateNormal];

    
    _thread = [[XBThread alloc] init];
    [_thread excuteTask:^{
        [self startTimer];
    }];

}

- (void)startTimer
{
    typeof(self) __weak weakSelf = self;
    _timer = [[XBTimer alloc] initWithTimeInterval:1 owner:self repeats:YES block:^(XBTimer *timer) {
        NSLog(@"%@",[NSThread currentThread]);
        typeof(weakSelf) __strong strongSelf = weakSelf;
        strongSelf->count++;
        if (strongSelf->count == 6)
        {
            [timer stop];
        }
    }];
    [_timer startOnMainThread:NO delay:YES];
}

- (void)dealloc
{
    NSLog(@"TestViewController销毁");
    [_timer stop];
    [_thread invalidate];
}

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
