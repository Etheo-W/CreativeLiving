//
//  HomeSiftDetail.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeSiftDetail.h"

@implementation HomeSiftDetail

+ (HomeSiftDetail *)parseHomeSiftDetailWithDictionary:(NSDictionary *)dict
{
    HomeSiftDetail *homeSiftDetail = [[HomeSiftDetail alloc]init];
    
    homeSiftDetail.title = [dict objectForKey:@"title"];
    homeSiftDetail.subjectID = [[dict objectForKey:@"subjectId"] intValue];
    homeSiftDetail.subDate = [dict objectForKey:@"subDate"];
    homeSiftDetail.picURL = [dict objectForKey:@"pic"];
    homeSiftDetail.type = [dict objectForKey:@"type"];
    
    return homeSiftDetail;
}

@end

//{
//    "picWidth":null,
//    "title":"双11大牌家纺",
//    "subjectId":"66",
//    "subDate":"10月21日",
//    "pic":"http://photo6.xinzhuzhang.com/yyzt/jiaju/sb_66_141387898760140.png",
//    "type":"shop",
//    "picHeight":null
//}