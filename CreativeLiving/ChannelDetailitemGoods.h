//
//  ChannelDetailitemGoods.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelDetailitemGoodsConfig.h"

@interface ChannelDetailitemGoods : NSObject

@property (nonatomic, copy) NSString *goodsID;
@property (nonatomic, copy) NSString *sourceGoodsID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) double titleHeight;
@property (nonatomic, copy) NSString *shopID;
@property (nonatomic, retain) NSDate *createTime;
@property (nonatomic, copy) NSString *havedTime;
@property (nonatomic, copy) NSString *picURL;
@property (nonatomic, copy) NSString *disCountPrice;
@property (nonatomic, retain) ChannelDetailitemGoodsConfig *config;

+ (ChannelDetailitemGoods *)parseChannelDetailitemGoodsWithDictionary:(NSDictionary *)dict;

@end