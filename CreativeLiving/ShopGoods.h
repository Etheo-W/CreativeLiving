//
//  ShopGoods.h
//  CreativeLiving
//
//  Created by Etheo W on 16/6/1.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShopGoodsDetail.h"

@interface ShopGoods : NSObject

@property (nonatomic, assign) BOOL isFollow;
@property (nonatomic, assign) int page;
@property (nonatomic, copy) NSString *listTime;
@property (nonatomic, assign) BOOL resStatus;
@property (nonatomic, retain) NSMutableArray *shopGoodsListArray;

+ (ShopGoods *)parseShopGoodsWithDictionary:(NSDictionary *)dict;

@end
