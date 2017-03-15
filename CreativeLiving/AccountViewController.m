//
//  AccountViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/10/30.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#define SDAutoLayoutIssueLog
#define accountHeaderImageViewCornerRadius 28
#define accountHeaderImageViewLineWidth 4


#import "AccountViewController.h"
#import "AccountSettingViewController.h"
#import "MyLikeGoodsCollectionCell.h"
#import "GoodsDetailViewController.h"

@interface AccountViewController ()
{
    
    UILabel *_tipLabel;
    
    UICollectionView *_collectionView;
    NSMutableArray *_collectionDataArray;
    int _page;
    
}

@property (nonatomic, assign)long int myLikeGoodsCount;

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *accountHeaderView = [self createAccountHeaderViewWithFrame:CGRectMake(0, 0, 20, 150)];
    
    UIImageView *noLikedImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xzzm_Me_noLiked"]];
    noLikedImageView.frame = CGRectMake(0, 50, 160, 130);
    noLikedImageView.centerX = self.view.centerX;
    
    NSArray *collectionZoneDataArray = [NSArray arrayWithObjects:accountHeaderView, noLikedImageView, nil];
    
    NSMutableArray *collectionFirstDataArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    _collectionDataArray = [[NSMutableArray alloc]initWithObjects:collectionZoneDataArray, collectionFirstDataArray, nil];
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc]init];
    [collectionViewLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, -20, self.view.width, self.view.height + 20) collectionViewLayout:collectionViewLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HeaderCell"];
    [_collectionView registerClass:[MyLikeGoodsCollectionCell class] forCellWithReuseIdentifier:@"GoodsCell"];
    
    
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
    
    [HttpManager getMyLikeGoodsNewListWithCompletionBlock:^(MyLikeGoodsList *goodsList)
     {
         [_collectionDataArray removeObjectAtIndex:1];
         
         [_collectionDataArray addObject:goodsList.goodsListArray];
         
         [_collectionView.mj_header endRefreshing];
         
         [_collectionView reloadData];
         
         self.myLikeGoodsCount = goodsList.goodsListArray.count;
     }];
}

- (void)loadMoreData
{
    NSLog(@"上");
    
    [HttpManager getMyLikeGoodsMoreListWithCompletionBlock:^(MyLikeGoodsList *goodsList)
     {
         NSMutableArray *array = _collectionDataArray[1];
         
         for (MyLikeGoods *goods in goodsList.goodsListArray)
         {
             [array addObject:goods];
         }
         
         [_collectionView.mj_footer endRefreshing];
         
         [_collectionView reloadData];
         
         self.myLikeGoodsCount = array.count;
     }];
}

#pragma mark -
#pragma mark -collectionView代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _collectionDataArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray *array = _collectionDataArray[1];

    if (section == 0)
    {
        if (array.count == 0)
        {
            return 2;
        }
        
        return 1;
    }
    
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *headerCellID = @"HeaderCell";
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
        static NSString *goodsCellID = @"GoodsCell";
        MyLikeGoodsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:goodsCellID forIndexPath:indexPath];
        
        MyLikeGoods *goods = [_collectionDataArray[1] objectAtIndex:indexPath.item];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:goods.picURL]];
        
        cell.priceLabel.text = [NSString stringWithFormat:@"¥%@", goods.price];
        
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.item == 0)
        {
            return CGSizeMake(self.view.width, 150);
        }
        else
        {
            return CGSizeMake(self.view.width, 180);
        }
    }
    
    return CGSizeMake(140, 140);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 1)
    {
        return UIEdgeInsetsMake(10, 15, 5, 15);
    }
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return NO;
    }
    return YES;
}

#pragma mark -Item被选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld,%ld",(long)indexPath.section,(long)indexPath.item);
    
    GoodsDetailViewController *goodsDetailVC = [[GoodsDetailViewController alloc]init];
    MyLikeGoods *goods = [_collectionDataArray[1] objectAtIndex:indexPath.item];
    goodsDetailVC.goodsID = goods.goodsID;
    goodsDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:goodsDetailVC animated:YES];
}


#pragma mark -
#pragma mark -创建headerView
- (UIView *)createAccountHeaderViewWithFrame:(CGRect)rect
{
    UIView *accountHeaderView = [[UIView alloc]initWithFrame:rect];
    accountHeaderView.sd_layout.widthIs(self.view.size.width);
    accountHeaderView.backgroundColor = [UIColor clearColor];
    accountHeaderView.clipsToBounds = YES;
    
    UIImageView *accountHeaderViewBgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xzzm_Shop_headerBg"]];
    accountHeaderViewBgImageView.frame = CGRectMake(0, 20, 20, 180);
    accountHeaderViewBgImageView.sd_layout.widthIs(self.view.size.width);
    [accountHeaderView addSubview:accountHeaderViewBgImageView];
    
    UIView *accountHeaderImageViewBgView = [[UIView alloc]initWithFrame:CGRectMake(self.view.centerX - accountHeaderImageViewCornerRadius - accountHeaderImageViewLineWidth, 40, (accountHeaderImageViewCornerRadius + accountHeaderImageViewLineWidth) * 2, (accountHeaderImageViewCornerRadius + accountHeaderImageViewLineWidth) * 2)];
    accountHeaderImageViewBgView.layer.cornerRadius = accountHeaderImageViewCornerRadius + accountHeaderImageViewLineWidth;
    accountHeaderImageViewBgView.clipsToBounds = YES;
    accountHeaderImageViewBgView.backgroundColor = [UIColor whiteColor];
    [accountHeaderView addSubview:accountHeaderImageViewBgView];
    
    UIImageView *accountHeaderImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xzzm_Me_headerPortrait"]];
    accountHeaderImageView.frame = CGRectMake(accountHeaderImageViewLineWidth, accountHeaderImageViewLineWidth, accountHeaderImageViewCornerRadius * 2, accountHeaderImageViewCornerRadius * 2);
    [accountHeaderImageViewBgView addSubview:accountHeaderImageView];
    
    _tipLabel = [[UILabel alloc]init];
    self.myLikeGoodsCount = 0;
    _tipLabel.textColor = [UIColor getSystemColor];
    _tipLabel.font = [UIFont systemFontOfSize:13];
    [accountHeaderView addSubview:_tipLabel];
    
    UIButton *accountSettingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [accountSettingButton setFrame:CGRectMake(self.view.width - 40 - 5, 30, 40, 40)];
    [accountSettingButton setImage:[UIImage imageNamed:@"xzzm_Me_setupBtn"] forState:UIControlStateNormal];
    [accountSettingButton addTarget:self action:@selector(setButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [accountHeaderView addSubview:accountSettingButton];
    
    return accountHeaderView;
}

- (void)setButtonClick:(UIButton *)sender
{
    AccountSettingViewController *settingVC = [[AccountSettingViewController alloc]init];
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)setMyLikeGoodsCount:(long int)myLikeGoodsCount
{
    _myLikeGoodsCount = myLikeGoodsCount;
    
    NSString *tipLabelText = [NSString stringWithFormat:@"我喜欢的商品(%ld)",_myLikeGoodsCount];
    CGRect tipLabelTextRect = [tipLabelText getRectWithSize:CGSizeMake(self.view.width, 0) WithSystemFontOfSize:13];
    
    _tipLabel.frame = CGRectMake(0, 110, tipLabelTextRect.size.width, tipLabelTextRect.size.height);
    _tipLabel.text = tipLabelText;
    _tipLabel.centerX = self.view.centerX;
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
