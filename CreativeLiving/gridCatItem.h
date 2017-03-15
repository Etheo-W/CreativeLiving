//
//  gridCatItem.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/29.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gridCatItemCat.h"

@interface gridCatItem : NSObject

@property (nonatomic, retain) NSMutableArray *catArray;
@property (nonatomic, assign) int catID;
@property (nonatomic, copy) NSString *catName;
@property (nonatomic, assign) int catNameWidth;

+ (gridCatItem *)parseGridCatItemWithDictionary:(NSDictionary *)dict;

@end
