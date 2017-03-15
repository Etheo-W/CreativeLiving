//
//  HomeClassification.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/25.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeClassificationDetail.h"

@interface HomeClassification : NSObject

@property (nonatomic, retain) NSMutableArray *topListArray;
@property (nonatomic, retain) NSMutableArray *otherListArray;
@property (nonatomic, assign) int subjectCount;
@property (nonatomic, copy) NSString *resStatus;

+ (HomeClassification *)parseHomeClassificationWithDictionary:(NSDictionary *)dict;

@end
