//
//  HttpManager.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/2.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager


#pragma mark -
#pragma mark -逛街
+ (void)getNewHomeWithCompletionBlock:(void (^) (HomeClassification *homeClassification))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/subject/list?type=0&appid=887723574&channel=AppleStore2&token=&udid=026f7788f7f6a90caed4956f0727b9dc5b74a657&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=68516E3B-5A6F-480B-BB8C-7D18949DA172&mac=02:00:00:00:00:00&timestamp=1464153089.547122&v=1.1.6&ios=8.1&sign=95034281c828b96f50718b9397b321e5", HOSTURL];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         HomeClassification *homeClassification = [HomeClassification parseHomeClassificationWithDictionary:dict];
         
         block(homeClassification);
         
     }];
    
    [request startAsynchronous];
    
}

#pragma mark -小编推荐
+ (void)getNewHomeSiftWithID:(NSString *)subjectID WithPage:(int)page WithCompletionBlock:(void (^) (HomeSift *homeSift))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/subject/recommend?id=%@&page=%d&appid=887723574&channel=AppleStore2&token=&udid=026f7788f7f6a90caed4956f0727b9dc5b74a657&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=68516E3B-5A6F-480B-BB8C-7D18949DA172&mac=02:00:00:00:00:00&timestamp=1464237651.010932&v=1.1.6&ios=8.1&sign=70fda90466f6e3670ddfbcc4a761f9ac", HOSTURL,subjectID,page];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         HomeSift *homeSift = [HomeSift parseHomeSiftWithDictionary:dict];
         
         completionBlock(homeSift);
         
     }];
    
    [request setFailedBlock:^{
        failedBlock(YES);
    }];
    
    [request startAsynchronous];
}

#pragma mark -主页其他
+ (void)getNewHomeOtherWithID:(NSString *)subjectID WithPage:(int)page WithCompletionBlock:(void (^) (HomeOther *homeOther))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/subject/detail?id=%@&page=%d&appid=887723574&channel=AppleStore2&token=&udid=026f7788f7f6a90caed4956f0727b9dc5b74a657&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=68516E3B-5A6F-480B-BB8C-7D18949DA172&mac=02:00:00:00:00:00&timestamp=1464237651.010932&v=1.1.6&ios=8.1&sign=70fda90466f6e3670ddfbcc4a761f9ac", HOSTURL,subjectID,page];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         HomeOther *homeOther = [HomeOther parseHomeOtherWithDictionary:dict];
         
         completionBlock(homeOther);
         
     }];
    
    [request setFailedBlock:^{
        failedBlock(YES);
    }];
    
    [request startAsynchronous];
}

#pragma mark -
#pragma mark -捡宝
+ (void)getChannelWithPage:(int)page WithCompletionBlock:(void (^) (Channel *channel))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/qiangbaokuan/channel/list?page=%d&appid=887723574&channel=AppleStore2&token=&udid=026f7788f7f6a90caed4956f0727b9dc5b74a657&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=68516E3B-5A6F-480B-BB8C-7D18949DA172&mac=02:00:00:00:00:00&timestamp=1464355948.434901&v=1.1.6&ios=8.1&sign=ee3bb0a2543a36125c3124c3d891ea47", HOSTURL,page];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         Channel *channel = [Channel parseChannelWithDictionary:dict];
         
         completionBlock(channel);
         
     }];
    
    [request setFailedBlock:^{
        failedBlock(YES);
    }];
    
    [request startAsynchronous];
}


#pragma mark -
#pragma mark -关注列表
+ (void)getNewFollowShopWithCompletionBlock:(void (^) (FollowShop *followShop))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/shop/follow/list?appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446795332.339879&v=1.1.6&ios=8.1&sign=37fe75196ee74da7a83e5df380898e40", HOSTURL];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         FollowShop *followShop = [FollowShop parseFollowShopWithDictionary:dict];
         
         block(followShop);
         
     }];
    
    [request startAsynchronous];
    
}

+ (void)getMoreFollowShopWithCompletionBlock:(void (^) (FollowShop *followShop))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/shop/follow/list?&page=5&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446808490.513826&v=1.1.6&ios=8.1&sign=eee02d9028cc75df14a8239bdbfc968c", HOSTURL];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         FollowShop *followShop = [FollowShop parseFollowShopWithDictionary:dict];
         
         block(followShop);
         
     }];
    
    [request startAsynchronous];
}


#pragma mark -
#pragma mark -商店
+ (void)getShopNewDetailWithShopID:(NSString *)shopID WithCompletionBlock:(void (^) (ShopDetail *shopDetail))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/shop/detail?id=%@&sort=0&page=0&catid=&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446713298.946208&v=1.1.6&ios=8.1&sign=a10da7c73928fe0093177a70932b47fa", HOSTURL, shopID];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         ShopDetail *shop = [ShopDetail parseShopDetailWithDictionary:dict];
         
         block(shop);
         
     }];
    
    [request startAsynchronous];
}

+ (void)getShopMoreDetailWithShopID:(NSString *)shopID WithGoodsUpdateTime:(NSString *)time WithCompletionBlock:(void (^) (ShopDetail *shopDetail))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/shop/detail?id=%@&sort=0&page=1&listtime=%@&catid=&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446713298.946208&v=1.1.6&ios=8.1&sign=a10da7c73928fe0093177a70932b47fa", HOSTURL, shopID, time];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         ShopDetail *shop = [ShopDetail parseShopDetailWithDictionary:dict];
         
         block(shop);
         
     }];
    
    [request startAsynchronous];
}

#pragma mark -关注
+ (void)followShopWithShopID:(NSString *)shopID WithCompletionBlock:(void (^) (bool isSucess))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/shop/follow/add?id=%@&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446793070.353817&v=1.1.6&ios=8.1&sign=42d781305ab922234c6c7243b5fdbdf3", HOSTURL, shopID];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         block([[dict objectForKey:@"resStatus"] boolValue]);
     }];
    
    [request startAsynchronous];
}

+ (void)unFollowShopWithShopID:(NSString *)shopID WithCompletionBlock:(void (^) (bool isSucess))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/shop/follow/remove?id=%@&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446793070.353817&v=1.1.6&ios=8.1&sign=42d781305ab922234c6c7243b5fdbdf3", HOSTURL, shopID];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         block([[dict objectForKey:@"resStatus"] boolValue]);
     }];
    
    [request startAsynchronous];
}

#pragma mark -
#pragma mark -分类
+ (void)getGridWithCompletionBlock:(void (^) (grid *item))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/goods/category/list?appid=887723574&channel=AppleStore2&token=&udid=026f7788f7f6a90caed4956f0727b9dc5b74a657&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=68516E3B-5A6F-480B-BB8C-7D18949DA172&mac=02:00:00:00:00:00&timestamp=1464406290.388370&v=1.1.6&ios=8.1&sign=e84077db74b43ed4c2e5f0ddc8dedf3e", HOSTURL];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         grid *item = [grid parseGridWithDictionary:dict];
         
         completionBlock(item);
         
     }];
    
    [request setFailedBlock:^{
        failedBlock(YES);
    }];
    
    [request startAsynchronous];
}

#pragma mark -分类详情
+ (void)getGridDetailWithCatID:(NSString *)catID WithPage:(int)page WithCompletionBlock:(void (^) (ShopGoods *goods))completionBlock WithFailedBlock:(void (^) (bool isFailed))failedBlock
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/goods/category/search?cid=%@&isFollow=&page=%d&appid=887723574&channel=AppleStore2&token=&udid=026f7788f7f6a90caed4956f0727b9dc5b74a657&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=68516E3B-5A6F-480B-BB8C-7D18949DA172&mac=02:00:00:00:00:00&timestamp=1464515578.246239&v=1.1.6&ios=8.1&sign=36895ffc16b4c281976ffd11e63a652c", HOSTURL, catID, page];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         ShopGoods *goods = [ShopGoods parseShopGoodsWithDictionary:dict];
         
         completionBlock(goods);
         
     }];
    
    [request setFailedBlock:^{
        failedBlock(YES);
    }];
    
    [request startAsynchronous];
}


#pragma mark -
#pragma mark -我
+ (void)getMyLikeGoodsNewListWithCompletionBlock:(void (^) (MyLikeGoodsList *goodsList))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/goods/favorite/list?page=0&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446554209.889473&v=1.1.6&ios=8.1&sign=8058e8d232d0075a6dee5d087564f9bd", HOSTURL];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
    {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
        
        MyLikeGoodsList *goodsList = [MyLikeGoodsList parseListWithDictionary:dict];
        
        block(goodsList);
        
    }];
    
    [request startAsynchronous];
}

+ (void)getMyLikeGoodsMoreListWithCompletionBlock:(void (^) (MyLikeGoodsList *goodsList))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/goods/favorite/list?page=1&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446554209.889473&v=1.1.6&ios=8.1&sign=8058e8d232d0075a6dee5d087564f9bd", HOSTURL];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         MyLikeGoodsList *goodsList = [MyLikeGoodsList parseListWithDictionary:dict];
         
         block(goodsList);
         
     }];
    
    [request startAsynchronous];
}

#pragma mark -我喜欢的商品
+ (void)getGoodsDetailWithGoodsID:(NSString *)goodsID WithCompletionBlock:(void (^) (GoodsDetail *goodsDetail))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/goods/detail?id=%@&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446625527.901355&v=1.1.6&ios=8.1&sign=1a39313ada9d8a5bcd1f2311aff1fde8", HOSTURL, goodsID];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         GoodsDetail *goodsDetail = [GoodsDetail parseGoodsDetailWithDictionary:dict];
         
         block(goodsDetail);
     }];
    
    [request startAsynchronous];
}

+ (void)addLikeGoodsWithGoodsID:(NSString *)goodsID WithCompletionBlock:(void (^) (bool isSuccess))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/goods/favorite/add?id=%@&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446625557.257996&v=1.1.6&ios=8.1&sign=f0332962855100dcfc6bd5b94c9efe5c", HOSTURL, goodsID];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
    {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
        
        block([[dict objectForKey:@"resStatus"] boolValue]);
    }];
    
    [request startAsynchronous];
}

+ (void)removeLikeGoodsWithGoodsID:(NSString *)goodsID WithCompletionBlock:(void (^) (bool isSuccess))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/goods/favorite/remove?id=%@&appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446625557.257996&v=1.1.6&ios=8.1&sign=f0332962855100dcfc6bd5b94c9efe5c", HOSTURL, goodsID];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^
     {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
         
         block([[dict objectForKey:@"resStatus"] boolValue]);
     }];
    
    [request startAsynchronous];
}

#pragma mark -提交反馈
+ (void)commitFeedBackWithContent:(NSString *)content WithCompletionBlock:(void (^) (bool isSuccess))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@/m/jiaju/feedback?appid=887723574&channel=AppleStore2&token=d67a061136623b795334f1543f178e95382e9446d9e862cdaca3496055279167&udid=f0af4e6e89d77155b774f9af3edb4e38f02d8c2f&idfa=A2E78ED2-5DBF-4ABF-81A7-5CBDE1827BCA&idfv=933A3294-8CCD-4815-8D4B-170B813FBA8B&mac=02:00:00:00:00:00&timestamp=1446550838.842530&v=1.1.6&ios=8.1&sign=a8d1e6bc5c75e77bf08605a0c4ec7ee3", HOSTURL];
    
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request appendPostData:[content dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setCompletionBlock:^
    {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
    
        block([@"true" isEqualToString:[dict objectForKey:@"resStatus"]] ? YES :NO);
    }];
    
    [request startAsynchronous];
}

@end