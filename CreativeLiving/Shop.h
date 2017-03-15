//
//  Shop.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/4.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (nonatomic, assign)int shopCatCount;
@property (nonatomic, copy)NSString *shopPicURL;
@property (nonatomic, copy)NSString *shopID;
@property (nonatomic, copy)NSString *itemScorePercent;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *itemScoreType;
@property (nonatomic, copy)NSString *shopUpdateTime;
@property (nonatomic, assign)int credit;
@property (nonatomic, copy)NSString *goodsUpdateTime;
@property (nonatomic, assign)int shopPicHeight;
@property (nonatomic, assign)int shopPicWidth;
@property (nonatomic, copy)NSString *itemScore;

+ (Shop *)parseShopWithDictionary:(NSDictionary *)dict;

@end
