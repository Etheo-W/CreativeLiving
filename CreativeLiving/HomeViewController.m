//
//  HomeViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/10/30.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    UICollectionView *_collectionView;
    
    NSMutableArray *_collectionDataArray;
}

@end

@implementation HomeViewController

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
    
    [_collectionView registerClass:[HomeFirstCollectionCell class] forCellWithReuseIdentifier:@"FirstCell"];
    [_collectionView registerClass:[HomeSecondCollectionCell class] forCellWithReuseIdentifier:@"SecondCell"];
    
    
    MJRefreshNormalHeader *mjRefreshNormalHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    mjRefreshNormalHeader.lastUpdatedTimeLabel.hidden = YES;
    [mjRefreshNormalHeader setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];
    [mjRefreshNormalHeader setTitle:@"松开可以刷新" forState:MJRefreshStatePulling];
    [mjRefreshNormalHeader setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    _collectionView.mj_header = mjRefreshNormalHeader;

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
        
    [HttpManager getNewHomeWithCompletionBlock:^(HomeClassification *homeClassification) {
        
        _collectionDataArray = [[NSMutableArray alloc] initWithObjects:homeClassification.topListArray, homeClassification.otherListArray, nil];
        
        [_collectionView.mj_header endRefreshing];
        
        [_collectionView reloadData];
        
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
    if (section == 0) {
        
        NSMutableArray *firstArray = _collectionDataArray[0];
        
        return firstArray.count;
        
    }else{
        
        NSMutableArray *secondArray = _collectionDataArray[1];
        
        return secondArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *firstCellID = @"FirstCell";
        HomeFirstCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:firstCellID forIndexPath:indexPath];
        NSMutableArray *firstArray = _collectionDataArray[0];
        
        HomeClassificationDetail *detail = [firstArray objectAtIndex:indexPath.item];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:detail.picURL]];
        
        cell.titleLabel.text = detail.title;
        
        return cell;
    }else{
        static NSString *secondCellID = @"SecondCell";
        HomeSecondCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:secondCellID forIndexPath:indexPath];
        NSMutableArray *secondArray = _collectionDataArray[1];
        
        HomeClassificationDetail *detail = [secondArray objectAtIndex:indexPath.item];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:detail.picURL]];
        
        cell.titleLabel.text = detail.title;
        
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return CGSizeMake(self.view.width - 30, 182);
    }
    
    return CGSizeMake(140, 106);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 15, 15, 15);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark -Item被选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        NSMutableArray *firstArray = _collectionDataArray[0];
        
        HomeClassificationDetail *detail = [firstArray objectAtIndex:indexPath.item];
        
        TaoBaoViewController *webViewController = [[TaoBaoViewController alloc] init];
        webViewController.requestURL = detail.URL;
        webViewController.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:webViewController animated:YES];
        
    }else{
        
        HomeSecondController *homeSecondController = [[HomeSecondController alloc] init];
        
        NSMutableArray *secondArray = _collectionDataArray[1];
        
        HomeClassificationDetail *detail = [secondArray objectAtIndex:indexPath.item];
        
        homeSecondController.subjectID = detail.subjectID;
        homeSecondController.tipTitle = detail.title;
        homeSecondController.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:homeSecondController animated:YES];
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
