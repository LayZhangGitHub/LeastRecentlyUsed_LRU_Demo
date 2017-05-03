//
//  Node.m
//  LRUDemo
//
//  Created by LayZhang on 2015/5/2.
//  Copyright © 2015年 Zhanglei. All rights reserved.
//

#import "LinkedNode.h"

@implementation LinkedNode

- (instancetype)initWithKey:(id)key value:(id)value cost:(NSUInteger)cost {
    if (self = [super init]) {
        _key = key;
        _value = value;
        _cost = cost;
    }
    return self;
}

@end
