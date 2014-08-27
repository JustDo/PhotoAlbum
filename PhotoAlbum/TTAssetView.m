//
//  TTAssetView.m
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-24.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import "TTAssetView.h"

@implementation TTAssetView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithAsset:(ALAsset *)asset
{
    if (self = [super init]) {
        _asset = asset;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 75, 75)];
      
        imageView.image = [UIImage imageWithCGImage:[asset thumbnail]];
        [self addSubview:imageView];
        
        imageViewLayer = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 75, 75)];
        imageViewLayer.image = [UIImage imageNamed:@"TTThumbnailCheckMask"];
        imageViewLayer.hidden = YES;
        [self addSubview:imageViewLayer];
    }
    
    return self;
}

-(void)selectImage:(UITapGestureRecognizer *)tap
{
    _selected = !_selected;
    imageViewLayer.hidden = !_selected;
    
    if (_delegate && [_delegate respondsToSelector:@selector(thumbnailDidClick:)]) {
        [_delegate performSelector:@selector(thumbnailDidClick:) withObject:self];
    }
    
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
