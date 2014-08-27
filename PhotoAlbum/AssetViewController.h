//
//  AssetViewController.h
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-24.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>



@interface AssetViewController : UIViewController
{
    NSInteger imageAmount;
}
@property(assign,nonatomic) id delegate;

@property(strong,nonatomic)ALAssetsGroup *groupPhoto;
@property (strong, nonatomic) ALAssetsLibrary   *assetsLibrary;
@property (weak, nonatomic) IBOutlet UITableView *assetTable;
@property(strong,nonatomic) NSMutableArray *assetArray;
@property(strong,nonatomic) NSMutableArray *selectArray;

@end
