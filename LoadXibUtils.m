//
//  LoadXibUtils.m
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-24.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import "LoadXibUtils.h"

@implementation LoadXibUtils

+(id)loadViewFromCellName:(NSString *)xibName withFileOwner:(id)fileOwner
{
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:xibName owner:fileOwner options:nil];
    if (array && [array count]) {
        return array[0];
    }else
    {
        return nil;
    }
}

+(id)loadViewFromXib:(NSString *)xibName
{
    return [LoadXibUtils loadViewFromCellName:xibName withFileOwner:self];
}

@end
