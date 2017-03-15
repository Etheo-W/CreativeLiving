//
//  OtherGoods.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "OtherGoods.h"

@implementation OtherGoods

+ (OtherGoods *)parseOtherGoodsWithDictionary:(NSDictionary *)dict
{
    OtherGoods *otherGoods = [[OtherGoods alloc] init];
    
    otherGoods.goodsID = [[dict objectForKey:@"id"] intValue];
    otherGoods.goodsTitle = [dict objectForKey:@"title"];
    otherGoods.price = [[dict objectForKey:@"price"] intValue];
    otherGoods.height = [[dict objectForKey:@"height"] intValue];
    otherGoods.width = [[dict objectForKey:@"width"] intValue];
    otherGoods.disCountPrice = [[dict objectForKey:@"discountprice"] doubleValue];
    otherGoods.picURL = [dict objectForKey:@"pic"];
    otherGoods.disCount = [dict objectForKey:@"discount"];
    otherGoods.sale = [[dict objectForKey:@"sale"] doubleValue];
    
    return otherGoods;
}

@end

//{
//    "id":"1684764",
//    "title":"出口陶瓷器 烤箱 烘焙 韩式双耳色釉长方焗饭盘家用烤盘 甜品盘子",
//    "price":"21.50",
//    "height":0,
//    "width":0,
//    "discountprice":"21.50",
//    "pic":"http://img03.taobaocdn.com/bao/uploaded/i3/46687332/TB2OvkzoFXXXXa6XFXXXXXXXXXX_!!46687332.jpg_310x310.jpg",
//    "discount":"低价",
//    "sale":"0.00"
//}