//
//  HomeOtherDetail.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeOtherDetail.h"

@implementation HomeOtherDetail

+ (HomeOtherDetail *)parseHomeOtherDetailWithDictionary:(NSDictionary *)dict
{
    HomeOtherDetail *homeOtherDetail = [[HomeOtherDetail alloc] init];
    
    homeOtherDetail.shop = [Shop parseShopWithDictionary:[dict objectForKey:@"shop"]];
    
    homeOtherDetail.itemListArray = [[NSMutableArray alloc] init];
    for (NSDictionary *twoDict in [dict objectForKey:@"itemList"])
    {
        for (NSDictionary *threeDict in [twoDict objectForKey:@"goodsList"])
        {
            OtherGoods *otherGoods = [OtherGoods parseOtherGoodsWithDictionary:threeDict];
            
            [homeOtherDetail.itemListArray addObject:otherGoods];
        }
    }
    
    return homeOtherDetail;
}

@end
