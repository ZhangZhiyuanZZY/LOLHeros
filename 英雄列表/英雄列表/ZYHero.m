//
//  ZYHero.m
//  英雄列表
//
//  Created by 章芝源 on 16/2/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYHero.h"

@implementation ZYHero

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
