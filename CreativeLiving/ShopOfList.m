//
//  ShopOfList.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/6.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "ShopOfList.h"

@implementation ShopOfList

+ (ShopOfList *)parseShopOfListWithDictionary:(NSDictionary *)dict
{
    ShopOfList *shop = [[ShopOfList alloc]init];
    
    shop.shop = [Shop parseShopWithDictionary:[dict objectForKey:@"shop"]];
    shop.goodsListArray = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *goodsDict in [dict objectForKey:@"goodsList"])
    {
        MyLikeGoods *goods = [MyLikeGoods parseGoodsWithDictionary:goodsDict];
        [shop.goodsListArray addObject:goods];
    }
    shop.shopOrderTime = [dict objectForKey:@"shopOrderTime"];
    shop.ifFavor = [[dict objectForKey:@"ifFavor"] boolValue];
    
    return shop;
}

@end

//{
//    "shop":{"shopPic":"http://photo6.xinzhuzhang.com/shopyy/4096_62446839.jpg","sid":"4096","item_score_percent":"4.8","name":"弋帛美式家居布艺店","item_score_type":"1","shopUpdateTime":"1天前","credit":0,"shopUpdateCount":"","goodsupdate":"2015-11-05 14:17:14.0","shopPicHeight":44,"shopPicWidth":44,"item_score":"4.8"},
//    "goodsList":[
//                 {"addtime":"2015-11-05 14:17:52.0","attr":"","buycount":"0","config":"","createtime":"2015-11-05 14:17:14.0","discountprice":"119.00","favorcount":"0","goodsid":"1575712","isfavor":false,"isshare":false,"map":{"height":310,"priceDecimal":".00","width":310},"newtime":"2015-11-05 14:17:14.0","openAuctionIid":"","picurl":"http://img01.taobaocdn.com/bao/uploaded/i1/T1lVNBFwtlXXXXXXXX_!!0-item_pic.jpg_180x180.jpg","price":"119.00","sale":"0.00","sharecount":"0","shopcid":"","shopid":"4096","size":"","sourcegoodsid":"523902999033","status":"0","taobaocid":"","title":"新品美式靠垫抱枕套美克美家精品刺绣重工棉兰花沙发抱枕高端面料","updatetime":"2015-11-05 14:17:14.0"},
//                 {"addtime":"2015-08-19 09:44:58.0","attr":"","buycount":"0","config":"","createtime":"2015-08-19 09:44:22.0","discountprice":"88.00","favorcount":"0","goodsid":"1518608","isfavor":false,"isshare":false,"map":{"height":310,"priceDecimal":".00","width":310},"newtime":"2015-08-19 09:44:22.0","openAuctionIid":"","picurl":"http://img01.taobaocdn.com/bao/uploaded/i1/TB1JWVZJXXXXXXZXFXXXXXXXXXX_!!0-item_pic.jpg_180x180.jpg","price":"88.00","sale":"0.00","sharecount":"0","shopcid":"","shopid":"4096","size":"","sourcegoodsid":"521312383901","status":"0","taobaocid":"","title":"新品 出口欧美 美式乡村风格 厚粗棉麻刺绣孔雀靠包/抱枕/靠垫","updatetime":"2015-08-19 09:44:22.0"},
//                 {"addtime":"2015-08-11 23:36:05.0","attr":"","buycount":"0","config":"","createtime":"2015-08-11 23:35:38.0","discountprice":"37.60","favorcount":"1","goodsid":"1510292","isfavor":false,"isshare":false,"map":{"height":310,"priceDecimal":".60","width":310},"newtime":"2015-08-11 23:35:38.0","openAuctionIid":"","picurl":"http://img01.taobaocdn.com/bao/uploaded/i1/TB1b7P6IVXXXXaOaXXXXXXXXXXX_!!0-item_pic.jpg_180x180.jpg","price":"37.60","sale":"0.00","sharecount":"0","shopcid":"","shopid":"4096","size":"","sourcegoodsid":"521175649956","status":"0","taobaocid":"","title":"弋帛 高端奢华欧式沙发抱枕 床头靠背 美式办公室汽车靠枕靠垫","updatetime":"2015-08-11 23:35:38.0"},
//                 {"addtime":"2015-08-11 23:36:05.0","attr":"","buycount":"0","config":"","createtime":"2015-08-11 23:35:37.0","discountprice":"37.60","favorcount":"0","goodsid":"1510291","isfavor":false,"isshare":false,"map":{"height":310,"priceDecimal":".60","width":310},"newtime":"2015-08-11 23:35:37.0","openAuctionIid":"","picurl":"http://img03.taobaocdn.com/bao/uploaded/i3/TB1t9.kIVXXXXbwXVXXXXXXXXXX_!!0-item_pic.jpg_180x180.jpg","price":"37.60","sale":"0.00","sharecount":"0","shopcid":"","shopid":"4096","size":"","sourcegoodsid":"521184743124","status":"0","taobaocid":"","title":"新品奢华欧式抱枕靠垫套 条纹沙发床头汽车办公室大靠背/抱枕","updatetime":"2015-08-11 23:35:37.0"}],
//    "shopOrderTime":"2015-11-05 14:17:14.0",
//    "ifFavor":true
//}