//
//  HomeSift.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeSift.h"

@implementation HomeSift

+ (HomeSift *)parseHomeSiftWithDictionary:(NSDictionary *)dict
{
    HomeSift *homeSift = [[HomeSift alloc]init];
    
    homeSift.subjectID = [[dict objectForKey:@"id"] intValue];
    homeSift.subjectPage = [[dict objectForKey:@"page"] intValue];
    homeSift.resStatus = [[dict objectForKey:@"resStatus"] boolValue];
    homeSift.subjectType = [dict objectForKey:@"type"];
    homeSift.subjectListArray = [[NSMutableArray alloc] init];
    for (NSDictionary *detailDict in [dict objectForKey:@"subjectList"])
    {
        HomeSiftDetail *detail = [HomeSiftDetail parseHomeSiftDetailWithDictionary:detailDict];
        
        [homeSift.subjectListArray addObject:detail];
    }
    
    return homeSift;
}

@end

//{
//    "id":"7",
//    "page":0,
//    "resStatus":"true",
//    "type":"allsubject",
//    "subjectList":[]
//}