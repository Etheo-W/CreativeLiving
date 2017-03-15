//
//  grid.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/29.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "grid.h"

@implementation grid

+ (grid *)parseGridWithDictionary:(NSDictionary *)dict
{
    grid *item = [[grid alloc] init];
    
    item.catID = [[dict objectForKey:@"catid"] intValue];
    item.resStatus = [[dict objectForKey:@"resStatus"] boolValue];
    
    item.catItemArray = [[NSMutableArray alloc] init];
    for (NSDictionary *itemDict in [dict objectForKey:@"catItemList"])
    {
        gridCatItem *cat = [gridCatItem parseGridCatItemWithDictionary:itemDict];
        
        [item.catItemArray addObject:cat];
    }
    
    return item;
}

@end
