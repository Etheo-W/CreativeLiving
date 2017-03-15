//
//  MyLikeGoodsDetail.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/4.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "GoodsDetail.h"

@implementation GoodsDetail

+ (GoodsDetail *)parseGoodsDetailWithDictionary:(NSDictionary *)dict
{
    GoodsDetail *goodsDetail = [[GoodsDetail alloc]init];
    
    goodsDetail.tbkPageURL = [dict objectForKey:@"tbkPageUrl"];
    goodsDetail.shop = [Shop parseShopWithDictionary:[dict objectForKey:@"shop"]];
    goodsDetail.baobeiURL = [dict objectForKey:@"baobeiUrl"];
    goodsDetail.goods = [Goods parseGoodsWithDictionary:[dict objectForKey:@"goods"]];
    goodsDetail.resStatus = [dict objectForKey:@"resStatus"];
    goodsDetail.tbkScript = [dict objectForKey:@"tbkScript"];
    
    return goodsDetail;
}

//{
//    "tbkPageUrl":"http://www.bababian.com/tbk/jiajuyingyong.jsp?id=523838562375",
//    "shop":{
//        "shopPic":"http://photo6.xinzhuzhang.com/shopyy/4145_33931077.jpg",
//        "sid":"4145",
//        "item_score_percent":"4.7",
//        "name":"好彩家居专售店",
//        "item_score_type":"-1",
//        "credit":0,
//        "goodsupdate":"2015-11-01 08:51:31.0",
//        "shopPicHeight":44,
//        "shopPicWidth":44,
//        "item_score":"4.7"
//    },
//    "baobeiUrl":"http://yyjd.xinzhuzhang.com/m/jiaju/goods/share/add?id=1573043",
//    "goods":{
//        "id":"1573043",
//        "sid":"4145",
//        "title":"好彩飘窗垫秋冬加厚毛绒窗台坐垫欧式阳台防滑榻榻米坐垫专业定做",
//        "price":"96.00",
//        "imageList":["http://img04.taobaocdn.com/bao/uploaded/i4/TB14jKwKXXXXXcbXpXXXXXXXXXX_!!0-item_pic.jpg_570x570q90.jpg"],
//        "isFavor":true,
//        "url":"http://a.m.taobao.com/i523838562375.htm"
//    },
//    "resStatus":"true",
//    "tbkScript":"var aElement;function getAElelment(){var aList=document.getElementsByTagName('a');for(var i=0;i<aList.length;i++){if(aList[i].className=='btnBuy'){return aList[i]}};return null};if(!aElement){aElement=getAElelment()};if(aElement){var evt=document.createEvent('Event');evt.initEvent('click',true,true);aElement.dispatchEvent(evt)}"
//}

@end
