//
//  ShopCat.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/5.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "ShopCat.h"

@implementation ShopCat

+ (ShopCat *)parseShopCatWithDictionary:(NSDictionary *)dict
{
    ShopCat *shopCat = [[ShopCat alloc]init];
    
    shopCat.catID = [dict objectForKey:@"catid"];
    shopCat.count = [[dict objectForKey:@"count"] intValue];
    shopCat.keyWords = [dict objectForKey:@"keywords"];
    shopCat.name = [dict objectForKey:@"name"];
    shopCat.parentID = [dict objectForKey:@"parentid"];
    shopCat.shopID = [dict objectForKey:@"shopid"];
    shopCat.sortOrder = [dict objectForKey:@"sortorder"];
    
    return shopCat;
}

@end

//{
//    "catid":"0",
//    "count":0,
//    "keywords":"",
//    "map":{},
//    "name":"全部",
//    "parentid":"",
//    "shopid":"",
//    "sortorder":""
//}