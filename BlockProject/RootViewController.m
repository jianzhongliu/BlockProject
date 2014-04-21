//
//  RootViewController.m
//  BlockProject
//
//  Created by yons on 14-3-28.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import "RootViewController.h"
#import "BlockManager.h"

@interface RootViewController ()

@property (nonatomic, strong) int (^finishSendMessageBlock)(NSString *message,int status,int errorCode);
@property (nonatomic, strong) void (^serchBlock)(NSString *);

@end
@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initBlock];
}

- (void)initBlock {
//项目中得用法
    __weak RootViewController *blockSelf = self;
    self.serchBlock = ^(NSString *tempStr){
        [blockSelf printLog:tempStr];
    };
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[BlockManager defaultObject] testMethod:nil finishBlock:self.serchBlock];
}

- (void)printLog:(NSString *)str {
    NSLog(@"======%@",str);
}

@end
