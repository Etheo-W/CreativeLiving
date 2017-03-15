//
//  gridCatItemCat.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/29.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gridCatItemCat : NSObject

@property (nonatomic, copy) NSString *picURL;
@property (nonatomic, assign) int catID;
@property (nonatomic, assign) BOOL isBig;
@property (nonatomic, copy) NSString *catName;

+ (gridCatItemCat *)parseGridCatItemCatWithDictionary:(NSDictionary *)dict;

@end

