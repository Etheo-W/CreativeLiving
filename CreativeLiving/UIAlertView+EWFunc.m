//
//  UIAlertView+EWFunc.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/2.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "UIAlertView+EWFunc.h"

@implementation UIAlertView (EWFunc)

+ (void)oneButtonAlertViewWithTitle:(NSString *)title WithMessage:(NSString *)message WithButtonTitle:(NSString *)buttonTitle
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:buttonTitle otherButtonTitles:nil];
    [alertView show];
}

@end
