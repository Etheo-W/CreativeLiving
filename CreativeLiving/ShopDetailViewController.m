//
//  ShopDetailViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/5.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#define SDAutoLayoutIssueLog
#define shopHeaderImageViewCornerRadius 28
#define shopHeaderImageViewLineWidth 4


#import "ShopDetailViewController.h"
#import "SectionHeaderCollectionReusableView.h"

@interface ShopDetailViewController ()
{
    UICollectionView *_collectionView;
    NSMutableArray *_collectionDataArray;
    NSMutableArray *_collectionSectionDataArray;
    
    UIView *_followView;
}

@property (nonatomic, retain)ShopDetail *shopDetail;

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIView *shopHeaderView = [self createShopHeaderViewWithFrame:CGRectMake(0, 0, self.view.width, 200)];
    NSArray *collectionZoneDataArray = [NSArray arrayWithObjects:shopHeaderView, nil];
    
    _collectionDataArray = [[NSMutableArray alloc]initWithObjects:collectionZoneDataArray, nil];
    
    _collectionSectionDataArray = [[NSMutableArray alloc]initWithObjects:@"", nil];
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc]init];
    [collectionViewLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, -20, 320, self.view.height + 20) collectionViewLayout:collectionViewLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    EWNavigationBar *navigationBar = [[EWNavigationBar alloc]initWithIsOpaque:NO WithView:self.view];
    navigationBar.delegate = self;
    [self.view addSubview:navigationBar];
    
    _followView = [self createFollowShopView];
    [self.view addSubview:_followView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HeaderCell"];
    [_collectionView registerClass:[MyLikeGoodsCollectionCell class] forCellWithReuseIdentifier:@"GoodsCell"];
    [_collectionView registerClass:[SectionHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeader"];
    
    
    MJRefreshNormalHeader *mjRefreshNormalHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    mjRefreshNormalHeader.lastUpdatedTimeLabel.hidden = YES;
    [mjRefreshNormalHeader setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];
    [mjRefreshNormalHeader setTitle:@"松开可以刷新" forState:MJRefreshStatePulling];
    [mjRefreshNormalHeader setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    _collectionView.mj_header = mjRefreshNormalHeader;
    [_collectionView.mj_header beginRefreshing];
    
    MJRefreshAutoNormalFooter *mjRefreshAutoNormalFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    mjRefreshAutoNormalFooter.stateLabel.hidden = YES;
    _collectionView.mj_footer = mjRefreshAutoNormalFooter;
}



#pragma mark -
#pragma mark -刷新
- (void)loadNewData
{
    NSLog(@"下");
    
    [HttpManager getShopNewDetailWithShopID:self.shopID WithCompletionBlock:^(ShopDetail *shopDetail)
     {
         if (shopDetail.isFollow) {
             UIButton *btn = (UIButton*)[_followView viewWithTag:4];
             btn.selected = YES;
             
             [UIView beginAnimations:nil context:nil];
             [UIView setAnimationDuration:1];
             CGRect rect = _followView.frame;
             rect.origin.x = self.view.width - 33;
             _followView.frame = rect;
             [UIView commitAnimations];
             
         }
         
         for (int i = (int)_collectionDataArray.count - 1; i > 0; i--)
         {
             [_collectionDataArray removeObjectAtIndex:i];
         }
         
         [_collectionDataArray addObject:shopDetail.goodsListArray];
         
         for (int i = (int)_collectionSectionDataArray.count - 1; i > 0; i--)
         {
             [_collectionSectionDataArray removeObjectAtIndex:i];
         }
         
         [_collectionSectionDataArray addObject:shopDetail.dateName];
         
         [_collectionView.mj_header endRefreshing];
         
         [_collectionView reloadData];
         
         self.shopDetail = shopDetail;
     }];
}

- (void)loadMoreData
{
    NSLog(@"上");
    
    [HttpManager getShopMoreDetailWithShopID:self.shopID WithGoodsUpdateTime:self.shopDetail.listTime WithCompletionBlock:^(ShopDetail *shopDetail)
     {
         if (shopDetail.goodsListArray.count != 0)
         {
             [_collectionDataArray addObject:shopDetail.goodsListArray];
             
             [_collectionSectionDataArray addObject:shopDetail.dateName];
             
             self.shopDetail = shopDetail;
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
    NSMutableArray *array = _collectionDataArray[section];
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *headerCellID = @"HeaderCell";
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:headerCellID forIndexPath:indexPath];
        [cell.contentView addSubview:[_collectionDataArray[0] objectAtIndex:indexPath.item]];
        
        return cell;
    }
    else
    {
        static NSString *goodsCellID = @"GoodsCell";
        MyLikeGoodsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:goodsCellID forIndexPath:indexPath];
        
        GoodsOfThisShop *goods = [_collectionDataArray[indexPath.section] objectAtIndex:indexPath.item];
        
        
        cell.imageView.frame = CGRectMake(0, 0, cell.width, cell.width);
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:goods.picURL]];
        
        cell.priceLabel.text = [NSString stringWithFormat:@"¥%@", goods.price];
        cell.priceLabelView.sd_layout.rightSpaceToView(cell.contentView, 20).bottomSpaceToView(cell.contentView, 10);
        
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return CGSizeMake(self.view.width, 200);
    }
    else
    {
        GoodsOfThisShop *goods = [_collectionDataArray[indexPath.section] objectAtIndex:indexPath.item];
        if (goods.isBig)
        {
            return CGSizeMake(self.view.width - 20, self.view.width - 20);
        }
        else
        {
            return CGSizeMake(140, 140);
        }
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section != 0)
    {
        return UIEdgeInsetsMake(5, 10, 0, 10);
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


#pragma mark -设置区头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SectionHeaderCollectionReusableView *view = nil;
    
    if (indexPath.section != 0 && kind == UICollectionElementKindSectionHeader)
    {
        static NSString *sectionHeader = @"SectionHeader";
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionHeader forIndexPath:indexPath];
        view.dateNameLabel.text = _collectionSectionDataArray[indexPath.section];
    }
    
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section != 0)
    {
        return CGSizeMake(self.view.width, 30);
    }
    return CGSizeMake(0, 0);
}


#pragma mark -Item被选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld,%ld",(long)indexPath.section,(long)indexPath.item);
    
    GoodsDetailViewController *goodsDetailVC = [[GoodsDetailViewController alloc]init];
    GoodsOfThisShop *goods = [_collectionDataArray[indexPath.section] objectAtIndex:indexPath.item];
    goodsDetailVC.goodsID = goods.ID;
    [self.navigationController pushViewController:goodsDetailVC animated:YES];
}


#pragma mark -
#pragma mark -创建headerView
- (UIView *)createShopHeaderViewWithFrame:(CGRect)rect
{
    UIView *shopHeaderView = [[UIView alloc]initWithFrame:rect];
    shopHeaderView.backgroundColor = [UIColor clearColor];
    shopHeaderView.clipsToBounds = YES;
    
    UIImageView *shopHeaderViewBgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xzzm_Shop_headerBg"]];
    shopHeaderViewBgImageView.frame = CGRectMake(0, 20, self.view.width, 180);
    shopHeaderViewBgImageView.centerX = self.view.centerX;
    [shopHeaderView addSubview:shopHeaderViewBgImageView];
    
    UIView *shopHeaderImageViewBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, (shopHeaderImageViewCornerRadius + shopHeaderImageViewLineWidth) * 2, (shopHeaderImageViewCornerRadius + shopHeaderImageViewLineWidth) * 2)];
    shopHeaderImageViewBgView.layer.cornerRadius = shopHeaderImageViewCornerRadius + shopHeaderImageViewLineWidth;
    shopHeaderImageViewBgView.centerX = self.view.centerX;
    shopHeaderImageViewBgView.clipsToBounds = YES;
    shopHeaderImageViewBgView.backgroundColor = [UIColor whiteColor];
    [shopHeaderView addSubview:shopHeaderImageViewBgView];
    
    UIImageView *shopHeaderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(shopHeaderImageViewLineWidth, shopHeaderImageViewLineWidth, shopHeaderImageViewCornerRadius * 2, shopHeaderImageViewCornerRadius * 2)];
    shopHeaderImageView.tag = 1;
    [shopHeaderImageView sd_setImageWithURL:[NSURL URLWithString:self.shopDetail.shop.shopPicURL]];
    [shopHeaderImageViewBgView addSubview:shopHeaderImageView];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 113, self.view.width, 30)];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:18];
    nameLabel.tag = 2;
    nameLabel.centerX = self.view.centerX;
    [shopHeaderView addSubview:nameLabel];
    
    UIView *tipLabelBgView = [[UIView alloc]initWithFrame:CGRectMake(50, 150, self.view.width - 100, 16)];
    tipLabelBgView.backgroundColor = [UIColor whiteColor];
    tipLabelBgView.layer.cornerRadius = 8;
    tipLabelBgView.layer.masksToBounds = YES;
    [shopHeaderView addSubview:tipLabelBgView];
    
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, 0, tipLabelBgView.width - 44, 16)];
    tipLabel.textColor = [UIColor getSystemColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.tag = 3;
    [tipLabelBgView addSubview:tipLabel];
    
    return shopHeaderView;
}


#pragma mark -
#pragma mark -创建关注View
- (UIView *)createFollowShopView
{
    UIView *followView = [[UIView alloc]initWithFrame:CGRectMake(self.view.width - 95, self.view.height - 100, 95, 25)];
    
    UIButton *followButton = [UIButton buttonWithType:UIButtonTypeCustom];
    followButton.frame = CGRectMake(0, 0, 95, 25);
    followButton.tag = 4;
    [followButton setImage:[UIImage imageNamed:@"xzzm_Shop_follow"] forState:UIControlStateNormal];
    [followButton setImage:[UIImage imageNamed:@"xzzm_Shop_unFollow"] forState:UIControlStateSelected];
    [followButton addTarget:self action:@selector(followButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [followView addSubview:followButton];
    
    return followView;
}

- (void)followButtonClick:(UIButton *)sender
{
    UIView *view = [sender superview];
    if (sender.selected)
    {
        if (view.frame.origin.x > self.view.width - 60)
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            CGRect rect = view.frame;
            rect.origin.x = self.view.width - 95;
            view.frame = rect;
            [UIView commitAnimations];
        }
        else
        {
            [HttpManager unFollowShopWithShopID:self.shopID WithCompletionBlock:^(bool isSucess)
            {
                if (isSucess)
                {
                    sender.selected = NO;
                    
                }
            }];
        }
    }
    else
    {
        [HttpManager followShopWithShopID:self.shopID WithCompletionBlock:^(bool isSucess)
        {
            if (isSucess)
            {
                sender.selected = YES;
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                CGRect rect = view.frame;
                rect.origin.x = self.view.width - 33;
                view.frame = rect;
                [UIView commitAnimations];
            }
        }];
    }
}


#pragma mark -
#pragma mark -set方法
- (void)setShopDetail:(ShopDetail *)shopDetail
{
    _shopDetail = shopDetail;
    
    UIView *shopHeaderView = [_collectionDataArray[0] objectAtIndex:0];
    
    UIImageView *shopHeaderImageView = (UIImageView *)[shopHeaderView viewWithTag:1];
    [shopHeaderImageView sd_setImageWithURL:[NSURL URLWithString:shopDetail.shop.shopPicURL]];
    
    UILabel *nameLabel = (UILabel *)[shopHeaderView viewWithTag:2];
    nameLabel.text = shopDetail.shop.name;
    
    UILabel *tipLabel = (UILabel *)[shopHeaderView viewWithTag:3];
    tipLabel.text = [NSString stringWithFormat:@"描述相符:%@  %@",shopDetail.shop.itemScore, [@"1" isEqualToString:shopDetail.shop.itemScoreType] ? @"高于同行" : [@"0" isEqualToString:shopDetail.shop.itemScoreType] ? @"与同行持平" : @"低于同行"];
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
