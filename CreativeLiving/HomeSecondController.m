//
//  HomeSecondController.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/25.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeSecondController.h"

@interface HomeSecondController()

{
    UICollectionView *_collectionView;
    
    NSMutableArray *_collectionDataArray;
    
    int _pageCount;
}

@end

@implementation HomeSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _pageCount = 0;
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc]init];
    [collectionViewLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [self.tipTitle isEqual: @"小编精选"] ? [[UICollectionView alloc] initWithFrame:CGRectMake(0, -10, self.view.width, self.view.height + 10) collectionViewLayout:collectionViewLayout] : [[UICollectionView alloc] initWithFrame:CGRectMake(0, 54, self.view.width, self.view.height - 54) collectionViewLayout:collectionViewLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[HomeSiftCollectionCell class] forCellWithReuseIdentifier:@"SiftCell"];
    [_collectionView registerClass:[HomeFourCollectionCell class] forCellWithReuseIdentifier:@"FourCell"];
    [_collectionView registerClass:[HomeFiveCollectionCell class] forCellWithReuseIdentifier:@"FiveCell"];
    
    EWNavigationBar *navigationBar = [self.tipTitle isEqual: @"小编精选"] ? [[EWNavigationBar alloc] initWithIsOpaque:NO WithView:self.view] : [[EWNavigationBar alloc] initWithTitle:self.tipTitle WithView:self.view];
    navigationBar.delegate = self;
    [self.view addSubview:navigationBar];
    
    
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

-(void)viewWillAppear:(BOOL)animated
{
    if (_collectionDataArray.count == 0)
    {
        [_collectionView.mj_header beginRefreshing];
    }
}

#pragma mark -
#pragma mark -刷新
- (void)loadNewData
{
    NSLog(@"下");
    
    _pageCount = 0;
    
    if ([self.tipTitle isEqual: @"小编精选"]){
        [HttpManager getNewHomeSiftWithID:[NSString stringWithFormat:@"%d",self.subjectID] WithPage:_pageCount WithCompletionBlock:^(HomeSift *homeSift) {
            
            _collectionDataArray = [[NSMutableArray alloc] initWithArray:homeSift.subjectListArray];
            
            [_collectionView.mj_header endRefreshing];
            
            [_collectionView reloadData];
            
        } WithFailedBlock:^(bool isFailed) {
            
            [_collectionView.mj_header endRefreshing];
            
        }];
        
    }else{
        
        [HttpManager getNewHomeOtherWithID:[NSString stringWithFormat:@"%d",self.subjectID] WithPage:_pageCount WithCompletionBlock:^(HomeOther *homeOther) {
            
            _collectionDataArray = [[NSMutableArray alloc] initWithArray:homeOther.shopListArray];
            
            [_collectionView.mj_header endRefreshing];
            
            [_collectionView reloadData];
            
        } WithFailedBlock:^(bool isFailed) {
            
            [_collectionView.mj_header endRefreshing];
            
        }];
    }
}

- (void)loadMoreData
{
    NSLog(@"上");
    
    ++_pageCount;
    
    if ([self.tipTitle isEqual: @"小编精选"]){
        [HttpManager getNewHomeSiftWithID:[NSString stringWithFormat:@"%d",self.subjectID] WithPage:_pageCount WithCompletionBlock:^(HomeSift *homeSift) {
            
            for (HomeSiftDetail *detail in homeSift.subjectListArray)
            {
                [_collectionDataArray addObject:detail];
            }
            
            [_collectionView.mj_footer endRefreshing];
            
            [_collectionView reloadData];
            
        } WithFailedBlock:^(bool isFailed) {
            
            [_collectionView.mj_footer endRefreshing];
            
        }];
        
    }else{
        
        [HttpManager getNewHomeOtherWithID:[NSString stringWithFormat:@"%d",self.subjectID] WithPage:_pageCount WithCompletionBlock:^(HomeOther *homeOther) {
            
            for (HomeOtherDetail *detail in homeOther.shopListArray)
            {
                [_collectionDataArray addObject:detail];
            }
            
            [_collectionView.mj_footer endRefreshing];
            
            [_collectionView reloadData];
            
        } WithFailedBlock:^(bool isFailed) {
            
            [_collectionView.mj_footer endRefreshing];
            
        }];
    }
}

#pragma mark -
#pragma mark -collectionView代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _collectionDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.tipTitle isEqual: @"小编精选"]) {
        
        static NSString *siftCellID = @"SiftCell";
        HomeSiftCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:siftCellID forIndexPath:indexPath];
        
        HomeSiftDetail *homeSiftDetail = _collectionDataArray[indexPath.item];
        
        [cell.bgImageView sd_setImageWithURL:[NSURL URLWithString:homeSiftDetail.picURL]];
        
        cell.titleLabel.text = homeSiftDetail.title;
        
        cell.dataLabel.text = [NSString stringWithFormat:@"（%@）",homeSiftDetail.subDate];
        
        return cell;
        
    }else{
        
        HomeOtherDetail *otherDetail = _collectionDataArray[indexPath.item];
        
        if (otherDetail.itemListArray.count == 4) {
            
            static NSString *fourCellID = @"FourCell";
            HomeFourCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:fourCellID forIndexPath:indexPath];
            
            [cell.headerView.shopHeaderImageView sd_setImageWithURL:[NSURL URLWithString:otherDetail.shop.shopPicURL]];
            cell.headerView.nameLabel.text = otherDetail.shop.name;
            cell.headerView.tipLabel.text = [NSString stringWithFormat:@"描述相符:%@  %@",otherDetail.shop.itemScore, [@"1" isEqualToString:otherDetail.shop.itemScoreType] ? @"高于同行" : [@"0" isEqualToString:otherDetail.shop.itemScoreType] ? @"与同行持平" : @"低于同行"];
            
            for (int i = 0; i < 4; i++)
            {
                EWButton *ewBtn = cell.buttonArray[i];
                OtherGoods *otherGoods = otherDetail.itemListArray[i];
                
                [ewBtn.bgImageView sd_setImageWithURL:[NSURL URLWithString:otherGoods.picURL]];
                ewBtn.priceLabel.text = [NSString stringWithFormat:@"￥%d",otherGoods.price];
                ewBtn.goodsID = [NSString stringWithFormat:@"%d",otherGoods.goodsID];
                ewBtn.delegate = self;
            }
            
            return cell;
            
        }else{
            
            static NSString *fiveCellID = @"FiveCell";
            HomeFiveCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:fiveCellID forIndexPath:indexPath];
            
            [cell.headerView.shopHeaderImageView sd_setImageWithURL:[NSURL URLWithString:otherDetail.shop.shopPicURL]];
            cell.headerView.nameLabel.text = otherDetail.shop.name;
            cell.headerView.tipLabel.text = [NSString stringWithFormat:@"描述相符:%@  %@",otherDetail.shop.itemScore, [@"1" isEqualToString:otherDetail.shop.itemScoreType] ? @"高于同行" : [@"0" isEqualToString:otherDetail.shop.itemScoreType] ? @"与同行持平" : @"低于同行"];
            
            for (int i = 0; i < 5; i++)
            {
                EWButton *ewBtn = cell.buttonArray[i];
                OtherGoods *otherGoods = otherDetail.itemListArray[i];
                
                [ewBtn.bgImageView sd_setImageWithURL:[NSURL URLWithString:otherGoods.picURL]];
                ewBtn.priceLabel.text = [NSString stringWithFormat:@"￥%d",otherGoods.price];
                ewBtn.goodsID = [NSString stringWithFormat:@"%d",otherGoods.goodsID];
                ewBtn.delegate = self;
            }
            
            return cell;
        }
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.tipTitle isEqual: @"小编精选"])
    {
        return CGSizeMake(self.view.width - 30, 182);
    }else{
        HomeOtherDetail *otherDetail = _collectionDataArray[indexPath.item];
        
        if (otherDetail.itemListArray.count == 4) {
            return CGSizeMake(self.view.width - 30, 260 + (self.view.width - 30) * 2 + (self.view.width - 40) / 2);
        }else{
            return CGSizeMake(self.view.width - 30, 250 + (self.view.width - 30) * 2);
        }
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 15, 5, 15);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark -Item被选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.tipTitle isEqual: @"小编精选"])
    {
        HomeSiftDetail *homeSiftDetail = _collectionDataArray[indexPath.item];
        
        HomeSecondController *homeSecondController = [[HomeSecondController alloc] init];
        
        homeSecondController.subjectID = homeSiftDetail.subjectID;
        homeSecondController.tipTitle = homeSiftDetail.title;
        
        [self.navigationController pushViewController:homeSecondController animated:YES];
        
    }else{
        HomeOtherDetail *otherDetail = _collectionDataArray[indexPath.item];
        
        ShopDetailViewController *shopDetailVC = [[ShopDetailViewController alloc]init];
        shopDetailVC.shopID = otherDetail.shop.shopID;
        [self.navigationController pushViewController:shopDetailVC animated:YES];
    }
}

#pragma mark -
#pragma mark -EWButton代理方法
- (void)EWButtonClick:(EWButton *)sender
{
    GoodsDetailViewController *goodsDetailVC = [[GoodsDetailViewController alloc]init];
    
    goodsDetailVC.goodsID = sender.goodsID;

    [self.navigationController pushViewController:goodsDetailVC animated:YES];
}

#pragma mark -
#pragma mark -导航返回方法
-(void)backButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
