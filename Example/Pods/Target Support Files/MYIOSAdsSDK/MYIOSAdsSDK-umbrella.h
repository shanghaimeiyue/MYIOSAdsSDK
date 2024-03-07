#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "GDTAdParams.h"
#import "GDTAdProtocol.h"
#import "GDTAdTestSetting.h"
#import "GDTBaseAdNetworkAdapterProtocol.h"
#import "GDTLoadAdParams.h"
#import "GDTLogoView.h"
#import "GDTMediaView.h"
#import "GDTNativeExpressAd.h"
#import "GDTNativeExpressAdNetworkAdapterProtocol.h"
#import "GDTNativeExpressAdNetworkConnectorProtocol.h"
#import "GDTNativeExpressAdView.h"
#import "GDTNativeExpressAdViewAdapterProtocol.h"
#import "GDTPrivacyConfiguration.h"
#import "GDTRewardVideoAd.h"
#import "GDTRewardVideoAdNetworkAdapterProtocol.h"
#import "GDTRewardVideoAdNetworkConnectorProtocol.h"
#import "GDTSDKConfig.h"
#import "GDTSDKDefines.h"
#import "GDTServerBiddingResult.h"
#import "GDTServerSideVerificationOptions.h"
#import "GDTSplashAd.h"
#import "GDTSplashAdNetworkAdapterProtocol.h"
#import "GDTSplashAdNetworkConnectorProtocol.h"
#import "GDTUnifiedBannerAdNetworkAdapterProtocol.h"
#import "GDTUnifiedBannerAdNetworkConnectorProtocol.h"
#import "GDTUnifiedBannerView.h"
#import "GDTUnifiedInterstitialAd.h"
#import "GDTUnifiedInterstitialAdNetworkAdapterProtocol.h"
#import "GDTUnifiedInterstitialAdNetworkConnectorProtocol.h"
#import "GDTUnifiedNativeAd.h"
#import "GDTUnifiedNativeAdDataObject.h"
#import "GDTUnifiedNativeAdNetworkAdapterProtocol.h"
#import "GDTUnifiedNativeAdNetworkConnectorProtocol.h"
#import "GDTUnifiedNativeAdView.h"
#import "GDTVideoAdReporter.h"
#import "GDTVideoConfig.h"
#import "MYAdsConfiguration.h"
#import "MYBannerView.h"
#import "MYInterstitialAd.h"
#import "MYNativeAd.h"
#import "MYNativeAdDataObject.h"
#import "MYNativeAdView.h"
#import "MYNativeExpressAd.h"
#import "MYNativeExpressAdView.h"
#import "MYRewardedVideoAd.h"
#import "MYRewardedVideoModel.h"
#import "MYSplashAd.h"

FOUNDATION_EXPORT double MYIOSAdsSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char MYIOSAdsSDKVersionString[];

