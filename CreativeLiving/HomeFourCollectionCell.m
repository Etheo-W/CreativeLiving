//
//  HomeFourCollectionCell.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/25.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeFourCollectionCell.h"

@implementation HomeFourCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _headerView = [[HomeCellHeaderView alloc] initWithFrame:CGRectMake(0, 0, systemWidth, 180)];
        [self.contentView addSubview:_headerView];
        
        EWButton *button1 = [[EWButton alloc] initWithFrame:CGRectMake(0, 190, systemWidth, systemWidth)];
        [self.contentView addSubview:button1];
        
        EWButton *button2 = [[EWButton alloc] initWithFrame:CGRectMake(0, 200+systemWidth, (systemWidth - 10) / 2, (systemWidth - 10) / 2)];
        [self.contentView addSubview:button2];
        
        EWButton *button3 = [[EWButton alloc] initWithFrame:CGRectMake((systemWidth - 10) / 2 + 10, 200+systemWidth, (systemWidth - 10) / 2, (systemWidth - 10) / 2)];
        [self.contentView addSubview:button3];
        
        EWButton *button4 = [[EWButton alloc] initWithFrame:CGRectMake(0, 210 + systemWidth + (systemWidth - 10) / 2, systemWidth, systemWidth)];
        [self.contentView addSubview:button4];
        
        UIImageView *buttonView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 225 + systemWidth * 2 + (systemWidth - 10) / 2, 112, 24)];
        buttonView.centerX = self.contentView.centerX;
        buttonView.image = [UIImage imageNamed:@"xzzm_Subject_more"];
        [self.contentView addSubview:buttonView];
        
        _buttonArray = [[NSMutableArray alloc] initWithObjects:button1, button2, button3, button4, nil];
    }
    
    return self;
}

@end
