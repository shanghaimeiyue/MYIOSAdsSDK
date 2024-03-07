//
//  MYNativeAd.h
//  MYAdsSDK
//
//  Created by Eric on 2021/5/4.
//  Copyright © 2021 King_liu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MYNativeAdDataObject;

@protocol MYNativeAdDelegate <NSObject>
/**
 * 拉取原生广告成功
 */
- (void)MY_nativeAdSuccessToDatas:(NSArray<__kindof MYNativeAdDataObject *> *)objects;

/**
 * 拉取原生广告失败
 */
- (void)MY_nativeAdFailToLoad:(NSError *)error;

@end

@interface MYNativeAd : NSObject

@property (nonatomic, weak) id<MYNativeAdDelegate> delegate;


/**
 *  构造方法
 *  详解：appId - 媒体 ID
 *      spaceId - 广告位 ID
 */
- (instancetype)initWithAppId:(NSString *)appId spaceId:(NSString *)spaceId;

/**
 * 拉取广告
 * @param count 广告条数
 *  详解：[必选]发起拉取广告请求,在获得广告数据后回调delegate
 *  最多十条
 */
- (void)MY_loadAd:(int)count;

@end


