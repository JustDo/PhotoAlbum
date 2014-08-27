//
//  PhotoViewCell.h
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-30.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import "CustomViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface PhotoViewCell : CustomViewCell

@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *groupName;
-(void)updateGroupPhoto:(ALAssetsGroup *)groupPhoto;
@end
