//
//  NSString+EWFunc.h
//  CreativeLiving
//
//  Created by Etheo W on 15/10/31.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EWFunc)

- (CGRect)getRectWithSize:(CGSize)size WithSystemFontOfSize:(CGFloat)systemFontOfSize;

- (NSMutableString *)deleteCharacterWithCharacter:(NSString *)character;

@end
