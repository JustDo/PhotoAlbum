//
//  PhotoViewController.m
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-23.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoViewCell.h"
#import "AssetViewController.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)toBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelButtonClick)];
    _groupArray = [[NSMutableArray alloc]init];
    [self selectPhoto];
    
}

-(void)cancelButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _groupArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"PhotoViewCell";
    PhotoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [PhotoViewCell loadFromNib:NSStringFromClass([PhotoViewCell class])];
    }
    ALAssetsGroup *group = _groupArray[indexPath.row];
    [cell updateGroupPhoto:group];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AssetViewController *photoView = [[AssetViewController alloc]initWithNibName:@"AssetViewController" bundle:nil];
    photoView.groupPhoto = _groupArray[indexPath.row];
    [self.navigationController pushViewController:photoView animated:YES];
}


-(void)selectPhoto
{
    _assetsLibrary  = [[ALAssetsLibrary alloc]init];
    [_assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group && [group numberOfAssets] > 0) {
            [_groupArray addObject:group];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_photoTable reloadData];
            });
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"访问失败");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
