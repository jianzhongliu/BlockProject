//
//  BlockManager.h
//  BlockProject
//
//  Created by yons on 14-3-28.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockManager : NSObject
{

}
@property (nonatomic, copy) void (^serchBlock)(NSString *);

//@property (nonatomic, strong) ;
+ (instancetype)defaultObject;
//- (void)testMethod;
//带参数的
- (void)testMethod:(NSString *)imgPath finishBlock:(void (^)(NSString *)) serchBlock;
//不带参数的
- (void)testMethod:(NSString *)imgPath compliteBlock:(void (^)(void)) serchBlock;
+(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2;
@end
