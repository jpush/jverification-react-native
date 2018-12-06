# Add JVerificationPackage

> your project/android/app/src…/MainApplication.java

```
// 需要 import JVerificationInterface 和 JVerificationPackage
import cn.jiguang.verifysdk.api.JVerificationInterface;
import cn.jpush.reactnativejvrification.JVerificationPackage;

public class MainApplication extends Application implements ReactApplication {


    private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {

        @Override
        public boolean getUseDeveloperSupport() {
            return BuildConfig.DEBUG;
        }


        @Override
        protected List<ReactPackage> getPackages() {
            return Arrays.<ReactPackage>asList(
                    new MainReactPackage(),
                    new JVerificationPackage()
            );
        }
    };

    @Override
    public ReactNativeHost getReactNativeHost() {
        return mReactNativeHost;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        SoLoader.init(this, false);
//        在 Init 之前调用，设置为 true，则会打印 debug 级别日志，否则只会打印 warning 级别以上的日志
//        JVerificationInterface.setDebugMode(true);
//        SDK 初始化建议在这进行
        JVerificationInterface.init(this);
    }
}
```





