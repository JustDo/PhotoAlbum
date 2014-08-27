//
//  CustomViewCell.m
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-30.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import "CustomViewCell.h"

@implementation CustomViewCell

- (void)awakeFromNib
{
    // Initialization code
}

+(id)loadFromNib:(NSString *)className
{
    return [[NSBundle mainBundle]loadNibNamed:className owner:self options:nil][0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
