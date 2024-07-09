#
# Be sure to run `pod lib lint MYIOSAdsSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MYIOSAdsSDK'
  s.version          = '5.3.28'
  s.summary          = 'A short description of MYIOSAdsSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/shanghaimeiyue/MYIOSAdsSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shanghaimeiyue' => 'karl@edimob.com' }
  s.source           = { :git => 'https://github.com/shanghaimeiyue/MYIOSAdsSDK.git', :tag => s.version.to_s }
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.static_framework = true
#  s.source_files = 'MYIOSAdsSDK/Classes/**/*'
#  s.public_header_files = 'Pod/Classes/Headers/*.h'
  s.resources = 'MYIOSAdsSDK/Resources/*.bundle'
#  s.resource_bundles = {
#      'MYIOSAdsSDK' => ['MYIOSAdsSDK/Resources/*.bundle']
#  }
  
  s.frameworks = 'Accelerate', 'AdSupport', 'AppTrackingTransparency', 'AssetsLibrary', 'AudioToolbox', 'AVFoundation', 'AVKit', 'CoreData', 'CoreGraphics', 'CoreImage', 'CoreLocation', 'CoreMedia', 'CoreMotion', 'CoreServices', 'CoreTelephony', 'CoreText', 'DeviceCheck', 'EventKit', 'Foundation', 'ImageIO', 'JavaScriptCore', 'MapKit', 'MediaPlayer', 'MessageUI', 'MobileCoreServices', 'Photos', 'QuartzCore', 'QuickLook', 'SafariServices', 'Security', 'StoreKit', 'SystemConfiguration', 'UIKit', 'WebKit'
  
  s.vendored_frameworks = 'MYIOSAdsSDK/Frameworks/EdiMobSDK.framework','MYIOSAdsSDK/Frameworks/KSCrash.framework','MYIOSAdsSDK/Frameworks/MYAdsFramework.framework'
  
  s.libraries = 'bz2', 'c', 'c++', 'c++abi', 'iconv', 'resolv.9', 'sqlite3.0', 'sqlite3', 'xml2', 'z'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-ObjC' , '-all_load', '-ld64'], 'VALID_ARCHS[sdk=iphonesimulator*]' => '' }
  
  s.dependency 'Ads-Fusion-CN-Beta/BUAdSDK', '6.1.3.4'
  s.dependency 'Ads-Fusion-CN-Beta/CSJMediation', '6.1.3.4'
  s.dependency 'KSAdSDK', '3.3.66'
  s.dependency 'GDTMobSDK', '4.14.81'
  s.dependency 'JADYun', '2.6.0'
  s.dependency 'OctopusSDK', '1.6.0.5'
  s.dependency 'WechatOpenSDK_UnPay'
  s.dependency 'SDWebImage'
  s.dependency 'Masonry'
end
