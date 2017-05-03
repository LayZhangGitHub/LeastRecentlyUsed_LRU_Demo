//
//  Node.h
//  LRUDemo
//
//  Created by LayZhang on 2015/5/2.
//  Copyright © 2015年 Zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedNode : NSObject

//在dic中会持有该对象
@property (nonatomic, weak)   LinkedNode *preNode;
@property (nonatomic, weak)   LinkedNode *nextNode;

@property (nonatomic, copy)     id key;
@property (nonatomic, strong)   id value;
@property (nonatomic, assign)   NSUInteger cost;

- (instancetype)initWithKey:(id)key
                      value:(id)value
                       cost:(NSUInteger)cost;

@end
