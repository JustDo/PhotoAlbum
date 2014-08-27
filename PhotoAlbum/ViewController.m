//
//  ViewController.m
//  PhotoAlbum
//
//  Created by zhangpeng on 14-7-24.
//  Copyright (c) 2014年 zhangpeng. All rights reserved.
//

#import "ViewController.h"
#import "PhotoViewController.h"
#import "AlumNavigationController.h"
@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _showArray = [[NSMutableArray alloc]init];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alumNavigationImageAsset:) name:@"imageCount" object:nil];
}
-(void)alumNavigationImageAsset:(NSNotification *)assetNoti
{
    NSArray *array = assetNoti.object;
    NSLog(@"%ld",array.count);
    [_showArray addObjectsFromArray:array];
    
    if (_showArray) {

        float imageWidth = 65;
        float imageHeight = 75;
        float margin = 10;
        float topOffset = 85;
        NSUInteger lineCount = 4;
        
        for (int i = 0 ; i < [_showArray count] ; i++) {
            
            UIImageView * imageView = [[UIImageView alloc] initWithImage:[_showArray objectAtIndex:i]];
            imageView.layer.borderColor = [UIColor whiteColor].CGColor;
            imageView.layer.borderWidth = 1.0f;
            [imageView setFrame:CGRectMake((i%lineCount)*(imageWidth+margin)+margin+4,(i/lineCount)*(imageWidth+margin*2)+topOffset+8, imageWidth, imageHeight)];
     
            [imageView setContentMode:UIViewContentModeScaleAspectFill];
            [imageView setClipsToBounds:YES];
            [self.view addSubview:imageView];
        }
    }
}

- (IBAction)toSelectPhoto:(id)sender {
    PhotoViewController *photoView = [[PhotoViewController alloc]initWithNibName:@"PhotoViewController" bundle:nil];
    AlumNavigationController *alumNavigation = [[AlumNavigationController alloc]initWithRootViewController:photoView];
   
    [self presentViewController:alumNavigation animated:YES completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _imageview.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goTakePicture:(id)sender {
    UIImagePickerController *imagePick = [[UIImagePickerController alloc]init];
    imagePick.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePick.delegate = self;
    [self presentViewController:imagePick animated:YES completion:nil];
}
@end
