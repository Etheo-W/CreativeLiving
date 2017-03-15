//
//  GoodsOfThisShop.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/5.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsOfThisShop : NSObject

@property (nonatomic, copy)NSString *ID;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, assign)int height;
@property (nonatomic, assign)int width;
@property (nonatomic, copy)NSString *disCountPrice;
@property (nonatomic, copy)NSString *picURL;
@property (nonatomic, copy)NSString *discount;
@property (nonatomic, copy)NSString *sale;
@property (nonatomic, assign)BOOL isBig;

+ (GoodsOfThisShop *)parseGoodsOfThisShopWithDictionary:(NSDictionary *)dict;

@end
