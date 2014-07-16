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

+(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block1();
        dispatch_async(dispatch_get_main_queue(),^{
            block2();
        });
    });
}
- (void)threadMethod {
    _serchBlock(@"zhongguo");
}

//- (void)searchBrokerByBrokerPhone:(NSString *)brokerPhone compeletionBlock:(void (^)(AXMappedPerson *))searchBrokerBlock
@end
