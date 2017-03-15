//
//  ShopCat.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/5.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopCat : NSObject

@property (nonatomic, copy)NSString *catID;
@property (nonatomic, assign)int count;
@property (nonatomic, copy)NSString *keyWords;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *parentID;
@property (nonatomic, copy)NSString *shopID;
@property (nonatomic, copy)NSString *sortOrder;

+ (ShopCat *)parseShopCatWithDictionary:(NSDictionary *)dict;

@end
