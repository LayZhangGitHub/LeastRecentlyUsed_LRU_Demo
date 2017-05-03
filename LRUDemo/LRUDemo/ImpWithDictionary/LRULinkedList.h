//
//  LRULinkedList.h
//  LRUDemo
//
//  Created by LayZhang on 2015/5/2.
//  Copyright © 2015年 Zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedNode.h"

@interface LRULinkedList : NSObject

@property (nonatomic, assign) NSUInteger totalCost;
@property (nonatomic, assign) NSUInteger totalCount;

- (void)insertNodeAtHead:(LinkedNode *)node;

- (void)bringNodeToHead:(LinkedNode *)node;

- (void)removeNode:(LinkedNode *)node;

- (LinkedNode *)removeTailNode;

- (void)removeAll;

@end
