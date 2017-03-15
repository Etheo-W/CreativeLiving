//
//  GoodsOfThisShop.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/5.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "GoodsOfThisShop.h"

@implementation GoodsOfThisShop

+ (GoodsOfThisShop *)parseGoodsOfThisShopWithDictionary:(NSDictionary *)dict
{
    GoodsOfThisShop *goods = [[GoodsOfThisShop alloc]init];
    
    goods.ID = [dict objectForKey:@"id"];
    goods.title = [dict objectForKey:@"title"];
    goods.picURL = [dict objectForKey:@"pic"];
    goods.price = [dict objectForKey:@"price"];
    goods.height = [[dict objectForKey:@"height"] intValue];
    goods.width = [[dict objectForKey:@"width"] intValue];
    goods.disCountPrice = [dict objectForKey:@"discountprice"];
    goods.discount = [dict objectForKey:@"discount"];
    goods.sale = [dict objectForKey:@"sale"];
    
    return goods;
}

@end
//{
//    "id":"1572944",
//    "title":"东南亚风格抱枕套不含芯腰枕办公室靠枕床头沙发靠垫紫色抱枕套",
//    "price":"38.00",
//    "height":0,
//    "width":0,
//    "discountprice":"38.00",
//    "pic":"http://img01.taobaocdn.com/bao/uploaded/i1/TB1XpEmKXXXXXaBaXXXXXXXXXXX_!!0-item_pic.jpg",
//    "discount":"低价",
//    "sale":"0.00"
//}