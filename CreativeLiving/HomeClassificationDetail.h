//
//  HomeClassificationDetail.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/25.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeClassificationDetail : NSObject

@property (nonatomic, copy) NSString *addTime;
@property (nonatomic, copy) NSString *clickURL;
@property (nonatomic, assign) int dataType;
@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, assign) int flag;
@property (nonatomic, copy) NSString *picURL;
@property (nonatomic, assign) int subjectID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *URL;

+ (HomeClassificationDetail *)parseHomeClassificationDetailWithDictionary:(NSDictionary *)dict;

@end

//{
//    "addtime":"2015-07-07 09:28:45.0",
//    "bandDanCount":"",
//    "cid":"",
//    "clickurl":"http://yyjd.xinzhuzhang.com/ad/iface/adwall//ZMUSER_881376723?appId=&idfa=91D49881-92FB-4EE3-A9E7-31F9184B064B&mac=02:00:00:00:00:00&ad_active_task_app=881376723",
//    "config":"",
//    "datatype":"1",
//    "edittime":"",
//    "endtime":"2016-09-07 09:28:45.0",
//    "flag":"1",
//    "keywords":"",
//    "map":{},
//    "openurl":"",
//    "pic":"http://qianghuo.image.alimmdn.com/chongliang/260990/ad_banner.png",
//    "picHeight":"",
//    "picWidth":"",
//    "status":"",
//    "subjectid":"71",
//    "title":"品牌推广",
//    "type":"web",
//    "uid":"",
//    "url":"http://www.xinzhuzhang.com/qianghuo/ProductServlet?id=260990&showheader=1&showback=1"
//}
