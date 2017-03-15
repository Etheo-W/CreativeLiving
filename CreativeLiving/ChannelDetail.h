//
//  ChannelDetail.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelDetailitemGoods.h"

@interface ChannelDetail : NSObject

@property (nonatomic, copy) NSString *detailID;
@property (nonatomic, copy) NSString *itemID;
@property (nonatomic, assign) int itemType;
@property (nonatomic, retain) ChannelDetailitemGoods *itemGoods;
@property (nonatomic, retain) NSDate *addtTime;
@property (nonatomic, assign) BOOL isShow;

+ (ChannelDetail *)parseChannelDetailWithDictionary:(NSDictionary *)dict;

@end
