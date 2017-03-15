//
//  ChannelDetailitemGoodsConfig.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelDetailitemGoodsConfig : NSObject

@property (nonatomic, copy) NSString *priceAdd;
@property (nonatomic, copy) NSString *red;
@property (nonatomic, retain) NSDate *limitedEndTime;
@property (nonatomic, retain) NSDate *butieEndTime;

@property (nonatomic, retain) NSDate *couponEndTime;

@property (nonatomic, copy) NSString *leftTime;

@property (nonatomic, assign) BOOL isEnding;

@property (nonatomic, copy) NSString *couponURL;
@property (nonatomic, assign) int isPriceUp;
@property (nonatomic, copy) NSString *goodSource;

+ (ChannelDetailitemGoodsConfig *)parseChannelDetailitemGoodsConfigWithDictionary:(NSDictionary *)dict;

@end
