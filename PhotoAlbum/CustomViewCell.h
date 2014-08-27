//
//  CustomViewCell.h
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-30.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewCell : UITableViewCell

+(id)loadFromNib:(NSString *)className;

@end
