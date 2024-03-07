#
# Be sure to run `pod lib lint MYIOSAdsSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MYIOSAdsSDK'
  s.version          = '0.1.0'
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
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shanghaimeiyue' => 'karl@edimob.com' }
  s.source           = { :git => 'git@github.com:shanghaimeiyue/MYIOSAdsSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.static_framework = true
  s.source_files = 'MYIOSAdsSDK/Classes/**/*'
  s.public_header_files = 'Pod/Classes/Headers/*.h'
  s.resource_bundles = {
      'MYIOSAdsSDK' => ['MYIOSAdsSDK/Resources/*.bundle']
  }
  
  s.frameworks = 'Accelerate', 'AdSupport', 'AppTrackingTransparency', 'AssetsLibrary', 'AudioToolbox', 'AVFoundation', 'AVKit', 'CoreData', 'CoreGraphics', 'CoreImage', 'CoreLocation', 'CoreMedia', 'CoreMotion', 'CoreServices', 'CoreTelephony', 'CoreText', 'DeviceCheck', 'EventKit', 'Foundation', 'ImageIO', 'JavaScriptCore', 'MapKit', 'MediaPlayer', 'MessageUI', 'MobileCoreServices', 'Photos', 'QuartzCore', 'QuickLook', 'SafariServices', 'Security', 'StoreKit', 'SystemConfiguration', 'UIKit', 'WebKit'
  
  s.vendored_frameworks = 'MYIOSAdsSDK/Frameworks/EdiMobSDK.framework',
  'MYIOSAdsSDK/Frameworks/KSAdSDK.xcframework',
  'MYIOSAdsSDK/Frameworks/KSCrash.framework',
  'MYIOSAdsSDK/Frameworks/WechatOpenSDK-XCFramework.xcframework'
  
  s.libraries = 'bz2', 'c', 'c++', 'c++abi', 'iconv', 'resolv.9', 'sqlite3.0', 'sqlite3', 'xml2', 'z'
  s.vendored_libraries = 'MYIOSAdsSDK/Frameworks/libMYAdsSDK.a', 'MYIOSAdsSDK/Frameworks/libGDTMobSDK.a'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => ['-ObjC' , '-all_load', '-ld64'] }
  
  s.dependency 'Ads-Fusion-CN-Beta','5.7.0.8', :subspecs => ['BUAdSDK', 'CSJMediation']
  
end
