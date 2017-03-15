//
//  Goods.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/4.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "Goods.h"

@implementation Goods

+ (Goods *)parseGoodsWithDictionary:(NSDictionary *)dict
{
    Goods *goods = [[Goods alloc]init];
    
    goods.ID = [dict objectForKey:@"id"];
    goods.shopID = [dict objectForKey:@"sid"];
    goods.title = [dict objectForKey:@"title"];
    goods.price = [dict objectForKey:@"price"];
    goods.imageListArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (NSString *imageURL in [dict objectForKey:@"imageList"])
    {
        [goods.imageListArray addObject:imageURL];
    }
    goods.isFavor = [[dict objectForKey:@"isFavor"] boolValue];
    goods.URL = [dict objectForKey:@"url"];
    
    return goods;
}

//"goods":{
//    "id":"1573043",
//    "sid":"4145",
//    "title":"好彩飘窗垫秋冬加厚毛绒窗台坐垫欧式阳台防滑榻榻米坐垫专业定做",
//    "price":"96.00",
//    "imageList":["http://img04.taobaocdn.com/bao/uploaded/i4/TB14jKwKXXXXXcbXpXXXXXXXXXX_!!0-item_pic.jpg_570x570q90.jpg"],
//    "isFavor":true,
//    "url":"http://a.m.taobao.com/i523838562375.htm"
//},

@end
