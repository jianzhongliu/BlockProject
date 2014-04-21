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
- (void)testMethod:(NSString *)imgPath finishBlock:(void (^)(NSString *)) serchBlock;
@end
