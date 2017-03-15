//
//  Shop.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/4.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "Shop.h"

@implementation Shop

+ (Shop *)parseShopWithDictionary:(NSDictionary *)dict
{
    Shop *shop = [[Shop alloc]init];
    
    shop.shopCatCount = [[dict objectForKey:@"shopcatcount"] intValue];
    shop.shopPicURL = [dict objectForKey:@"shopPic"];
    shop.shopID = [dict objectForKey:@"sid"];
    shop.itemScorePercent = [dict objectForKey:@"item_score_percent"];
    shop.name = [dict objectForKey:@"name"];
    shop.itemScoreType = [dict objectForKey:@"item_score_type"];
    shop.shopUpdateTime = [dict objectForKey:@"shopUpdateTime"];
    shop.credit = [[dict objectForKey:@"credit"] intValue];
    shop.goodsUpdateTime = [dict objectForKey:@"goodsupdate"];
    shop.shopPicHeight = [[dict objectForKey:@"shopPicHeight"] intValue];
    shop.shopPicWidth = [[dict objectForKey:@"shopPicWidth"] intValue];
    shop.itemScore = [dict objectForKey:@"item_score"];
    
    return shop;
    
}



//"shopPic":"http://photo6.xinzhuzhang.com/shopyy/4145_33931077.jpg",
//"sid":"4145",
//"item_score_percent":"4.7",
//"name":"好彩家居专售店",
//"item_score_type":"-1",
//"credit":0,
//"goodsupdate":"2015-11-01 08:51:31.0",
//"shopPicHeight":44,
//"shopPicWidth":44,
//"item_score":"4.7"

//"shop":{
//    "shopcatcount":0,
//    "shopPic":"http://photo6.xinzhuzhang.com/shopyy/64719912_taobao.jpg",
//    "sid":"5329",
//    "item_score_percent":"4.8",
//    "name":"美物特原创设计",
//    "item_score_type":"1",
//    "credit":0,
//    "goodsupdate":"2015-11-01 05:08:10.0",
//    "shopPicHeight":44,
//    "shopPicWidth":44,
//    "item_score":"4.8"
//},
@end
