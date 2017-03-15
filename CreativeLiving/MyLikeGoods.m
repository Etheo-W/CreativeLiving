//
//  MyLikeGoods.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/3.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "MyLikeGoods.h"

@implementation MyLikeGoods

+ (MyLikeGoods *)parseGoodsWithDictionary:(NSDictionary *)dict
{
    MyLikeGoods *goods = [[MyLikeGoods alloc]init];
    
    goods.addTime = [dict objectForKey:@"addtime"];
    goods.attr = [dict objectForKey:@"attr"];
    goods.buyCount = [dict objectForKey:@"buycount"];
    goods.config = [dict objectForKey:@"config"];
    goods.createTime = [dict objectForKey:@"createtime"];
    goods.disCountPrice = [dict objectForKey:@"discountprice"];
    goods.favorCount = [dict objectForKey:@"favorcount"];
    goods.goodsID = [dict objectForKey:@"goodsid"];
    goods.isFavor = [[dict objectForKey:@"isfavor"] boolValue];
    goods.isShare = [[dict objectForKey:@"isshare"] boolValue];
    goods.map = [MyLikeGoodsMap parseGoodsMapWithDictionary:[dict objectForKey:@"map"]];
    goods.newtime = [dict objectForKey:@"newtime"];
    goods.openAuctionIID = [dict objectForKey:@"openAuctionIid"];
    goods.picURL = [dict objectForKey:@"picurl"];
    goods.price = [dict objectForKey:@"price"];
    goods.sale = [dict objectForKey:@"sale"];
    goods.shareCount = [dict objectForKey:@"sharecount"];
    goods.shopCID = [dict objectForKey:@"shopcid"];
    goods.shopID = [dict objectForKey:@"shopid"];
    goods.size = [dict objectForKey:@"size"];
    goods.sourceGoodsID = [dict objectForKey:@"sourcegoodsid"];
    goods.status = [dict objectForKey:@"status"];
    goods.taobaoCID = [dict objectForKey:@"taobaocid"];
    goods.title = [dict objectForKey:@"title"];
    goods.updateTime = [dict objectForKey:@"updatetime"];
    
    return goods;
}

//[{
//    "addtime":"2015-11-03 20:36:37.0",
//    "attr":"",
//    "buycount":"0",
//    "config":"",
//    "createtime":"2015-11-01 03:10:18.0",
//    "discountprice":"46.00",
//    "favorcount":"1",
//    "goodsid":"1572935",
//    "isfavor":true,
//    "isshare":false,
//    "map":{
//        "height":285,
//        "priceDecimal":".00",
//        "width":285
//    },
//    "newtime":"2015-11-01 03:10:18.0",
//    "openAuctionIid":"",
//    "picurl":"http://img04.taobaocdn.com/bao/uploaded/i4/TB1En3hKXXXXXbRXFXXXXXXXXXX_!!0-item_pic.jpg",
//    "price":"46.00",
//    "sale":"0.00",
//    "sharecount":"0",
//    "shopcid":"",
//    "shopid":"4617",
//    "size":"",
//    "sourcegoodsid":"523812620536",
//    "status":"0",
//    "taobaocid":"",
//    "title":"幸运狗欧式高档蕾丝沙发垫防滑沙发巾罩坐垫现代简约四季通用正品",
//    "updatetime":"2015-11-01 03:10:18.0"
//}]

@end
