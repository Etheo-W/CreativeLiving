//
//  ChannelViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/10/30.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "ChannelViewController.h"

@interface ChannelViewController ()
{
    UICollectionView *_collectionView;
    
    NSMutableArray *_collectionDataArray;
    
    int _pageCount;
}
@end

@implementation ChannelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor SystemBgColor];
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc]init];
    [collectionViewLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, -10, self.view.width, self.view.height + 10) collectionViewLayout:collectionViewLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[ChannelCollectionCell class] forCellWithReuseIdentifier:@"ChannelCell"];    
    
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
    
    [HttpManager getChannelWithPage:_pageCount WithCompletionBlock:^(Channel *channel) {
        _collectionDataArray = [[NSMutableArray alloc] initWithArray:channel.detailArray];
        
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
    
    [HttpManager getChannelWithPage:_pageCount WithCompletionBlock:^(Channel *channel) {
        for (ChannelDetail *detail in channel.detailArray)
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
    static NSString *channelCellID = @"ChannelCell";
    ChannelCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:channelCellID forIndexPath:indexPath];
    
    ChannelDetail *detail = [_collectionDataArray objectAtIndex:indexPath.item];
    
    cell.titleLabel.text = detail.itemGoods.title;
    cell.titleLabel.frame = CGRectMake(0, 7, self.view.width - 30, detail.itemGoods.titleHeight);
    
    cell.priceLabel1.text = [NSString stringWithFormat:@"￥%@", detail.itemGoods.disCountPrice];
    cell.priceLabel1.frame = CGRectMake(0, 15 + detail.itemGoods.titleHeight, self.view.width - 30, 20);
    
    cell.goodsImageView.frame = CGRectMake(0, 35 + detail.itemGoods.titleHeight, self.view.width - 30, self.view.width - 30);
    [cell.goodsImageView.bgImageView sd_setImageWithURL:[NSURL URLWithString:detail.itemGoods.picURL]];
    cell.goodsImageView.priceLabel.text = detail.itemGoods.config.leftTime;
    cell.goodsImageView.delegate = self;
    
    cell.priceMemoLabel.frame = CGRectMake(0, 5 + detail.itemGoods.titleHeight + self.view.width, self.view.width - 30, 20);
    cell.priceMemoLabel.text = detail.itemGoods.config.red;
    
    int height1 = 30 + detail.itemGoods.titleHeight + self.view.width;
    
    CGRect priceRect = cell.priceLabel2.frame;
    priceRect.origin.y = height1;
    cell.priceLabel2.frame = priceRect;
    cell.priceLabel2.text = [NSString stringWithFormat:@"%@元", detail.itemGoods.disCountPrice];
    
    CGRect button1Rect = cell.button1.frame;
    button1Rect.origin.y = height1;
    cell.button1.frame = button1Rect;
    cell.button1.URL = detail.itemGoods.config.couponURL;
    
    CGRect button2Rect = cell.button2.frame;
    button2Rect.origin.y = height1;
    cell.button2.frame = button2Rect;
    cell.button2.URL = detail.itemGoods.goodsID;
        
    if(detail.itemGoods.config.isEnding)
    {
        [cell.button1 setImage:[UIImage imageNamed:@"xzzbk_featured_getcoupon_gray"] forState:UIControlStateNormal];
        cell.button1.tag = 2;
        
        [cell.button2 setImage:[UIImage imageNamed:@"xzzbk_featured_overdue"] forState:UIControlStateNormal];
        cell.button2.tag = 2;
        
        cell.goodsImageView.priceLabelBgImageView.alpha = 0;
        cell.goodsImageView.goodsID = 0;
    }else{
        cell.goodsImageView.goodsID = detail.itemGoods.goodsID;
        cell.goodsImageView.priceLabelBgImageView.alpha = 1;
        if (detail.itemGoods.config.isPriceUp) {
            
            [cell.button1 setImage:[UIImage imageNamed:@"xzzbk_featured_priceup"] forState:UIControlStateNormal];
            
        }else{
            
            [cell.button1 setImage:[UIImage imageNamed:@"xzzbk_featured_getcoupon"] forState:UIControlStateNormal];
        }

        [cell.button2 setImage:[UIImage imageNamed:@"xzzbk_featured_opengood"] forState:UIControlStateNormal];
        
        cell.button1.tag = 1;
        cell.button2.tag = 1;
    }
    
    [cell.button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    
    int height2 = 60 + detail.itemGoods.titleHeight + self.view.width;
    
    CGRect timeRect = cell.timeLabel.frame;
    timeRect.origin.y = height2;
    cell.timeLabel.frame = timeRect;
    cell.timeLabel.text = detail.itemGoods.havedTime;
    
    CGRect sourceRect = cell.sourceLabel.frame;
    sourceRect.origin.y = height2;
    cell.sourceLabel.frame = sourceRect;
    cell.sourceLabel.text = detail.itemGoods.config.goodSource;
    
    int height3 = 80 + detail.itemGoods.titleHeight + self.view.width;
    CGRect lineRect = cell.lineView.frame;
    lineRect.origin.y = height3;
    cell.lineView.frame = lineRect;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChannelDetail *detail = [_collectionDataArray objectAtIndex:indexPath.item];
    int height = 85 + detail.itemGoods.titleHeight + self.view.width;
    
    return CGSizeMake(self.view.width - 30, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 15, 5, 15);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


- (void)button1Click:(EWURLButton *)sender
{
    if (sender.tag == 2)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"宝贝已下架，下次早点下手哦~" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        
    }else{
        TaoBaoViewController *webView = [[TaoBaoViewController alloc] init];
        webView.requestURL = sender.URL;
        webView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webView animated:YES];
    }
}

- (void)button2Click:(EWURLButton *)sender
{
    if (sender.tag == 2)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"宝贝已下架，下次早点下手哦~" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }else{
        TaoBaoViewController *webView = [[TaoBaoViewController alloc] init];
        webView.requestURL = [NSString stringWithFormat:@"http://www.xinzhuzhang.com/qianghuo/ProductServlet?id=%@", sender.URL];
        webView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webView animated:YES];
    }
}

- (void)EWImageViewTap:(EWImageView *)sender
{
    if (sender.goodsID == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"宝贝已下架，下次早点下手哦~" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }else{
        TaoBaoViewController *webView = [[TaoBaoViewController alloc] init];
        webView.requestURL = [NSString stringWithFormat:@"http://www.xinzhuzhang.com/qianghuo/ProductServlet?id=%@", sender.goodsID];
        webView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webView animated:YES];
    }
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
