//
//  AssetViewCell.m
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-30.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import "AssetViewCell.h"
#import "TTAssetView.h"
@implementation AssetViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)updateArray:(NSArray *)array
{
    CGRect rect = CGRectMake(0, 0, 75, 75);
    for(TTAssetView *assetView in array)
    {
        assetView.frame = rect;
        [self addSubview:assetView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:assetView action:@selector(selectImage:)];
        [assetView addGestureRecognizer:tapGesture];
        rect.origin.x = rect.origin.x + rect.size.width + 5;
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
