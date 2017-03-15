//
//  ChannelDetail.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "ChannelDetail.h"

@implementation ChannelDetail

+ (ChannelDetail *)parseChannelDetailWithDictionary:(NSDictionary *)dict
{
    ChannelDetail *detail = [[ChannelDetail alloc] init];
    
    detail.detailID = [dict objectForKey:@"id"];
    detail.itemID = [dict objectForKey:@"itemid"];
    detail.itemType = [[dict objectForKey:@"itemtype"] intValue];
    detail.itemGoods = [ChannelDetailitemGoods parseChannelDetailitemGoodsWithDictionary:[dict objectForKey:@"itemgoods"]];
    detail.addtTime = [ChannelDetail dateFromString:[dict objectForKey:@"addtime"]];
    detail.isShow = [[dict objectForKey:@"isshow"] boolValue];
    
    return detail;
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
//    "id": "747DE1D4-D5F2-401A-859D-29CA84C349A3",
//    "itemid": 339478,
//    "itemtype": 0,
//    "itemgoods": {},
//    "addtime": "2016-05-28 09:30:44",
//    "isshow": true
//}