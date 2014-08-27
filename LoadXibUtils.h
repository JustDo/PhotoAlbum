//
//  LoadXibUtils.h
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-24.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoadXibUtils : NSObject

+(id)loadViewFromCellName:(NSString *)xibName withFileOwner:(id)fileOwner;

+(id)loadViewFromXib:(NSString *)xibName;

@end
