//
//  TTAssetView.h
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-24.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface TTAssetView : UIView
{
    UIImageView *imageViewLayer;
}
@property(assign,nonatomic) BOOL selected;
@property (assign, nonatomic) id delegate;
@property(strong,nonatomic)ALAsset *asset;
-(id)initWithAsset:(ALAsset *)asset;

@end
