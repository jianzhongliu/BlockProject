//
//  BlockManager.m
//  BlockProject
//
//  Created by yons on 14-3-28.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import "BlockManager.h"

@implementation BlockManager
+ (instancetype)defaultObject {
    static BlockManager *blockM = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (blockM == nil) {
            blockM = [[BlockManager alloc] init];
        }
    });
    return blockM;
}

- (void)testMethod:(NSString *)imgPath finishBlock:(void (^)(NSString *)) serchBlock {
    _serchBlock = serchBlock;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(threadMethod) userInfo:nil repeats:YES];
}
- (void)threadMethod {
    _serchBlock(@"zhongguo");
}
//- (void)searchBrokerByBrokerPhone:(NSString *)brokerPhone compeletionBlock:(void (^)(AXMappedPerson *))searchBrokerBlock
@end
