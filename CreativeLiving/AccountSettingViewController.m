//
//  AccountSettingViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/10/31.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "AccountSettingViewController.h"
#import "FeedBackViewController.h"
#import "AboutViewController.h"

@interface AccountSettingViewController ()
{
    UITableView *_tableView;
    NSArray *_tableViewDataSourceArray;
    
}
@end

@implementation AccountSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableViewDataSourceArray = [[NSArray alloc]initWithObjects:@"意见反馈", @"清理本地缓存", @"关于", nil];
    
    EWNavigationBar *barView = [[EWNavigationBar alloc]initWithTitle:@"设置" WithView:self.view];
    barView.delegate = self;
    [self.view addSubview:barView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        UIImageView *cellBgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, cell.width - 20, 34)];
        cellBgImageView.image = [UIImage imageNamed:@"xzzm_Settings_aboutMessageBg"];
        [cell.contentView addSubview:cellBgImageView];
        
        UILabel *cellTipsLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 320, 36)];
        cellTipsLabel.tag = 1;
        cellTipsLabel.font = [UIFont systemFontOfSize:15];
        [cellBgImageView addSubview:cellTipsLabel];
    }
    
    NSString *cellTipsLabelText = _tableViewDataSourceArray[indexPath.row];
    
    UILabel *cellTipsLabel = (UILabel *)[cell viewWithTag:1];
    cellTipsLabel.text = cellTipsLabelText;
    
    if (indexPath.row != 1)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        FeedBackViewController *feedBackVC = [[FeedBackViewController alloc]init];
        [self.navigationController pushViewController:feedBackVC animated:YES];
    }
    else if (indexPath.row == 1)
    {
        [[SDImageCache sharedImageCache] cleanDiskWithCompletionBlock:^
        {
            [UIAlertView oneButtonAlertViewWithTitle:@"提示信息" WithMessage:@"清理缓存成功!" WithButtonTitle:@"关闭"];
        }];
    }
    else
    {
        AboutViewController *aboutVC = [[AboutViewController alloc]init];
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
}

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
