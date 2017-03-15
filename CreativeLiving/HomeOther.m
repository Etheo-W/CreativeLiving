//
//  HomeOther.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeOther.h"

@implementation HomeOther

+ (HomeOther *)parseHomeOtherWithDictionary:(NSDictionary *)dict
{
    HomeOther *homeOther = [[HomeOther alloc]init];
    
    homeOther.page = [[dict objectForKey:@"page"] intValue];
    homeOther.resStatus = [[dict objectForKey:@"resStatus"] boolValue];
    homeOther.shopListArray = [[NSMutableArray alloc] init];
    for (NSDictionary *detailDict in [dict objectForKey:@"shopList"])
    {
        HomeOtherDetail *detail = [HomeOtherDetail parseHomeOtherDetailWithDictionary:detailDict];
        
        [homeOther.shopListArray addObject:detail];
    }
    
    return homeOther;
}

@end
