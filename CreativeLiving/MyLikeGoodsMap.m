//
//  MyLikeGoodsMap.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/3.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "MyLikeGoodsMap.h"

@implementation MyLikeGoodsMap

+ (MyLikeGoodsMap *)parseGoodsMapWithDictionary:(NSDictionary *)dict
{
    MyLikeGoodsMap *goodsMap = [[MyLikeGoodsMap alloc]init];
    
    goodsMap.height = [[dict objectForKey:@"height"] intValue];
    goodsMap.width = [[dict objectForKey:@"width"] intValue];
    goodsMap.priceDecimal = [dict objectForKey:@"priceDecimal"];
    
    return goodsMap;
}

//"map":{
//    "height":285,
//    "priceDecimal":".00",
//    "width":285
//}

@end
