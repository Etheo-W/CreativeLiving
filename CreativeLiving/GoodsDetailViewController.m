//
//  MyLikeGoodsDetailViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/4.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "GoodsDetailViewController.h"

@interface GoodsDetailViewController ()
{
    UITableView *_tableView;
    NSMutableArray *_tableDataArray;
    
    UIView *_priceView;
    
    UIView *_bottomView;
}

@property (nonatomic, assign)BOOL isLike;

@property (nonatomic, copy) NSString *goodsName;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, retain)GoodsDetail *goodsDetail;

@end

@implementation GoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 70)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = self.view.width;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    EWNavigationBar *navigationBar = [[EWNavigationBar alloc]initWithIsOpaque:NO WithView:self.view];
    navigationBar.delegate = self;
    [self.view addSubview:navigationBar];
    
    _priceView = [self createPriceView];
    [self.view addSubview:_priceView];
    
    _bottomView = [self createBottomView];
    [self.view addSubview:_bottomView];
    
    [HttpManager getGoodsDetailWithGoodsID:self.goodsID WithCompletionBlock:^(GoodsDetail *goodsDetail)
     {
         self.goodsDetail = goodsDetail;
         self.goodsName = goodsDetail.goods.title;
         self.isLike = goodsDetail.goods.isFavor;
         self.price = goodsDetail.goods.price;
         
         _tableDataArray = goodsDetail.goods.imageListArray;
         
         [_tableView reloadData];
     }];
    
    
}

#pragma mark -
#pragma mark -collectionView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.width)];
        imageView.tag = 1;
        [cell.contentView addSubview:imageView];
    }
    
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:1];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_tableDataArray[indexPath.row]]];
    
    return cell;
}

#pragma mark -
#pragma mark -创建价格View
- (UIView *)createPriceView
{
    UIView *priceView = [[UIView alloc]initWithFrame:CGRectMake(self.view.width - 133, self.view.height - 170, 133, 30)];
    
    UIImageView *priceImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xzzm_Goods_buyBtn"]];
    priceImageView.frame = CGRectMake(0, 0, 133, 30);
    [priceView addSubview:priceImageView];
    
    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 0, 65, 30)];
    priceLabel.tag = 1;
    priceLabel.textColor = [UIColor orangeColor];
    priceLabel.textAlignment = NSTextAlignmentCenter;
    priceLabel.font = [UIFont systemFontOfSize:15];
    [priceView addSubview:priceLabel];
    
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    detailButton.frame = CGRectMake(68, 0, 65, 30);
    [detailButton sd_setImageWithURL:[NSURL URLWithString:@"http://www.bababian.com/images/xzz/all_buy.png"] forState:UIControlStateNormal];
    [detailButton addTarget:self action:@selector(detailButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [priceView addSubview:detailButton];
    
    return priceView;
}

#pragma mark -
#pragma mark -创建底部View
- (UIView *)createBottomView
{
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.height - 70, self.view.width, 70)];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 20)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.tag = 1;
    nameLabel.backgroundColor = [UIColor lightGrayColor];
    nameLabel.font = [UIFont systemFontOfSize:10];
    [bottomView addSubview:nameLabel];
    
    UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    likeButton.frame = CGRectMake(0, 20, self.view.width / 2, 50);
    [likeButton setImage:[UIImage imageNamed:@"xzzm_Goods_like"] forState:UIControlStateNormal];
    [likeButton setImage:[UIImage imageNamed:@"xzzm_Goods_liked"] forState:UIControlStateSelected];
    likeButton.tag = 2;
    [likeButton addTarget:self action:@selector(likeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:likeButton];
    
    UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    enterButton.frame = CGRectMake(self.view.width / 2, 20, self.view.width / 2, 50);
    [enterButton setImage:[UIImage imageNamed:@"xzzm_Goods_enterShop"] forState:UIControlStateNormal];
    [enterButton addTarget:self action:@selector(enterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:enterButton];
    
    return bottomView;
}


#pragma mark -
#pragma mark -按钮方法
- (void)likeButtonClick:(UIButton *)sender
{
    if (_isLike)
    {
        [HttpManager removeLikeGoodsWithGoodsID:self.goodsID WithCompletionBlock:^(bool isSuccess)
        {
            if (isSuccess)
            {
                self.isLike = NO;
            }
        }];
    }
    else
    {
        [HttpManager addLikeGoodsWithGoodsID:self.goodsID WithCompletionBlock:^(bool isSuccess)
         {
             if (isSuccess)
             {
                 self.isLike = YES;
             }
         }];
    }
}

- (void)enterButtonClick:(UIButton *)sender
{
    ShopDetailViewController *shopDetailVC = [[ShopDetailViewController alloc]init];
    shopDetailVC.shopID = self.goodsDetail.shop.shopID;
    [self.navigationController pushViewController:shopDetailVC animated:YES];
}

- (void)detailButtonClick:(UIButton *)sender
{
    TaoBaoViewController *taobaoVC = [[TaoBaoViewController alloc]init];
    taobaoVC.goodsID = [[self.goodsDetail.tbkPageURL componentsSeparatedByString:@"="] objectAtIndex:1];
    [self.navigationController pushViewController:taobaoVC animated:YES];
}


#pragma mark -
#pragma mark -set方法
- (void)setGoodsName:(NSString *)goodsName
{
    _goodsName = goodsName;
    
    UILabel *nameLabel = (UILabel *)[_bottomView viewWithTag:1];
    nameLabel.text = _goodsName;
}

- (void)setIsLike:(BOOL)isLike
{
    _isLike = isLike;
    
    UIButton *sender = (UIButton *)[_bottomView viewWithTag:2];
    sender.selected = isLike;
}

- (void)setPrice:(NSString *)price
{
    _price = price;
    
    UILabel *priceLabel = (UILabel *)[_priceView viewWithTag:1];
    priceLabel.text = [NSString stringWithFormat:@"¥%@",price];
}


#pragma mark -
#pragma mark -导航返回方法
- (void)backButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
