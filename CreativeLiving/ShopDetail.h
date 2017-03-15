//
//  ShopDetail.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/5.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shop.h"
#import "ShopCat.h"
#import "GoodsOfThisShop.h"

@interface ShopDetail : NSObject

@property (nonatomic, assign)BOOL isFollow;
@property (nonatomic, retain)Shop *shop;
@property (nonatomic, retain)NSMutableArray *goodsListArray;
@property (nonatomic, retain)NSMutableArray *shopCatArray;
@property (nonatomic, copy)NSString *listTime;
@property (nonatomic, copy)NSString *resStatus;
@property (nonatomic, copy)NSString *dateName;

+ (ShopDetail *)parseShopDetailWithDictionary:(NSDictionary *)dict;

@end
