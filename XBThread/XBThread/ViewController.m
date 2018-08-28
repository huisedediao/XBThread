//
//  ViewController.m
//  XBThread
//
//  Created by xxb on 2018/8/27.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    TestViewController *testVC = [TestViewController new];
    [self presentViewController:testVC animated:YES completion:nil];
}

@end
