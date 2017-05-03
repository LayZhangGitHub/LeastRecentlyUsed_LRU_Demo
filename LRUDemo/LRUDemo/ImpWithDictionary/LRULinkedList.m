//
//  LRULinkedList.m
//  LRUDemo
//
//  Created by LayZhang on 2015/5/2.
//  Copyright © 2015年 Zhanglei. All rights reserved.
//

#import "LRULinkedList.h"
#import "LinkedNode.h"

@interface LRULinkedList() {
//    NSUInteger _totalCost;
//    NSUInteger _totalCount;
    LinkedNode *_head;
    LinkedNode *_tail;
}

@end

@implementation LRULinkedList

- (instancetype)init {
    if (self = [super init]) {
        _totalCost = 0;
        _totalCount = 0;
        _head = nil;
        _tail = nil;
    }
    return self;
}

- (void)insertNodeAtHead:(LinkedNode *)node {
    _totalCost += node.cost;
    _totalCount++;
    if (_head) {
        node.nextNode = _head;
        _head.preNode = node;
        _head = node;
    } else {
        _head = _tail = node;
    }
    NSLog(@"insert node at head: %@", [node key]);
    NSLog(@"total count : %lu", (unsigned long)_totalCount);
    NSLog(@"total cost : %lu", (unsigned long)_totalCost);
}

- (void)bringNodeToHead:(LinkedNode *)node {
    if (_head == node) return;
    
    if (_tail == node) {
        _tail = _tail.preNode;
        _tail.nextNode = nil;
    } else {
        node.nextNode.preNode = node.preNode;
        node.preNode.nextNode = node.nextNode;
    }
    node.nextNode = _head;
    node.preNode = nil;
    _head.preNode = node;
    _head = node;
    NSLog(@"bring node to head : %@", [node key]);
    NSLog(@"total count : %lu", (unsigned long)_totalCount);
    NSLog(@"total cost : %lu", (unsigned long)_totalCost);
}

- (void)removeNode:(LinkedNode *)node {
    _totalCost -= node.cost;
    _totalCount--;
    if (node.nextNode) node.nextNode.preNode = node.preNode;
    if (node.preNode) node.preNode.nextNode = node.nextNode;
    if (_head == node) _head = node.nextNode;
    if (_tail == node) _tail = node.preNode;
    NSLog(@"remove Node key : %@", [node key]);
    NSLog(@"total count : %lu", (unsigned long)_totalCount);
    NSLog(@"total cost : %lu", (unsigned long)_totalCost);
}

- (LinkedNode *)removeTailNode {
    if (!_tail) return nil;
    LinkedNode *tail = _tail;
    _totalCost -= _tail.cost;
    _totalCount--;
    if (_head == _tail) {
        _head = _tail = nil;
    } else {
        _tail = _tail.preNode;
        _tail.nextNode = nil;
    }
    NSLog(@"remove tail Node key : %@", [tail key]);
    NSLog(@"total count : %lu", (unsigned long)_totalCount);
    NSLog(@"total cost : %lu", (unsigned long)_totalCost);
    return tail;
}

- (void)removeAll {
    _totalCost = 0;
    _totalCount = 0;
    _head = nil;
    _tail = nil;
}

- (void)dealloc {
    [self removeAll];
}


@end
