#
# Be sure to run `pod lib lint PKJSON.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PKJSON'
  s.version          = '1.0.0'
  s.summary          = 'A swift json-object serialization/deserialization library'
  
  s.homepage         = 'https://github.com/plumk97/PKJSON'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'plumk97' => 'plumk97@outlook.com' }
  s.source           = { :git => 'https://github.com/zx1262111739/PKJSON.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = "5.0"
  
  s.default_subspec = 'Core'
  s.subspec 'Core' do |ss|
      ss.source_files = "Sources/**/*.swift"
  end
  
  s.subspec 'RxSwift' do |ss|
      ss.source_files = "Sources/**/*.swift"
      ss.dependency "RxRelay"
  end
  
end
