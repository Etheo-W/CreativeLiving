//
//  FollowShop.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/6.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShopOfList.h"

@interface FollowShop : NSObject

@property (nonatomic, copy)NSString *lastLoginDate;
@property (nonatomic, retain)NSMutableArray *shopListArray;
@property (nonatomic, copy)NSString *listTime;
@property (nonatomic, assign)int myFavorShopCount;
@property (nonatomic, copy)NSString *resStatus;
@property (nonatomic, assign)BOOL ifFavorShopList;

+ (FollowShop *)parseFollowShopWithDictionary:(NSDictionary *)dict;

@end
