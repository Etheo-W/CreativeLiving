//
//  HomeSiftDetail.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeSiftDetail : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int subjectID;
@property (nonatomic, copy) NSString *subDate;
@property (nonatomic, copy) NSString *picURL;
@property (nonatomic, copy) NSString *type;

+ (HomeSiftDetail *)parseHomeSiftDetailWithDictionary:(NSDictionary *)dict;

@end
