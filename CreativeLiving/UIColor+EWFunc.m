//
//  UIColor+EWFunc.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/2.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "UIColor+EWFunc.h"

@implementation UIColor (EWFunc)

+ (UIColor *)getSystemColor
{
    return [UIColor colorWithRed:103.0/255 green:187.0/255 blue:0.0/255 alpha:1];
}

+ (UIColor *)getSystemLightColor
{
    return [UIColor colorWithRed:234.0/255 green:246.0/255 blue:214.0/255 alpha:1];
}

+ (UIColor *)SystemBgColor
{
    return [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1];
}

@end
