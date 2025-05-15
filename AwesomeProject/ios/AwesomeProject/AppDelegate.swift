import UIKit
import React
import React_RCTAppDelegate
import ReactAppDependencyProvider

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  var reactNativeDelegate: ReactNativeDelegate?
  @objc var reactNativeFactory: RCTReactNativeFactory?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    let delegate = ReactNativeDelegate()
    let factory = RCTReactNativeFactory(delegate: delegate)
    delegate.dependencyProvider = RCTAppDependencyProvider()

    reactNativeDelegate = delegate
    reactNativeFactory = factory
    

    window = UIWindow(frame: UIScreen.main.bounds)
//    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//        print("延迟 2 秒执行")
////      let jsBundleLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle")
////      
////      let bridge = RCTBridge(bundleURL: jsBundleLocation, moduleProvider: nil, launchOptions: nil)
//      
////      let r = RCTRootView(bridge: reactNativeFactory!.bridge, moduleName: "customView1", initialProperties: nil)
//      let r = self.reactNativeFactory?.rootViewFactory.view(withModuleName: "customView2")
//      r?.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
//      self.window?.addSubview(r!)
//
////      RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
////                                                       moduleName:appName
////                                                initialProperties:props];
////      rootView.frame = CGRectMake(0, 0, self.view.width, 200);
//    }

    factory.startReactNative(
      withModuleName: "AwesomeProject",
      in: window,
      launchOptions: launchOptions
    )

    return true
  }
}

class ReactNativeDelegate: RCTDefaultReactNativeFactoryDelegate {
  override func sourceURL(for bridge: RCTBridge) -> URL? {
    self.bundleURL()
  }

  override func bundleURL() -> URL? {
#if DEBUG
    RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
#else
    Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
  }
}
