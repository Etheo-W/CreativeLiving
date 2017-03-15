//
//  ShopGoodsDetail.h
//  CreativeLiving
//
//  Created by Etheo W on 16/6/1.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopGoodsDetail : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *picURL;

+ (ShopGoodsDetail *)parseShopGoodsDetailWithDictionary:(NSDictionary *)dict;

@end
