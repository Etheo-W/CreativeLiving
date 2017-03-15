//
//  HomeOtherDetail.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shop.h"
#import "OtherGoods.h"

@interface HomeOtherDetail : NSObject

@property (nonatomic, retain) Shop *shop;
@property (nonatomic, retain) NSMutableArray *itemListArray;
@property (nonatomic, assign) BOOL resStatus;

+ (HomeOtherDetail *)parseHomeOtherDetailWithDictionary:(NSDictionary *)dict;

@end
