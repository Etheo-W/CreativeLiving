//
//  HomeOther.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeOtherDetail.h"

@interface HomeOther : NSObject

@property (nonatomic, retain) NSMutableArray *shopListArray;
@property (nonatomic, assign) int page;
@property (nonatomic, assign) BOOL resStatus;

+ (HomeOther *)parseHomeOtherWithDictionary:(NSDictionary *)dict;

@end
