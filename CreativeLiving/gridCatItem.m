//
//  gridCatItem.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/29.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "gridCatItem.h"

@implementation gridCatItem

+ (gridCatItem *)parseGridCatItemWithDictionary:(NSDictionary *)dict
{
    gridCatItem *item = [[gridCatItem alloc] init];
    
    item.catArray = [[NSMutableArray alloc] init];
    for (NSDictionary *catDict in [dict objectForKey:@"catlist"])
    {
        gridCatItemCat *cat = [gridCatItemCat parseGridCatItemCatWithDictionary:catDict];
        
        [item.catArray addObject:cat];
    }
    
    item.catID = [[dict objectForKey:@"catid"] intValue];
    item.catName = [dict objectForKey:@"catname"];
    item.catNameWidth = [item.catName getRectWithSize:CGSizeMake(200, 14) WithSystemFontOfSize:14].size.width;
    
    return item;
}

@end

//{
//    "catlist": [{},{},{}],
//    "catid": "72",
//    "catname": "卧室"
//}