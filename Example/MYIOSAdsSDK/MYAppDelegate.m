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
#import "MYViewController.h"
#import "LogManager.h"

#define kScreenWidth [[UIApplication sharedApplication]keyWindow].bounds.size.width
#define kScreenHeight [[UIApplication sharedApplication]keyWindow].bounds.size.height

@interface MYAppDelegate ()<MYSplashAdDelegate>

@property (nonatomic, strong)MYSplashAd *splash;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIWindow *adWindow;

@end

@implementation MYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
//    Class view = NSClassFromString(@"MYViewController");
    MYViewController *vc = [[MYViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    [[MYAdsConfiguration shareInstance] initConfigurationWithAppId:MYMobAdsAppID];
    _splash = [[MYSplashAd alloc] initWithSpaceId:SplashID];
    _splash.fetchDelay = 10;
    _splash.delegate = self;
    _splash.zoomController = vc;
    _splash.customBottomView = self.bottomView;
    [_splash MY_loadAd];
    
    
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
    [_splash MY_showInWindow:self.adWindow withBottomView:self.bottomView];
}
- (void)MY_splashAdFailToPresent:(NSError *)error{
    NSLog(@"开屏无填充=====%@",error);
    [self rmoveAdWindow];
    self.splash = nil;
    self.splash.delegate = nil;
    NSString *err = error.description;
    [[LogManager shared] logToTextView:err];
}
- (void)MY_splashAdSuccessPresentScreen{
   NSLog(@"开屏广告加载成功");
}
- (void)MY_splashAdWillClose{
    NSLog(@"开屏广告即将关闭");
}
- (void)MY_splashAdClosed{
    NSLog(@"开屏广告关闭");
    [self rmoveAdWindow];
    self.splash = nil;
    self.splash.delegate = nil;
}
- (void)MY_splashAdClicked{
    NSLog(@"开屏广告点击");
}
- (void)MY_splashAdExposured{
    NSLog(@"开屏广告曝光");
}
- (void)MY_splashAdLifeTime:(NSUInteger)time{
    NSLog(@"开屏广告剩余时间：%lu",(unsigned long)time);
}

#pragma mark - lazy
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

#pragma mark - 懒加载
- (UIWindow *)adWindow {
    if (!_adWindow) {
        _adWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _adWindow.backgroundColor = [UIColor clearColor];
        _adWindow.windowLevel = UIWindowLevelStatusBar + 1;
        UIViewController *adViewController = [UIViewController new];
        adViewController.view.backgroundColor = [UIColor redColor];
        _adWindow.rootViewController = adViewController;
        _adWindow.hidden = NO;
    }
    return _adWindow;
}

- (void)rmoveAdWindow {
    if (_adWindow) {
        _adWindow.hidden = YES;
        _adWindow.windowLevel = UIWindowLevelStatusBar - 1;
        [_adWindow resignKeyWindow];
        [_adWindow removeFromSuperview];
        _adWindow = nil;
    }
}

@end
