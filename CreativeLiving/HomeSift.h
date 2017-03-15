//
//  HomeSift.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeSiftDetail.h"

@interface HomeSift : NSObject

@property (nonatomic, assign) int subjectID;
@property (nonatomic, assign) int subjectPage;
@property (nonatomic, assign) BOOL resStatus;
@property (nonatomic, copy) NSString *subjectType;
@property (nonatomic, retain) NSMutableArray *subjectListArray;

+ (HomeSift *)parseHomeSiftWithDictionary:(NSDictionary *)dict;

@end
