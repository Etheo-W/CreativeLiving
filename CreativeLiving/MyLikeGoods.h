//
//  MyLikeGoods.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/3.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyLikeGoodsMap.h"

@interface MyLikeGoods : NSObject

@property (nonatomic, copy)NSString *addTime;
@property (nonatomic, copy)NSString *attr;
@property (nonatomic, copy)NSString *buyCount;
@property (nonatomic, copy)NSString *config;
@property (nonatomic, copy)NSString *createTime;
@property (nonatomic, copy)NSString *disCountPrice;
@property (nonatomic, copy)NSString *favorCount;
@property (nonatomic, copy)NSString *goodsID;
@property (nonatomic, assign)BOOL isFavor;
@property (nonatomic, assign)BOOL isShare;
@property (nonatomic, retain)MyLikeGoodsMap *map;
@property (nonatomic, copy)NSString *newtime;
@property (nonatomic, copy)NSString *openAuctionIID;
@property (nonatomic, copy)NSString *picURL;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *sale;
@property (nonatomic, copy)NSString *shareCount;
@property (nonatomic, copy)NSString *shopCID;
@property (nonatomic, copy)NSString *shopID;
@property (nonatomic, copy)NSString *size;
@property (nonatomic, copy)NSString *sourceGoodsID;
@property (nonatomic, copy)NSString *status;
@property (nonatomic, copy)NSString *taobaoCID;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *updateTime;

+ (MyLikeGoods *)parseGoodsWithDictionary:(NSDictionary *)dict;

@end
