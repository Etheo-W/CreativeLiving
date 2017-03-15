//
//  grid.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/29.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gridCatItem.h"

@interface grid : NSObject

@property (nonatomic, assign) int catID;
@property (nonatomic, assign) BOOL resStatus;
@property (nonatomic, retain) NSMutableArray *catItemArray;

+ (grid *)parseGridWithDictionary:(NSDictionary *)dict;

@end
