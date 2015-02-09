platform :ios, '8.0'

inhibit_all_warnings!
use_frameworks!

#swift pods
pod 'Alamofire', '~> 1.1.4'
pod 'SwiftyJSON', '~> 2.1.3'

#objc pods
pod 'SDWebImage', '~> 3.7'

target :unit_tests, :exclusive => true do
  link_with 'UnitTests'
  pod 'Quick'
  pod 'Nimble'
end
