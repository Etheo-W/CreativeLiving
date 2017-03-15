//
//  NSString+EWFunc.m
//  CreativeLiving
//
//  Created by Etheo W on 15/10/31.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "NSString+EWFunc.h"

@implementation NSString (EWFunc)

- (CGRect)getRectWithSize:(CGSize)size WithSystemFontOfSize:(CGFloat)systemFontOfSize
{
    return [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:systemFontOfSize]} context:nil];
}

- (NSMutableString *)deleteCharacterWithCharacter:(NSString *)character
{
    NSMutableString *responseString = [NSMutableString stringWithString:self];
    NSString *characterString = nil;
    for (int i = 0; i < responseString.length; i ++)
    {
        characterString = [responseString substringWithRange:NSMakeRange(i, 1)];
        if ([characterString isEqualToString:character])
            [responseString deleteCharactersInRange:NSMakeRange(i, 1)];
    }
    
    return responseString;
}

@end
