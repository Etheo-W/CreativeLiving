//
//  Channel.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelDetail.h"

@interface Channel : NSObject

@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *pageSize;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, retain) NSMutableArray *detailArray;
@property (nonatomic, copy) NSString *resStatus;

+ (Channel *)parseChannelWithDictionary:(NSDictionary *)dict;

@end

