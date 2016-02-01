//
//  ZYHero.h
//  英雄列表
//
//  Created by 章芝源 on 16/2/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYHero : NSObject
//图片
@property(copy, nonatomic)NSString *icon;
//介绍
@property(nonatomic, copy)NSString *intro;
//名字
@property(copy, nonatomic)NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
