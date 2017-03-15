//
//  gridCatItemCat.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/29.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "gridCatItemCat.h"

@implementation gridCatItemCat

+ (gridCatItemCat *)parseGridCatItemCatWithDictionary:(NSDictionary *)dict
{
    gridCatItemCat *cat = [[gridCatItemCat alloc] init];
    
    cat.picURL = [dict objectForKey:@"picUrl"];
    cat.catID = [[dict objectForKey:@"catid"] intValue];
    cat.isBig = [[dict objectForKey:@"isbig"] boolValue];
    cat.catName = [dict objectForKey:@"catname"];
    
    return cat;
}

@end

//{
//    "picUrl": "http://photo6.xinzhuzhang.com/caticon_jiaju/cat_79.png?v=11",
//    "catid": "79",
//    "isbig": false,
//    "catname": "床品"
//}