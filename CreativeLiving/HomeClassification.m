//
//  HomeClassification.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/25.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeClassification.h"

@implementation HomeClassification

+ (HomeClassification *)parseHomeClassificationWithDictionary:(NSDictionary *)dict
{
    HomeClassification *homeClassification = [[HomeClassification alloc]init];
    
    homeClassification.topListArray = [[NSMutableArray alloc] init];
    for (NSDictionary *detailDict in [dict objectForKey:@"topList"])
    {
        HomeClassificationDetail *detail = [HomeClassificationDetail parseHomeClassificationDetailWithDictionary:detailDict];
        
        [homeClassification.topListArray addObject:detail];
    }
    
    homeClassification.otherListArray = [[NSMutableArray alloc] init];
    for (NSDictionary *detailDict in [dict objectForKey:@"otherList"])
    {
        HomeClassificationDetail *detail = [HomeClassificationDetail parseHomeClassificationDetailWithDictionary:detailDict];
        
        [homeClassification.otherListArray addObject:detail];
    }
    
    homeClassification.subjectCount = [[dict objectForKey:@"subjectcount"] intValue];
    homeClassification.resStatus = [dict objectForKey:@"resStatus"];
    
    return homeClassification;
}

@end
