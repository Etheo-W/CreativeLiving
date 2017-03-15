//
//  ShopGoodsDetail.m
//  CreativeLiving
//
//  Created by Etheo W on 16/6/1.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "ShopGoodsDetail.h"

@implementation ShopGoodsDetail

+ (ShopGoodsDetail *)parseShopGoodsDetailWithDictionary:(NSDictionary *)dict
{
    ShopGoodsDetail *detail = [[ShopGoodsDetail alloc] init];
    
    detail.ID = [dict objectForKey:@"id"];
    detail.price = [dict objectForKey:@"price"];
    detail.picURL = [dict objectForKey:@"pic"];
    
    return detail;
}


@end


//{
//    "id": "1676114",
//    "price": "50.00",
//    "pic": "http://img02.taobaocdn.com/bao/uploaded/i2/TB1DZttJFXXXXXiXXXXXXXXXXXX_!!0-item_pic.jpg_310x310.jpg"
//}