//
//  SearchResultViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/3.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "SearchResultViewController.h"

@interface SearchResultViewController ()
{
    UICollectionView *_collectionView;
    
    NSMutableArray *_collectionDataArray;
    
    int _pageCount;
}
@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor SystemBgColor];
    
    EWNavigationBar *navigationBar = [[EWNavigationBar alloc]initWithTitle:self.navigationTitle WithView:self.view];
    navigationBar.delegate = self;
    [self.view addSubview:navigationBar];
    
    if (self.catID == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有找到匹配的宝贝~" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
        alertView.delegate = self;
        [alertView show];
    }else{
        
        UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc]init];
        [collectionViewLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 54, self.view.width, self.view.height - 54) collectionViewLayout:collectionViewLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        
        [_collectionView registerClass:[MyLikeGoodsCollectionCell class] forCellWithReuseIdentifier:@"Cell"];
        
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
    
    [HttpManager getGridDetailWithCatID:self.catID WithPage:_pageCount WithCompletionBlock:^(ShopGoods *goods) {
        _collectionDataArray = [[NSMutableArray alloc] initWithArray:goods.shopGoodsListArray];
        
        [_collectionView.mj_header endRefreshing];
        
        [_collectionView reloadData];
    } WithFailedBlock:^(bool isFailed) {
        [_collectionView.mj_header endRefreshing];
    }];
    
}

- (void)loadMoreData
{
    NSLog(@"上");
    
    ++_pageCount;
    
    [HttpManager getGridDetailWithCatID:self.catID WithPage:_pageCount WithCompletionBlock:^(ShopGoods *goods) {
        for (ShopGoodsDetail *detail in goods.shopGoodsListArray)
        {
            [_collectionDataArray addObject:detail];
        }
        
        [_collectionView.mj_footer endRefreshing];
        
        [_collectionView reloadData];
    } WithFailedBlock:^(bool isFailed) {
        [_collectionView.mj_footer endRefreshing];
    }];
}

#pragma mark -
#pragma mark -collectionView代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _collectionDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    ShopGoodsDetail *goodsDetail = [_collectionDataArray objectAtIndex:indexPath.item];
    
    MyLikeGoodsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:goodsDetail.picURL]];
    cell.priceLabel.text = goodsDetail.price;
    
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{    
    return CGSizeMake(90, 120);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 15, 5, 15);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsDetailViewController *goodsDetailVC = [[GoodsDetailViewController alloc]init];
    ShopGoodsDetail *goodsDetail = [_collectionDataArray objectAtIndex:indexPath.item];
    goodsDetailVC.goodsID = goodsDetail.ID;
    
    [self.navigationController pushViewController:goodsDetailVC animated:YES];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark-

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
