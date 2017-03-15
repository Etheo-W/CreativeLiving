//
//  ShopGoods.m
//  CreativeLiving
//
//  Created by Etheo W on 16/6/1.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "ShopGoods.h"

@implementation ShopGoods

+ (ShopGoods *)parseShopGoodsWithDictionary:(NSDictionary *)dict
{
    ShopGoods *goods = [[ShopGoods alloc] init];
    
    goods.isFollow = [[dict objectForKey:@"isFollow"] boolValue];
    goods.page = [[dict objectForKey:@"page"] intValue];
    goods.listTime = [dict objectForKey:@"listtime"];
    goods.resStatus = [[dict objectForKey:@"resStatus"] boolValue];
    goods.shopGoodsListArray = [[NSMutableArray alloc] init];
    for (NSDictionary *goodsDict in [dict objectForKey:@"myShopGoodsList"])
    {
        ShopGoodsDetail *goodsDetail = [ShopGoodsDetail parseShopGoodsDetailWithDictionary:goodsDict];
        
        [goods.shopGoodsListArray addObject:goodsDetail];
    }
    
    return goods;
}

@end
//{
//    "isFollow": "false",
//    "page": 0,
//    "listtime": "2016-05-06 12:55:35.0",
//    "resStatus": "true",
//    "myShopGoodsList": [ { },{}]
//}