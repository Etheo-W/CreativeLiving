//
//  Channel.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "Channel.h"

@implementation Channel

+ (Channel *)parseChannelWithDictionary:(NSDictionary *)dict
{
    Channel *channel = [[Channel alloc] init];
    
    channel.page = [dict objectForKey:@"page"];
    channel.pageSize = [dict objectForKey:@"pagesize"];
    channel.total = [dict objectForKey:@"total"];
    channel.detailArray = [[NSMutableArray alloc] init];
    for (NSDictionary *detailDict in [dict objectForKey:@"rows"])
    {
        ChannelDetail *detail = [ChannelDetail parseChannelDetailWithDictionary:detailDict];
        
        [channel.detailArray addObject:detail];
    }
    channel.resStatus = [dict objectForKey:@"resStatus"];
    
    return channel;
}

@end

//{
//    "page": 0,
//    "pagesize": 30,
//    "total": 0,
//    "rows": [],
//    "resStatus": true,
//    "topList": [],
//    "taobaoConfig": {
//        "goodsTbkScript": "document.getElementById(\"writeable_iframe_0\").contentWindow.document.getElementsByTagName(\"a\")[0].href",
//        "waitTime": 1,
//        "hideAppNoticeScript": "",
//        "taobaokeurl": "http://www.bababian.com/tbk/jiajuyingyong_qhc.jsp",
//        "goodsTaobaoScript": "document.getElementsByTagName(\"a\")[0].href"
//    }
//}