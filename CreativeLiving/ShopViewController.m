//
//  ShopViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/10/30.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "ShopViewController.h"
#import "FollowShopCollectionViewCell.h"
#import "ShopDetailViewController.h"

@interface ShopViewController ()
{
    UILabel *_countLabel;
    
    UICollectionView *_collectionView;
    NSMutableArray *_collectionDataArray;
}

@property (nonatomic, assign)BOOL isFavorShopList;

@property (nonatomic, assign)int followShopCount;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *shopHeaderView = [self createShopHeaderViewWithFrame:CGRectMake(0, 0, 20, 145)];
    
    UIImageView *recommendImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xzzm_MyStreet_recommendLabel"]];
    recommendImageView.frame = CGRectMake(0, -14, 90, 20);
    recommendImageView.centerX = self.view.centerX;
    
    NSArray *collectionZoneDataArray = [NSArray arrayWithObjects:shopHeaderView, recommendImageView, nil];
    
    NSMutableArray *collectionFirstDataArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    _collectionDataArray = [[NSMutableArray alloc] initWithObjects:collectionZoneDataArray, collectionFirstDataArray, nil];
    
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc]init];
    [collectionViewLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -20, self.view.width, self.view.height + 20) collectionViewLayout:collectionViewLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];

    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HeaderCell"];
    [_collectionView registerClass:[FollowShopCollectionViewCell class] forCellWithReuseIdentifier:@"ShopCell"];
    
    MJRefreshNormalHeader *mjRefreshNormalHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    mjRefreshNormalHeader.lastUpdatedTimeLabel.hidden = YES;
    [mjRefreshNormalHeader setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];
    [mjRefreshNormalHeader setTitle:@"松开可以刷新" forState:MJRefreshStatePulling];
    [mjRefreshNormalHeader setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    _collectionView.mj_header = mjRefreshNormalHeader;
    
    MJRefreshAutoNormalFooter *mjRefreshAutoNormalFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    mjRefreshAutoNormalFooter.stateLabel.hidden = YES;
    _collectionView.mj_footer = mjRefreshAutoNormalFooter;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSMutableArray *array = _collectionDataArray[1];
    if (array.count == 0)
    {
        [_collectionView.mj_header beginRefreshing];
    }
}

#pragma mark -
#pragma mark -刷新
- (void)loadNewData
{
    NSLog(@"下");
    
    [HttpManager getNewFollowShopWithCompletionBlock:^(FollowShop *followShop)
     {
         for (int i = (int)_collectionDataArray.count - 1; i > 0; i--)
         {
             [_collectionDataArray removeObjectAtIndex:i];
         }
         
         [_collectionDataArray addObject:followShop.shopListArray];
         
         self.isFavorShopList = followShop.ifFavorShopList;
         
         [_collectionView.mj_header endRefreshing];
         
         [_collectionView reloadData];
         
         self.followShopCount = followShop.myFavorShopCount;
     }];
}

- (void)loadMoreData
{
    NSLog(@"上");
    [HttpManager getMoreFollowShopWithCompletionBlock:^(FollowShop *followShop)
     {
         for (ShopOfList *shop in followShop.shopListArray)
         {
             [_collectionDataArray[1] addObject:shop];
         }
         
         [_collectionView.mj_footer endRefreshing];
         
         [_collectionView reloadData];
     }];
}

#pragma mark -
#pragma mark -collectionView代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _collectionDataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        if (self.isFavorShopList)
        {
            return 1;
        }
        else
        {
            return 2;
        }
    }
    
    NSMutableArray *array = _collectionDataArray[1];
    
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *headerCellID = @"HeaderCell";
    static NSString *shopCellID = @"ShopCell";
    
    if (indexPath.section == 0)
    {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:headerCellID forIndexPath:indexPath];
        
        for (UIView *view in cell.contentView.subviews)
        {
            [view removeFromSuperview];
        }
        
        [cell.contentView addSubview:[_collectionDataArray[0] objectAtIndex:indexPath.item]];
        
        return cell;
    }
    else
    {
        FollowShopCollectionViewCell *followShopCell = [collectionView dequeueReusableCellWithReuseIdentifier:shopCellID forIndexPath:indexPath];
        
        followShopCell.centerX = self.view.centerX;
        
        followShopCell.bgImageView.frame = CGRectMake(10, 5, followShopCell.width - 20, followShopCell.height - 5);
        followShopCell.followButton.centerX = followShopCell.centerX;
        
        ShopOfList *shop = [_collectionDataArray[1] objectAtIndex:indexPath.item];
        
        [followShopCell.headerImageView sd_setImageWithURL:[NSURL URLWithString:shop.shop.shopPicURL]];
        
        followShopCell.nameLabel.text = shop.shop.name;
        
        for (int i = 0; i < 4; i++)
        {
            UIImageView *imageView = (UIImageView *)[followShopCell.contentView viewWithTag:i + 1];
            MyLikeGoods *goods = shop.goodsListArray[i];
            
            [imageView sd_setImageWithURL:[NSURL URLWithString:goods.picURL]];
        }
        
        followShopCell.updateLabel.text = shop.shop.shopUpdateTime;
        
        if (self.isFavorShopList)
        {
            followShopCell.followButton.alpha = 0;
        }
        else
        {
            followShopCell.followButton.alpha = 1;
            followShopCell.followButton.selected = shop.ifFavor;
            [followShopCell.followButton addTarget:self action:@selector(followButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        return followShopCell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return CGSizeMake(self.view.width, indexPath.item == 0 ? 150 : 11);
    }
    
    if (self.isFavorShopList)
    {
        return CGSizeMake(self.view.width, 180);
    }
    return CGSizeMake(self.view.width, 190);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 0, 0, 0);
}

- (void)followButtonClick:(UIButton *)sender
{
    FollowShopCollectionViewCell *cell = (FollowShopCollectionViewCell *)[[sender superview] superview];
    
    NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
    
    ShopOfList *shop = [_collectionDataArray[1] objectAtIndex:indexPath.item];
    
    if (sender.selected)
    {
        [HttpManager unFollowShopWithShopID:shop.shop.shopID WithCompletionBlock:^(bool isSucess)
         {
             if (isSucess)
             {
                 sender.selected = NO;
                 shop.ifFavor = NO;
                 
             }
         }];
    }
    else
    {
        [HttpManager followShopWithShopID:shop.shop.shopID WithCompletionBlock:^(bool isSucess)
         {
             if (isSucess)
             {
                 sender.selected = YES;
                 shop.ifFavor = YES;
             }
         }];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0)
    {
        ShopOfList *shop = [_collectionDataArray[1] objectAtIndex:indexPath.item];
        
        ShopDetailViewController *shopDetailVC = [[ShopDetailViewController alloc]init];
        shopDetailVC.shopID = shop.shop.shopID;
        shopDetailVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:shopDetailVC animated:YES];
    }
}


#pragma mark -
#pragma mark -创建headerView
- (UIView *)createShopHeaderViewWithFrame:(CGRect)rect
{
    UIView *shopHeaderView = [[UIView alloc]initWithFrame:rect];
    shopHeaderView.sd_layout.widthIs(self.view.size.width);
    shopHeaderView.backgroundColor = [UIColor clearColor];
    shopHeaderView.clipsToBounds = YES;
    
    UIImageView *shopHeaderViewBgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xzzm_MyStreet_topBg"]];
    shopHeaderViewBgImageView.frame = CGRectMake(0, rect.size.height - 130, 20, 130);
    shopHeaderViewBgImageView.sd_layout.widthIs(self.view.size.width);
    [shopHeaderView addSubview:shopHeaderViewBgImageView];
    
    _countLabel = [[UILabel alloc]init];
    self.followShopCount = 0;
    _countLabel.textColor = [UIColor getSystemColor];
    _countLabel.font = [UIFont systemFontOfSize:10];
    [shopHeaderView addSubview:_countLabel];
    
    return shopHeaderView;
}

- (void)setFollowShopCount:(int)followShopCount
{
    _followShopCount = followShopCount;
    
    NSString *countLabelText = [NSString stringWithFormat:@"共关注了%d个店铺",_followShopCount];
    CGRect countLabelTextRect = [countLabelText getRectWithSize:CGSizeMake(self.view.width, 0) WithSystemFontOfSize:10];
    
    
    UIView *shopHeaderView = [_countLabel superview];
    [_countLabel removeFromSuperview];
    
    _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 65, countLabelTextRect.size.width, countLabelTextRect.size.height)];
    _countLabel.text = countLabelText;
    _countLabel.textColor = [UIColor getSystemColor];
    _countLabel.font = [UIFont systemFontOfSize:10];
    [shopHeaderView addSubview:_countLabel];
    NSLog(@"countLabelText %@", countLabelText);
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
