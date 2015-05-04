source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

inhibit_all_warnings!
use_frameworks!

#swift pods
pod 'Alamofire', '~> 1.2.1'
pod 'SwiftyJSON', '~> 2.2.0'
pod 'Kingfisher', '~> 1.3'

#objc pods
pod 'Google-Maps-iOS-SDK', '~> 1.9.2'

target :unit_tests, :exclusive => true do
  link_with 'UnitTests'
  pod 'Quick'
  pod 'Nimble'
end
