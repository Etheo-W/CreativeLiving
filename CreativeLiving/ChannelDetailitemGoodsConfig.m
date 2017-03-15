//
//  ChannelDetailitemGoodsConfig.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "ChannelDetailitemGoodsConfig.h"

@implementation ChannelDetailitemGoodsConfig

+ (ChannelDetailitemGoodsConfig *)parseChannelDetailitemGoodsConfigWithDictionary:(NSDictionary *)dict
{
    ChannelDetailitemGoodsConfig *config = [[ChannelDetailitemGoodsConfig alloc] init];
    
    config.priceAdd = [dict objectForKey:@"priceAdd"];
    config.red = [[dict objectForKey:@"goodsTopicStyle"] objectForKey:@"red"];
    config.limitedEndTime = [ChannelDetailitemGoodsConfig dateFromString:[dict objectForKey:@"limitedEndTime"]];
    config.butieEndTime = [ChannelDetailitemGoodsConfig dateFromString:[dict objectForKey:@"butieEndTime"]];
    config.couponEndTime = [ChannelDetailitemGoodsConfig dateFromString:[dict objectForKey:@"couponEndTime"]];
    
    NSDate *currentTime = [[NSDate alloc] init];
    NSTimeInterval leftTimeInterval = [config.butieEndTime timeIntervalSinceDate:currentTime];
    if (leftTimeInterval <= 0)
    {
        config.isEnding = YES;
        config.leftTime = @"";
    }else{
        config.isEnding = NO;
        
        int days = ((int)leftTimeInterval)/(3600*24);
        int hours = ((int)leftTimeInterval)%(3600*24)/3600;
        
        config.leftTime = [NSString stringWithFormat:@"还剩%d天%d小时", days, hours];
    }
    
    
    
    config.couponURL = [dict objectForKey:@"couponUrl"];
    config.isPriceUp = [[dict objectForKey:@"isPriceUp"] intValue];
    config.goodSource = [dict objectForKey:@"goodSource"];
    
    
    
    return config;
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
//    "priceAdd": "16.00",
//    "goodsTopicStyle": {
//        "red": "到手价16元\u003d售价29元-优惠券10元-抢货红包3元",
//    },
//    "limitedEndTime": "2016-05-29 23:59:59",
//    "butieEndTime": "2016-05-29 23:59:59",
//    "isPriceUp": "0",
//    "goodSource": "珀莱雅/天猫",
//    "butieStartTime": "2016-05-28 09:40:19",
//    "limitedStartTime": "2016-05-28 09:40:19",
//    "couponEndTime": "2016-05-29 23:59:59",
//    "goodsdesc": "到手价16元\u003d售价29元-优惠券10元-抢货红包3元\r\n\r\n这款PROYA珀莱雅海洋活能夜间精华修护睡眠面膜，质地比较水润，适合皮肤比较干的朋友晚间使用，免洗。规格80g。",
//    "couponUrl": "http://shop.m.taobao.com/shop/coupon.htm?seller_id\u003d1019034373\u0026activity_id\u003d45a772477ee74166be29fb2e48785e82",
//}