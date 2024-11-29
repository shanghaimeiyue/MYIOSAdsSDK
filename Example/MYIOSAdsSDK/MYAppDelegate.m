//
//  MYAppDelegate.m
//  MYIOSAdsSDK
//
//  Created by zhulonghaigit on 03/07/2024.
//  Copyright (c) 2024 zhulonghaigit. All rights reserved.
//

#import "MYAppDelegate.h"
#import "MYAdsFramework/MYAdsFramework.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/ASIdentifierManager.h>

#define kScreenWidth [[UIApplication sharedApplication]keyWindow].bounds.size.width
#define kScreenHeight [[UIApplication sharedApplication]keyWindow].bounds.size.height

@interface MYAppDelegate ()<MYSplashAdDelegate>

@property (nonatomic, strong)MYSplashAd *splash;

@property (nonatomic, strong)UIImageView *splashImage;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UILabel *toastLab;

@end

@implementation MYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    Class view = NSClassFromString(@"MYViewController");
    UIViewController *vc = [[view alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    [[MYAdsConfiguration shareInstance] initConfigurationWithAppId:MYMobAdsAppID];
    _splash = [[MYSplashAd alloc] initWithSpaceId:SplashID];
    _splash.delegate = self;
    _splash.zoomController = nav; // 传入app的首页。
    /** 当需要设置自定义的BottomView时，必须先设置这个参数后再掉用load广告  */
    _splash.customBottomView = self.bottomView;
    [_splash MY_loadAd];
    [self.window addSubview:self.splashImage];
    
    self.toastLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.window.bounds.size.height - 150, self.window.bounds.size.width, 150)];
    self.toastLab.backgroundColor = [UIColor.redColor colorWithAlphaComponent:0.1];
    self.toastLab.textAlignment = NSTextAlignmentCenter;
    self.toastLab.font = [UIFont systemFontOfSize:20];
    self.toastLab.textColor = UIColor.blackColor;
    [self.window addSubview:self.toastLab];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            // 获取到权限后，依然使用老方法获取idfa
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
                [[MYAdsConfiguration shareInstance] setSDKIDFA:idfa];
            } else {
                //NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");
                [[MYAdsConfiguration shareInstance] setSDKIDFA:@""];
            }
        }];
    } else {
        // Fallback on earlier versions
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - delegate
- (void)MY_splashAdDidLoad {
    [_splash MY_showInWindow:self.window withBottomView:self.bottomView];
}
- (void)MY_splashAdFailToPresent:(NSError *)error{
    NSLog(@"开屏无填充=====%@",error);
    [self.splashImage removeFromSuperview];
}
- (void)MY_splashAdSuccessPresentScreen{
   NSLog(@"开屏广告加载成功");
    [self.splashImage removeFromSuperview];
}
- (void)MY_splashAdWillClose{
    NSLog(@"开屏广告即将关闭");
}
- (void)MY_splashAdClosed{
    NSLog(@"开屏广告关闭");
}
- (void)MY_splashAdClicked{
    NSLog(@"开屏广告点击");
    self.toastLab.text = @"开屏广告点击";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.toastLab.text = @"";
    });
}
- (void)MY_splashAdExposured{
    NSLog(@"开屏广告曝光");
}
- (void)MY_splashAdLifeTime:(NSUInteger)time{
    NSLog(@"开屏广告剩余时间：%lu",(unsigned long)time);
}

#pragma mark - lazy
- (UIImageView *)splashImage{
    if (!_splashImage) {
        _splashImage = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _splashImage.image = [UIImage imageNamed:@"LunchImage.jpeg"];
    }
    return _splashImage;
}
- (UIView *)bottomView {
    if (!_bottomView) {
        CGRect spRect = CGRectMake(0, 0, kScreenWidth, 120);
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
        label.text = @"MYMobAds";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:40];
        label.backgroundColor = [UIColor whiteColor];
        _bottomView = [[UIView alloc]initWithFrame:spRect];
        [_bottomView addSubview:label];
    }
    return _bottomView;
}

@end
