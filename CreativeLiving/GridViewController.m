//
//  GridViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/10/30.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "GridViewController.h"
#import "SearchResultViewController.h"

@interface GridViewController ()
{
    UICollectionView *_collectionView;
    
    NSMutableArray *_collectionDataArray;
}
@end

@implementation GridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *gridHeaderView = [self createGridHeaderViewWithFrame:CGRectMake(0, 0, self.view.width, 64)];
    NSArray *tableZoneDataArray = [NSArray arrayWithObject:gridHeaderView];
    
    _collectionDataArray = [[NSMutableArray alloc]initWithObjects:tableZoneDataArray, nil];
    
    self.view.backgroundColor = [UIColor SystemBgColor];
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc]init];
    [collectionViewLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, -20, self.view.width, self.view.height + 20) collectionViewLayout:collectionViewLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HeaderCell"];
    [_collectionView registerClass:[gridCollectionCell class] forCellWithReuseIdentifier:@"gridCell"];
    [_collectionView registerClass:[SectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeaderView"];
}

-(void)viewWillAppear:(BOOL)animated
{
    if (_collectionDataArray.count <= 1)
    {
        [HttpManager getGridWithCompletionBlock:^(grid *item) {
            
            for (gridCatItem *catItem in item.catItemArray)
            {
                [_collectionDataArray addObject:catItem];
            }
            
            [_collectionView reloadData];
            
        } WithFailedBlock:^(bool isFailed) {}];
    }
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
        NSMutableArray *array = [_collectionDataArray objectAtIndex:section];
        
        return array.count;
    }else{
        gridCatItem *catItem = [_collectionDataArray objectAtIndex:section];
        
        return catItem.catArray.count;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *headerCellID = @"HeaderCell";
    static NSString *gridCellID = @"gridCell";
    
    if (indexPath.section == 0)
    {
        UICollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:headerCellID forIndexPath:indexPath];
        
        [cell.contentView addSubview:[_collectionDataArray[0] objectAtIndex:0]];
        
        return cell;
    }else{
        
        gridCollectionCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:gridCellID forIndexPath:indexPath];
        
        gridCatItem *catItem = [_collectionDataArray objectAtIndex:indexPath.section];
        gridCatItemCat *cat = [catItem.catArray objectAtIndex:indexPath.item];
        
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:cat.picURL]];
        
        cell.titleLabel.text = cat.catName;
        
        return cell;
    }
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0 && kind == UICollectionElementKindSectionHeader)
    {
        
        SectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeaderView" forIndexPath:indexPath];
        
        gridCatItem *catItem = [_collectionDataArray objectAtIndex:indexPath.section];
        
        headerView.titleLabel.text = catItem.catName;
        
        CGRect rect = headerView.titleLabel.frame;
        rect.size.width = catItem.catNameWidth;
        headerView.titleLabel.frame = rect;
        
        rect = headerView.bgImageView.frame;
        rect.size.width = catItem.catNameWidth + 10;
        headerView.bgImageView.frame = rect;
        
        return headerView;
    }
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section != 0)
    {
        return CGSizeMake(self.view.width, 22);
    }
    
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return CGSizeMake(self.view.width, 64);
    }
    
    return CGSizeMake(90, 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return section == 0 ? UIEdgeInsetsMake(0, 0, 0, 0) :UIEdgeInsetsMake(0, 10, 5, 10);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    gridCatItem *catItem = [_collectionDataArray objectAtIndex:indexPath.section];
    gridCatItemCat *cat = [catItem.catArray objectAtIndex:indexPath.item];
    
    SearchResultViewController *searchResultVC = [[SearchResultViewController alloc]init];
    searchResultVC.hidesBottomBarWhenPushed = YES;
    searchResultVC.catID = [NSString stringWithFormat:@"%d", cat.catID];
    searchResultVC.navigationTitle = cat.catName;
    [self.navigationController pushViewController:searchResultVC animated:YES];
}



#pragma mark -
#pragma mark -创建headerView
- (UIView *)createGridHeaderViewWithFrame:(CGRect)rect
{
    UIView *gridHeaderView = [[UIView alloc]initWithFrame:rect];
    gridHeaderView.backgroundColor = [UIColor clearColor];
    
    UIImageView *searchBgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 27, 300, 30)];
    searchBgImageView.tag = 1;
    searchBgImageView.image = [UIImage imageNamed:@"xzzm_Search_searchInputBg"];
    searchBgImageView.centerX = self.view.centerX;
    [gridHeaderView addSubview:searchBgImageView];
    
    UITextField *searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 27, 270, 30)];
    searchTextField.delegate = self;
    searchTextField.tag = 2;
    searchTextField.placeholder = @"搜索";
    searchTextField.centerX = self.view.centerX + 15;
    searchTextField.returnKeyType = UIReturnKeySearch;
    [gridHeaderView addSubview:searchTextField];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"xzzm_Search_searchButtonCancel.png"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.frame = CGRectMake(self.view.width - 60, 27, 45, 30);
    cancelButton.tag = 3;
    cancelButton.hidden = YES;
    [gridHeaderView addSubview:cancelButton];
    
    return gridHeaderView;
}

// return NO to disallow editing.
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    UIView *gridHeaderView = [textField superview];
    
    UIImageView *searchBgImageView = (UIImageView *)[gridHeaderView viewWithTag:1];
    searchBgImageView.width = 235;
    searchBgImageView.image = [UIImage imageNamed:@"xzzm_Search_searchInputBgRed"];
    
    textField.width = 205;
    
    UIButton *cancelButton = (UIButton *)[gridHeaderView viewWithTag:3];
    cancelButton.hidden = NO;
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64)];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = .5;
    view.tag = 4;
    [self.view addSubview:view];
    
    return YES;
}

// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    UIView *gridHeaderView = [textField superview];
    
    UIImageView *searchBgImageView = (UIImageView *)[gridHeaderView viewWithTag:1];
    
    UIButton *cancelButton = (UIButton *)[gridHeaderView viewWithTag:3];
    
    UIView *view = [self.view viewWithTag:4];
    [view removeFromSuperview];
    
    if (textField.text.length == 0)
    {
        cancelButton.hidden = YES;
        
        searchBgImageView.width = 300;
        searchBgImageView.image = [UIImage imageNamed:@"xzzm_Search_searchInputBg"];
        
        textField.width = 270;
    }
    
    return YES;
}

// called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""])
    {
        SearchResultViewController *searchResultVC = [[SearchResultViewController alloc]init];
        searchResultVC.hidesBottomBarWhenPushed = YES;
        searchResultVC.navigationTitle = textField.text;
        searchResultVC.catID = 0;
        [self.navigationController pushViewController:searchResultVC animated:YES];
    }
    
    return YES;
}

- (void)cancelButtonClick:(UIButton *)sender
{
    UIView *gridHeaderView = [sender superview];
    
    UIImageView *searchBgImageView = (UIImageView *)[gridHeaderView viewWithTag:1];
    
    UITextField *textField = (UITextField *)[gridHeaderView viewWithTag:2];
    
    UIButton *cancelButton = (UIButton *)[gridHeaderView viewWithTag:3];
    
    UIView *view = [self.view viewWithTag:4];
    
    cancelButton.hidden = YES;
    
    searchBgImageView.width = 300;
    searchBgImageView.image = [UIImage imageNamed:@"xzzm_Search_searchInputBg"];
    
    textField.width = 270;
    textField.text = @"";
    
    [view removeFromSuperview];
    
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
