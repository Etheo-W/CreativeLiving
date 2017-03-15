//
//  GoodsDetail.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/4.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shop.h"
#import "Goods.h"

@interface GoodsDetail : NSObject

@property (nonatomic, copy)NSString *tbkPageURL;
@property (nonatomic, retain)Shop *shop;
@property (nonatomic, copy)NSString *baobeiURL;
@property (nonatomic, retain)Goods *goods;
@property (nonatomic, copy)NSString *resStatus;
@property (nonatomic, copy)NSString *tbkScript;

+ (GoodsDetail *)parseGoodsDetailWithDictionary:(NSDictionary *)dict;

@end
