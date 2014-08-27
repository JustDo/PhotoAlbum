//
//  AssetViewController.m
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-24.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import "AssetViewController.h"
#import "AssetViewCell.h"
#import "TTAssetView.h"
@interface AssetViewController ()
@end

@implementation AssetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleBordered target:self action:@selector(goToRootViewController)];
    _assetArray = [[NSMutableArray alloc]init];
    _selectArray = [[NSMutableArray alloc]init];
    [self getImages];
}
-(void)goToRootViewController
{
     NSMutableArray *workingArray = [[NSMutableArray alloc] init];
    for(TTAssetView *assetView in _selectArray)
    {
        ALAsset *asset =  assetView.asset;
       UIImage *image = [UIImage imageWithCGImage: [[asset defaultRepresentation]fullResolutionImage]];
        [workingArray addObject:image];
    }

    dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"imageCount" object:workingArray];
    });
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)getImages
{
    _assetsLibrary = [[ALAssetsLibrary alloc]init];
    [_groupPhoto enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (result) {
            TTAssetView *assetView = [[TTAssetView alloc]initWithAsset:result];
            assetView.delegate = self;
            [_assetArray addObject:assetView];
        }
      
         dispatch_async(dispatch_get_main_queue(), ^{
             [_assetTable reloadData];
         });
    }];
}



- (void)thumbnailDidClick:(TTAssetView *)ttAsset
{
    if (ttAsset.selected) {
        imageAmount ++ ;
        [_selectArray addObject:ttAsset];
    }else{
        imageAmount -- ;
        [_selectArray removeObject:ttAsset];
    }

    UILabel *label = (UILabel *)[self.view viewWithTag:1002];
    label.text = [NSString stringWithFormat:@"选择了%d张图片",imageAmount];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ceil([_groupPhoto numberOfAssets] / 4.0);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"AssetViewCell";
    AssetViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [AssetViewCell loadFromNib:NSStringFromClass([AssetViewCell class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSInteger rowCount = indexPath.row * 4;
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:4];
    for(NSInteger i = rowCount; i < _assetArray.count && i<rowCount+4; i++)
    {
        [array addObject:_assetArray[i]];
    }
    [cell updateArray:array];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 200, 30)];
    label.backgroundColor = [UIColor redColor];
    label.tag = 1002;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"请选择图片";
    return label;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
