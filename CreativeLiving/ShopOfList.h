//
//  ShopOfList.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/6.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyLikeGoods.h"
#import "Shop.h"

@interface ShopOfList : NSObject

@property (nonatomic, retain)Shop *shop;
@property (nonatomic, retain)NSMutableArray *goodsListArray;
@property (nonatomic, copy)NSString *shopOrderTime;
@property (nonatomic, assign)BOOL ifFavor;

+ (ShopOfList *)parseShopOfListWithDictionary:(NSDictionary *)dict;

@end
