#
# Be sure to run `pod lib lint MYIOSAdsSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MYIOSAdsSDK'
  s.version          = '5.3.30.1'
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

  s.ios.deployment_target = '12.0'

  s.static_framework = true
  s.resources = 'MYIOSAdsSDK/Resources/*.bundle'
  s.vendored_frameworks = 'MYIOSAdsSDK/Frameworks/*.framework'
  
  #s.dependency 'Ads-Fusion-CN-Beta/BUAdSDK', '6.1.3.4'
  #s.dependency 'Ads-Fusion-CN-Beta/CSJMediation', '6.1.3.4'
  #s.dependency 'KSAdSDK', '3.3.66'
  #s.dependency 'GDTMobSDK', '4.14.81'
  #s.dependency 'JADYun', '2.6.0'
  #s.dependency 'OctopusSDK', '1.6.0.5'
  s.dependency 'WechatOpenSDK_UnPay'
  s.dependency 'SDWebImage'
  s.dependency 'Masonry'
end
