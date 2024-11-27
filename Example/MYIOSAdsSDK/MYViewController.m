//
//  MYViewController.m
//  MYIOSAdsSDK
//
//  Created by zhulonghaigit on 03/07/2024.
//  Copyright (c) 2024 zhulonghaigit. All rights reserved.
//

#import "MYViewController.h"
#import "MYAdsFramework/MYAdsFramework.h"
#import <EdiMobSDK/EdiMobSDK.h>

@interface MYViewController ()

@end

@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"sdkVersion - %@",[MYAdsConfiguration.shareInstance sdkVersion]);
    NSLog(@"sdkVersion - %@",[EMSDKConfig.shareInstance sdkVersion]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
