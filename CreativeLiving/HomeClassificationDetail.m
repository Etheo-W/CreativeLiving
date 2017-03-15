//
//  HomeClassificationDetail.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/25.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeClassificationDetail.h"

@implementation HomeClassificationDetail

+ (HomeClassificationDetail *)parseHomeClassificationDetailWithDictionary:(NSDictionary *)dict
{
    HomeClassificationDetail *homeClassificationDetail = [[HomeClassificationDetail alloc]init];
    
    homeClassificationDetail.addTime = [dict objectForKey:@"addtime"];
    homeClassificationDetail.clickURL = [dict objectForKey:@"clickurl"];
    homeClassificationDetail.dataType = [[dict objectForKey:@"datatype"] intValue];
    homeClassificationDetail.endTime = [dict objectForKey:@"endtime"];
    homeClassificationDetail.flag = [[dict objectForKey:@"flag"] intValue];
    homeClassificationDetail.picURL = [dict objectForKey:@"pic"];
    homeClassificationDetail.subjectID = [[dict objectForKey:@"subjectid"] intValue];
    homeClassificationDetail.title = [dict objectForKey:@"title"];
    homeClassificationDetail.type = [dict objectForKey:@"type"];
    homeClassificationDetail.URL = [dict objectForKey:@"url"];
    
    return homeClassificationDetail;
}

@end

//{
//    "addtime":"2015-07-07 09:28:45.0",
//    "clickurl":"http://yyjd.xinzhuzhang.com/ad/iface/adwall//ZMUSER_881376723?appId=&idfa=91D49881-92FB-4EE3-A9E7-31F9184B064B&mac=02:00:00:00:00:00&ad_active_task_app=881376723",
//    "datatype":"1",
//    "endtime":"2016-09-07 09:28:45.0",
//    "flag":"1",
//    "pic":"http://qianghuo.image.alimmdn.com/chongliang/260990/ad_banner.png",
//    "subjectid":"71",
//    "title":"品牌推广",
//    "type":"web",
//    "url":"http://www.xinzhuzhang.com/qianghuo/ProductServlet?id=260990&showheader=1&showback=1"
//}