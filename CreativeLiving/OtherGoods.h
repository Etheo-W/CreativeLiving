//
//  OtherGoods.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OtherGoods : NSObject

@property (nonatomic, assign) int goodsID;
@property (nonatomic, copy) NSString *goodsTitle;
@property (nonatomic, assign) int price;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int width;
@property (nonatomic, assign) double disCountPrice;
@property (nonatomic, copy) NSString *picURL;
@property (nonatomic, copy) NSString *disCount;
@property (nonatomic, assign) double sale;

+ (OtherGoods *)parseOtherGoodsWithDictionary:(NSDictionary *)dict;

@end
