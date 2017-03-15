//
//  ShopDetail.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/5.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "ShopDetail.h"

@implementation ShopDetail

+ (ShopDetail *)parseShopDetailWithDictionary:(NSDictionary *)dict
{
    ShopDetail *shop = [[ShopDetail alloc]init];
    
    shop.isFollow = [[dict objectForKey:@"isFollow"] boolValue];
    shop.shop = [Shop parseShopWithDictionary:[dict objectForKey:@"shop"]];
    shop.goodsListArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (NSDictionary *itemDict in [dict objectForKey:@"itemList"])
    {
        for (NSDictionary *goodsDict in [itemDict objectForKey:@"goodsList"])
        {
            GoodsOfThisShop *goods = [GoodsOfThisShop parseGoodsOfThisShopWithDictionary:goodsDict];
            goods.isBig = [[itemDict objectForKey:@"isBig"] boolValue];
            
            [shop.goodsListArray addObject:goods];
        }
    }
    shop.shopCatArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (NSDictionary *shopCatDict in [dict objectForKey:@"shopcat"])
    {
        ShopCat *shopCat = [ShopCat parseShopCatWithDictionary:shopCatDict];
        [shop.shopCatArray addObject:shopCat];
    }
    shop.listTime = [dict objectForKey:@"listtime"];
    shop.resStatus = [dict objectForKey:@"resStatus"];
    shop.dateName = [dict objectForKey:@"dateName"];
    
    return shop;
}

@end

//{
//    "isFollow":false,
//    "shop":{
//        "shopcatcount":0,
//        "shopPic":"http://photo6.xinzhuzhang.com/shopyy/64719912_taobao.jpg",
//        "sid":"5329",
//        "item_score_percent":"4.8",
//        "name":"美物特原创设计",
//        "item_score_type":"1",
//        "credit":0,
//        "goodsupdate":"2015-11-01 05:08:10.0",
//        "shopPicHeight":44,
//        "shopPicWidth":44,
//        "item_score":"4.8"
//        },
//    "itemList":[
//                {
//                    "goodsList":[
//                                 {
//                                     "id":"1572944",
//                                     "title":"东南亚风格抱枕套不含芯腰枕办公室靠枕床头沙发靠垫紫色抱枕套",
//                                     "price":"38.00",
//                                     "height":0,
//                                     "width":0,
//                                     "discountprice":"38.00",
//                                     "pic":"http://img01.taobaocdn.com/bao/uploaded/i1/TB1XpEmKXXXXXaBaXXXXXXXXXXX_!!0-item_pic.jpg",
//                                     "discount":"低价",
//                                     "sale":"0.00"}
//                                 ],
//                    "isBig":true},
//                {"goodsList":[
//                              {
//                                  "id":"1558788",
//                                  "title":"原创地中海涤麻花边信封流苏款靠枕抱枕",
//                                  "price":"58.00",
//                                  "height":0,
//                                  "width":0,
//                                  "discountprice":"58.00",
//                                  "pic":"http://img03.taobaocdn.com/bao/uploaded/i3/TB1gXT_JVXXXXcMXFXXXXXXXXXX_!!0-item_pic.jpg_310x310.jpg",
//                                  "discount":"低价",
//                                  "sale":"0.00"},
//                              {
//                                  "id":"1558787",
//                                  "title":"原创欧式田园蓝色涤麻花边双色拼接腰枕抱枕靠枕",
//                                  "price":"58.00",
//                                  "height":0,
//                                  "width":0,
//                                  "discountprice":"58.00",
//                                  "pic":"http://img01.taobaocdn.com/bao/uploaded/i1/TB1aGZlJVXXXXXTXpXXXXXXXXXX_!!0-item_pic.jpg_310x310.jpg",
//                                  "discount":"低价",
//                                  "sale":"0.00"}
//                              ],
//                    "isBig":false},
//                ],
//    "shopcat":[
//               {
//                   "catid":"0",
//                   "count":0,
//                   "keywords":"",
//                   "map":{},
//                   "name":"全部",
//                   "parentid":"",
//                   "shopid":"",
//                   "sortorder":""}
//               ],
//    "listtime":"2015-04-15",
//    "resStatus":"true",
//    "dateName":"04月15号——11月01号 上新100件"
//}