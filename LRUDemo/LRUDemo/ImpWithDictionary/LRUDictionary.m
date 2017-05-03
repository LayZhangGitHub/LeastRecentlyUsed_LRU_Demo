//
//  LRUDictionary.m
//  LRUDemo
//
//  Created by LayZhang on 2015/5/2.
//  Copyright © 2015年 Zhanglei. All rights reserved.
//

#import "LRUDictionary.h"
#import "LRULinkedList.h"
#import <pthread.h>

@interface LRUDictionary() {
    pthread_mutex_t _lock;
}

@property (nonatomic, strong)   NSMutableDictionary *dic;
@property (nonatomic, strong)   LRULinkedList *lruList;
@property (nonatomic, assign)   NSUInteger maxCount;
@property (nonatomic, assign)   NSUInteger maxCost;



//@property (nonatomic, assign)   NSUInteger totalCount;
//@property (nonatomic, assign)   NSUInteger totalCost;

@end

@implementation LRUDictionary

- (instancetype)initWithMaxCount:(NSUInteger)maxCount maxCost:(NSUInteger)maxCost {
    if (self = [super init]) {
        pthread_mutex_init(&_lock, NULL);
        _dic = [[NSMutableDictionary alloc] init];
        _lruList = [[LRULinkedList alloc] init];
        _maxCount = maxCount;
        _maxCost = maxCost;
    }
    return self;
}

- (void)insertNode:(LinkedNode *)node {
    
    LinkedNode *existNode = [_dic objectForKey:[node key]];
    pthread_mutex_lock(&_lock);
    if (existNode) {
        [_lruList bringNodeToHead:existNode];
    } else {
        [_lruList insertNodeAtHead:node];
        [_dic setObject:node forKey:[node key]];
        
        [self adjustNode];
    }
    pthread_mutex_unlock(&_lock);
}

- (void)removeNode:(LinkedNode *)node {
    pthread_mutex_lock(&_lock);
    [_dic removeObjectForKey:[node key]];
    [_lruList removeNode:node];
    pthread_mutex_unlock(&_lock);
}

- (void)removeAll {
    pthread_mutex_lock(&_lock);
    [_dic removeAllObjects];
    [_lruList removeAll];
    pthread_mutex_unlock(&_lock);
}

#pragma mark - private func
- (void)adjustNode {
    [self adjustCount];
    [self adjustCost];
}

- (void)adjustCount {
    while(_maxCount > 0 && _maxCount < _lruList.totalCount) {
        LinkedNode *tailNode = [_lruList removeTailNode];
        [_dic removeObjectForKey:[tailNode key]];
    }
}

- (void)adjustCost {
    while (_maxCost > 0 && _maxCost < _lruList.totalCost) {
        LinkedNode *tailNode = [_lruList removeTailNode];
        [_dic removeObjectForKey:[tailNode key]];
    }
}

@end
