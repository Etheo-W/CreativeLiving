//
//  ChannelDetailitemGoods.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "ChannelDetailitemGoods.h"

@implementation ChannelDetailitemGoods

+ (ChannelDetailitemGoods *)parseChannelDetailitemGoodsWithDictionary:(NSDictionary *)dict
{
    ChannelDetailitemGoods *itemGoods = [[ChannelDetailitemGoods alloc] init];
    
    itemGoods.goodsID = [dict objectForKey:@"goodsid"];
    itemGoods.sourceGoodsID = [dict objectForKey:@"sourcegoodsid"];
    itemGoods.title = [dict objectForKey:@"title"];
    itemGoods.titleHeight = [itemGoods.title getRectWithSize:CGSizeMake(290, MAXFLOAT) WithSystemFontOfSize:20].size.height;
    itemGoods.shopID = [dict objectForKey:@"shopid"];
    itemGoods.picURL = [dict objectForKey:@"picurl"];
    itemGoods.disCountPrice = [dict objectForKey:@"discountprice"];
    
    itemGoods.createTime = [ChannelDetailitemGoods dateFromString:[[[dict objectForKey:@"createtime"] componentsSeparatedByString:@"."] objectAtIndex:0]];
    NSDate *currentTime = [[NSDate alloc] init];
    NSTimeInterval havedTimeInterval = [currentTime timeIntervalSinceDate:itemGoods.createTime];
    
    int days = ((int)havedTimeInterval)/(3600*24);
    int hours = ((int)havedTimeInterval)%(3600*24)/3600;
    
    itemGoods.havedTime = days > 0 ? [NSString stringWithFormat:@"%d天前", days] : [NSString stringWithFormat:@"%d小时前", hours];
    
    NSData *configData = [[[dict objectForKey:@"config"] deleteCharacterWithCharacter:@"\\"] dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *configDict = [NSJSONSerialization JSONObjectWithData:configData options:NSJSONReadingAllowFragments error:nil];
    
    itemGoods.config = [ChannelDetailitemGoodsConfig parseChannelDetailitemGoodsConfigWithDictionary:configDict];
    
    return itemGoods;
}

+ (NSDate *)dateFromString:(NSString *)dateString
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}

@end
//{
//    "goodsid": "339478",
//    "sourcegoodsid": "521240621888",
//    "title": "珀莱雅 夜间精华修护睡眠面膜80g",
//    "shopid": "15303",
//    "createtime": "2016-05-28 08:59:27.0",
//    "picurl": "https://img.alicdn.com/imgextra/i4/1019034373/TB2FLDPgFXXXXXJXXXXXXXXXXXX_!!1019034373.jpg_570x570q90.jpg",
//    "discountprice": "16.00",
//    "config": "",
//}