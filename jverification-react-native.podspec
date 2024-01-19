require 'json'
pjson = JSON.parse(File.read('package.json'))

Pod::Spec.new do |s|

  s.name            = pjson['name']
  s.version         = pjson["version"]
  s.homepage        = pjson["homepage"]
  s.summary         = pjson["description"]
  s.license         = pjson["license"]
  s.author          = pjson["author"]
  
  s.ios.deployment_target = '11.0'

  s.source          = { :git => "https://github.com/jpush/jverification-react-native.git", :tag => "#{s.version}" }
  s.source_files    = 'ios/RCTJVerificationModule/*.{h,m}'
  s.preserve_paths  = "*.js"
  s.frameworks      = 'UIKit','CFNetwork','CoreFoundation','CoreTelephony','SystemConfiguration','CoreGraphics','Foundation','Security', 'AdSupport', 'CoreLocation','NetworkExtension', 'MobileCoreServices'
  s.libraries       = 'z','resolv', 'sqlite3', 'c++.1'
  s.vendored_libraries = "ios/RCTJVerificationModule/*.a"
  s.vendored_frameworks = ["ios/RCTJVerificationModule/OAuth_3Wang_SA_620.xcframework","ios/RCTJVerificationModule/EAccountApiSDK.framework","ios/RCTJVerificationModule/TYRZUISDK.xcframework"]
  s.dependency 'React'
end
