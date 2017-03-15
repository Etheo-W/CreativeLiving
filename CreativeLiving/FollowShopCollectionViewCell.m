//
//  FollowShopCollectionViewCell.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/6.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "FollowShopCollectionViewCell.h"

@implementation FollowShopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, self.width - 20, self.height)];
        self.bgImageView.clipsToBounds = YES;
        self.bgImageView.image = [[UIImage imageNamed:@"xzzm_Street_sliderBg"] stretchableImageWithLeftCapWidth:100 topCapHeight:50];
        [self.contentView addSubview:self.bgImageView];
        
        self.headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 50, 50)];
        [self.contentView addSubview:self.headerImageView];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 15, self.width - 110, 30)];
        self.nameLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:self.nameLabel];
        
        self.NEWImageView = [[UIImageView alloc]initWithFrame:CGRectMake(70, 48, 20, 14)];
        self.NEWImageView.image = [UIImage imageNamed:@"xzzm_MyStreet_newLabelLeft"];
        [self.contentView addSubview:self.NEWImageView];
        
        self.tailImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - 25, 32, 10, 16)];
        self.tailImageView.image = [UIImage imageNamed:@"xzzbk_home_right"];
        [self.contentView addSubview:self.tailImageView];
        
        self.lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 79, self.width - 30, 1)];
        self.lineImageView.image = [UIImage imageNamed:@"xzzbk_featured_grayline"];
        [self.contentView addSubview:self.lineImageView];
        
        self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 85, 65, 65)];
        self.imageView1.tag = 1;
        [self.contentView addSubview:self.imageView1];
        
        self.imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(90, 85, 65, 65)];
        self.imageView2.tag = 2;
        [self.contentView addSubview:self.imageView2];
        
        self.imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(165, 85, 65, 65)];
        self.imageView3.tag = 3;
        [self.contentView addSubview:self.imageView3];
        
        self.imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(240, 85, 65, 65)];
        self.imageView4.tag = 4;
        [self.contentView addSubview:self.imageView4];
        
        self.alarmImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - 83, 155, 10, 10)];
        self.alarmImageView.image = [UIImage imageNamed:@"xzzbk_topic_clock"];
        [self.contentView addSubview:self.alarmImageView];
        
        self.updateLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.width - 70, 155, 30, 10)];
        self.updateLabel.font = [UIFont systemFontOfSize:10];
        self.updateLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.updateLabel];
        
        self.followButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.followButton.frame = CGRectMake(0, 155, 70, 22);
        [self.followButton setImage:[UIImage imageNamed:@"xzzm_MyStreet_followBtn"] forState:UIControlStateNormal];
        [self.followButton setImage:[UIImage imageNamed:@"xzzm_MyStreet_followed"] forState:UIControlStateSelected];
        [self.contentView addSubview:self.followButton];
    }
    
    return self;
}

@end
