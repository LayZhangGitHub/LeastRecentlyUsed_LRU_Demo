//
//  LRUDictionary.h
//  LRUDemo
//
//  Created by LayZhang on 2015/5/2.
//  Copyright © 2015年 Zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedNode.h"

@interface LRUDictionary : NSObject

// maxCountLRU: 执行LRU算法时的最大存储的元素数量
- (instancetype)initWithMaxCount:(NSUInteger)maxCount maxCost:(NSUInteger)maxCost;

//*****NSDictionary
@property (readonly) NSUInteger count;


- (void)insertNode:(LinkedNode *)node;

- (void)removeNode:(LinkedNode *)node;

//- (LinkedNode *)removeTailNode;

- (void)removeAll;

@end
