//
//  PhotoViewController.h
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-23.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface PhotoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
   
    NSMutableArray *_groupArray;
}
@property (weak, nonatomic) IBOutlet UITableView *photoTable;
@property (strong, nonatomic) ALAssetsLibrary *assetsLibrary;
@property(assign,nonatomic) id delegate;
@end
