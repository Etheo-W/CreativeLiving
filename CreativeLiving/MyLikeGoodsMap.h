//
//  MyLikeGoodsMap.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/3.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyLikeGoodsMap : NSObject

@property (nonatomic, assign)int height;
@property (nonatomic, assign)int width;
@property (nonatomic, copy)NSString *priceDecimal;

+ (MyLikeGoodsMap *)parseGoodsMapWithDictionary:(NSDictionary *)dict;

@end
