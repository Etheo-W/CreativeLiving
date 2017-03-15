//
//  MyLikeGoodsList.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/3.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "MyLikeGoodsList.h"

@implementation MyLikeGoodsList

+ (MyLikeGoodsList *)parseListWithDictionary:(NSDictionary *)dict
{
    MyLikeGoodsList *list = [[MyLikeGoodsList alloc]init];
    
    list.goodsFavorCount = [[dict objectForKey:@"goodsFavorCount"] intValue];
    list.page = [[dict objectForKey:@"page"] intValue];
    list.resStatus = [@"true" isEqualToString:[dict objectForKey:@"resStatus"]] ? YES : NO;
    list.goodsShareCount = [[dict objectForKey:@"goodsShareCount"] intValue];
    list.goodsListArray = [[NSMutableArray alloc]initWithCapacity:0];
    list.listTime = [dict objectForKey:@"listtime"];
    
    for (NSDictionary *goodsDict in [dict objectForKey:@"goodslist"])
    {
        MyLikeGoods *goods = [MyLikeGoods parseGoodsWithDictionary:goodsDict];
        [list.goodsListArray addObject:goods];
    }
    
    return list;
}

//{
//    "goodsFavorCount":0,
//    "page":0,
//    "resStatus":"true",
//    "goodslist":[],
//    "goodsShareCount":0
//}
//{
//    "goodsFavorCount":1,
//    "page":0,
//    "listtime":"2015-11-01 03:10:18.0",
//    "resStatus":"true",
//    "goodslist":[{
//        "addtime":"2015-11-03 20:36:37.0",
//        "attr":"",
//        "buycount":"0",
//        "config":"",
//        "createtime":"2015-11-01 03:10:18.0",
//        "discountprice":"46.00",
//        "favorcount":"1",
//        "goodsid":"1572935",
//        "isfavor":true,
//        "isshare":false,
//        "map":{
//            "height":285,
//            "priceDecimal":".00",
//            "width":285
//        },
//        "newtime":"2015-11-01 03:10:18.0",
//        "openAuctionIid":"",
//        "picurl":"http://img04.taobaocdn.com/bao/uploaded/i4/TB1En3hKXXXXXbRXFXXXXXXXXXX_!!0-item_pic.jpg",
//        "price":"46.00",
//        "sale":"0.00",
//        "sharecount":"0",
//        "shopcid":"",
//        "shopid":"4617",
//        "size":"",
//        "sourcegoodsid":"523812620536",
//        "status":"0",
//        "taobaocid":"",
//        "title":"幸运狗欧式高档蕾丝沙发垫防滑沙发巾罩坐垫现代简约四季通用正品",
//        "updatetime":"2015-11-01 03:10:18.0"}
//                 ],
//    "goodsShareCount":0
//}

@end
