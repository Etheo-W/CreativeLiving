//
//  Goods.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/4.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goods : NSObject

@property (nonatomic, copy)NSString *ID;
@property (nonatomic, copy)NSString *shopID;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, retain)NSMutableArray *imageListArray;
@property (nonatomic, assign)BOOL isFavor;
@property (nonatomic, copy)NSString *URL;

+ (Goods *)parseGoodsWithDictionary:(NSDictionary *)dict;

@end
