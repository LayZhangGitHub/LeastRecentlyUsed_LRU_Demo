//
//  main.m
//  LRUDemo
//
//  Created by LayZhang on 2015/5/2.
//  Copyright © 2015年 Zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
#import "LinkedNode.h"
#import "LRUDictionary.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        LRUDictionary *lruDic = [[LRUDictionary alloc] initWithMaxCount:3 maxCost:10];
        LinkedNode *node1 = [[LinkedNode alloc] initWithKey:@"Key1" value:@"Value1" cost:1];
        LinkedNode *node2 = [[LinkedNode alloc] initWithKey:@"Key2" value:@"Value2" cost:2];
        LinkedNode *node3 = [[LinkedNode alloc] initWithKey:@"Key3" value:@"Value3" cost:3];
        LinkedNode *node4 = [[LinkedNode alloc] initWithKey:@"Key4" value:@"Value4" cost:4];
        LinkedNode *node5 = [[LinkedNode alloc] initWithKey:@"Key5" value:@"Value5" cost:5];
        LinkedNode *node6 = [[LinkedNode alloc] initWithKey:@"Key6" value:@"Value6" cost:6];
        
        [lruDic insertNode:node1];
        [lruDic insertNode:node2];
        [lruDic insertNode:node3];
        [lruDic insertNode:node2];
        [lruDic insertNode:node4];
        [lruDic insertNode:node1];
        [lruDic insertNode:node5];
        [lruDic insertNode:node6];
        
    }
    return 0;
}
