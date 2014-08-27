//
//  PhotoViewCell.m
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-30.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import "PhotoViewCell.h"

@implementation PhotoViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)updateGroupPhoto:(ALAssetsGroup *)groupPhoto
{
    NSString *groupName = [groupPhoto valueForProperty:ALAssetsGroupPropertyName];
    NSInteger assertCount = [groupPhoto numberOfAssets];
    
    if ([groupName isEqualToString:@"Camera Roll"]) {
        groupName = @"相机胶卷";
    }else if([groupName isEqualToString:@"My Photo Stream"])
    {
        groupName = @"我的照片流";
    }
    
    _groupName.text = [NSString stringWithFormat:@"%@(%ld)",groupName,(long)assertCount];
    _postImage.image = [UIImage imageWithCGImage:[groupPhoto posterImage]];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
