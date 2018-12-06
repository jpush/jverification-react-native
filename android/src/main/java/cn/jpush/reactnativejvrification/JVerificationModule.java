package cn.jpush.reactnativejvrification;

import android.Manifest;
import android.util.Log;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;

import cn.jiguang.verifysdk.api.JVerificationInterface;
import cn.jiguang.verifysdk.api.VerifyListener;
import cn.jpush.reactnativejvrification.utils.AndroidUtils;

public class JVerificationModule extends ReactContextBaseJavaModule implements LifecycleEventListener {

    private static String TAG = "JVerificationModule";

    private static final int CODE_PERMISSION_GRANTED = 0;
    private static final String MSG_PERMISSION_GRANTED = "Permission is granted";
    private static final int ERR_CODE_PERMISSION = 1;
    private static final String ERR_MSG_PERMISSION = "Permission not granted";

    //"android.permission.READ_PHONE_STATE"
    private static final String[] REQUIRED_PERMISSIONS = new String[]{Manifest.permission.READ_PHONE_STATE};

    private boolean requestPermissionSended;
    private Callback permissionCallback;

    public JVerificationModule(ReactApplicationContext reactContext) {
        super(reactContext);
        reactContext.addLifecycleEventListener(this);
    }

    @Override
    public boolean canOverrideExistingModule() {
        return true;
    }

    @Override
    public String getName() {
        return "JVerificationModule";
    }

    @Override
    public void initialize() {
        super.initialize();
    }

    @ReactMethod
    public void setup(ReadableMap map) {
        JVerificationInterface.init(getCurrentActivity());
    }

    @ReactMethod
    public void requestPermission(Callback permissionCallback) {
        if (AndroidUtils.checkPermission(getCurrentActivity(), REQUIRED_PERMISSIONS)) {
            doCallback(permissionCallback,CODE_PERMISSION_GRANTED,MSG_PERMISSION_GRANTED);
            return;
        }
        this.permissionCallback = permissionCallback;
        Log.i(TAG,"requestPermission");
        try {
            AndroidUtils.requestPermission(getCurrentActivity(), REQUIRED_PERMISSIONS);
            requestPermissionSended = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @ReactMethod
    public void setDebug(boolean enable) {
        JVerificationInterface.setDebugMode(enable);
    }

    @ReactMethod
    public void getToken(final Callback callback) {
        JVerificationInterface.getToken(getCurrentActivity(), new VerifyListener() {
            @Override
            public void onResult(int code, String content, String operato) {
                doCallback(callback,code,content);
            }
        });
    }

    @ReactMethod
    public void verifyNumber(ReadableMap map,final Callback callback) {
        String number = map.getString("number");
        String token = map.getString("token");

        JVerificationInterface.verifyNumber(getCurrentActivity(), token, number, new VerifyListener() {
            @Override
            public void onResult(int code, String content, String operator) {
                doCallback(callback,code,content);
            }
        });
    }

    @Override
    public void onHostResume() {
        if (requestPermissionSended) {
            if (AndroidUtils.checkPermission(getCurrentActivity(), REQUIRED_PERMISSIONS)) {
                doCallback(permissionCallback,CODE_PERMISSION_GRANTED,MSG_PERMISSION_GRANTED);
            } else {
                doCallback(permissionCallback,ERR_CODE_PERMISSION,ERR_MSG_PERMISSION);
            }
        }
        requestPermissionSended = false;

    }

    @Override
    public void onHostPause() {

    }

    @Override
    public void onHostDestroy() {

    }

    private void doCallback(Callback callback, int code, String content){
        WritableMap map = Arguments.createMap();
        map.putInt("code",code);
        map.putString("content",content);
        callback.invoke(map);
    }
}
