//
//  MyLikeGoodsList.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/3.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyLikeGoods.h"

@interface MyLikeGoodsList : NSObject

@property (nonatomic, assign) int goodsFavorCount;
@property (nonatomic, assign) int page;
@property (nonatomic, assign) BOOL resStatus;
@property (nonatomic, retain) NSMutableArray *goodsListArray;
@property (nonatomic, assign) int goodsShareCount;


@property (nonatomic, copy) NSString *listTime;

+ (MyLikeGoodsList *)parseListWithDictionary:(NSDictionary *)dict;

@end
