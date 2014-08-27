//
//  ViewController.h
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-24.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSMutableArray *_showArray;
}
- (IBAction)goTakePicture:(id)sender;
- (IBAction)toSelectPhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end
