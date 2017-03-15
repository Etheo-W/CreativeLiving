//
//  HttpManager.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/2.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#define HOSTURL  @"http://yyjd.xinzhuzhang.com"

#define VERSIONNUMBER @"V1.1.6"

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"


#import "HomeClassification.h"
#import "HomeSift.h"
#import "HomeOther.h"

#import "Channel.h"

#import "grid.h"
#import "ShopGoods.h"

#import "MyLikeGoodsList.h"
#import "GoodsDetail.h"
#import "ShopDetail.h"
#import "FollowShop.h"

@interface HttpManager : NSObject


#pragma mark -
#pragma mark -逛街
+ (void)getNewHomeWithCompletionBlock:(void (^) (HomeClassification *homeClassification))block;

#pragma mark -小编推荐
+ (void)getNewHomeSiftWithID:(NSString *)subjectID WithPage:(int)page WithCompletionBlock:(void (^) (HomeSift *homeSift))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock;

#pragma mark -主页其他
+ (void)getNewHomeOtherWithID:(NSString *)subjectID WithPage:(int)page WithCompletionBlock:(void (^) (HomeOther *homeOther))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock;

#pragma mark -
#pragma mark -捡宝
+ (void)getChannelWithPage:(int)page WithCompletionBlock:(void (^) (Channel *channel))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock;

#pragma mark -
#pragma mark -关注列表
+ (void)getNewFollowShopWithCompletionBlock:(void (^) (FollowShop *followShop))block;
+ (void)getMoreFollowShopWithCompletionBlock:(void (^) (FollowShop *followShop))block;

#pragma mark -
#pragma mark -商店
+ (void)getShopNewDetailWithShopID:(NSString *)shopID WithCompletionBlock:(void (^) (ShopDetail *shopDetail))block;
+ (void)getShopMoreDetailWithShopID:(NSString *)shopID WithGoodsUpdateTime:(NSString *)time WithCompletionBlock:(void (^) (ShopDetail *shopDetail))block;

#pragma mark -关注
+ (void)followShopWithShopID:(NSString *)shopID WithCompletionBlock:(void (^) (bool isSucess))block;
+ (void)unFollowShopWithShopID:(NSString *)shopID WithCompletionBlock:(void (^) (bool isSucess))block;

#pragma mark -
#pragma mark -分类
+ (void)getGridWithCompletionBlock:(void (^) (grid *item))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock;
#pragma mark -分类详情
+ (void)getGridDetailWithCatID:(NSString *)catID WithPage:(int)page WithCompletionBlock:(void (^) (ShopGoods *goods))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock;

#pragma mark -
#pragma mark -我
+ (void)getMyLikeGoodsNewListWithCompletionBlock:(void (^) (MyLikeGoodsList *goodsList))block;
+ (void)getMyLikeGoodsMoreListWithCompletionBlock:(void (^) (MyLikeGoodsList *goodsList))block;

#pragma mark -我喜欢的商品
+ (void)getGoodsDetailWithGoodsID:(NSString *)goodsID WithCompletionBlock:(void (^) (GoodsDetail *goodsDetail))block;
+ (void)addLikeGoodsWithGoodsID:(NSString *)goodsID WithCompletionBlock:(void (^) (bool isSuccess))block;
+ (void)removeLikeGoodsWithGoodsID:(NSString *)goodsID WithCompletionBlock:(void (^) (bool isSuccess))block;

#pragma mark -提交反馈
+ (void)commitFeedBackWithContent:(NSString *)content WithCompletionBlock:(void (^) (bool isSuccess))block;

@end
