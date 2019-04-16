package cn.jpush.reactnativejvrification;

import android.Manifest;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;

import cn.jiguang.verifysdk.api.JVerificationInterface;
import cn.jiguang.verifysdk.api.JVerifyUIConfig;
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
    public void requestPermission(Callback permissionCallback) {
        if (AndroidUtils.checkPermission(getCurrentActivity(), REQUIRED_PERMISSIONS)) {
            doCallback(permissionCallback, CODE_PERMISSION_GRANTED, MSG_PERMISSION_GRANTED);
            return;
        }
        this.permissionCallback = permissionCallback;
        try {
            AndroidUtils.requestPermission(getCurrentActivity(), REQUIRED_PERMISSIONS);
            requestPermissionSended = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @ReactMethod
    public void setDebugMode(boolean enable) {
        JVerificationInterface.setDebugMode(enable);
    }

    @ReactMethod
    public void init() {
        JVerificationInterface.init(getCurrentActivity());
    }

    @ReactMethod
    public void checkVerifyEnable(Callback callback) {
        boolean isVerifyEnable = JVerificationInterface.checkVerifyEnable(getCurrentActivity());
        WritableMap map = Arguments.createMap();
        map.putBoolean("enable", isVerifyEnable);
        callback.invoke(map);
    }

    @ReactMethod
    public void getToken(final Callback callback) {
        JVerificationInterface.getToken(getCurrentActivity(), new VerifyListener() {
            @Override
            public void onResult(int code, String content, String operator) {
                doCallback(callback, code, content, operator);
            }
        });
    }

    @ReactMethod
    public void verifyNumber(ReadableMap map, final Callback callback) {
        String number = map.getString("number");
        String token = map.getString("token");

        JVerificationInterface.verifyNumber(getCurrentActivity(), token, number, new VerifyListener() {
            @Override
            public void onResult(int code, String content, String operator) {
                doCallback(callback, code, content, operator);
            }
        });
    }

    @ReactMethod
    public void loginAuth(final Callback callback) {
        JVerificationInterface.loginAuth(getCurrentActivity(), new VerifyListener() {
            @Override
            public void onResult(int code, String token, String operator) {
                doCallback(callback, code, token, operator);
            }
        });
    }

    @ReactMethod
    public void setCustomUIWithConfig(ReadableMap map) {
        JVerifyUIConfig uiConfig = convertMapToConfig(map);
        JVerificationInterface.setCustomUIWithConfig(uiConfig);
    }

    private JVerifyUIConfig convertMapToConfig(ReadableMap map) {
        int navColor = map.hasKey(JVerificationConstant.NAV_COLOR) ? map.getInt(JVerificationConstant.NAV_COLOR) : -16742704;
        String navText = map.hasKey(JVerificationConstant.NAV_TEXT) ? map.getString(JVerificationConstant.NAV_TEXT) : "登录";
        int navTextColor = map.hasKey(JVerificationConstant.NAV_TEXT_COLOR) ? map.getInt(JVerificationConstant.NAV_TEXT_COLOR) : -1;
        String navReturnImage = map.hasKey(JVerificationConstant.NAV_RETURN_IMAGE) ? map.getString(JVerificationConstant.NAV_RETURN_IMAGE) : "umcsdk_return_bg";
        boolean isLogoHidden = map.hasKey(JVerificationConstant.LOGO_HIDDEN) && map.getBoolean(JVerificationConstant.LOGO_HIDDEN);
        String logoImage = map.hasKey(JVerificationConstant.LOGO_Image) ? map.getString(JVerificationConstant.LOGO_Image) : null;
        int logoWidth = map.hasKey(JVerificationConstant.LOGO_Width) ? map.getInt(JVerificationConstant.LOGO_Width) : 70;
        int logoHeight = map.hasKey(JVerificationConstant.LOGO_Height) ? map.getInt(JVerificationConstant.LOGO_Height) : 70;
        int logoOffsetY = map.hasKey(JVerificationConstant.LOGO_OFFSET_Y) ? map.getInt(JVerificationConstant.LOGO_OFFSET_Y) : 50;
        int numColor = map.hasKey(JVerificationConstant.NUM_COLOR) ? map.getInt(JVerificationConstant.NUM_COLOR) : -16742704;
        int numOffsetY = map.hasKey(JVerificationConstant.NUM_OFFSET_Y) ? map.getInt(JVerificationConstant.NUM_OFFSET_Y) : 184;
        int sloganTextColor = map.hasKey(JVerificationConstant.SLOGAN_TEXT_COLOR) ? map.getInt(JVerificationConstant.SLOGAN_TEXT_COLOR) : -1;
        int sloganOffsetY = map.hasKey(JVerificationConstant.SLOGAN_OFFSET_Y) ? map.getInt(JVerificationConstant.SLOGAN_OFFSET_Y) : 224;
        String loginBtnText = map.hasKey(JVerificationConstant.LOGIN_BTN_TEXT) ? map.getString(JVerificationConstant.LOGIN_BTN_TEXT) : "本机号码一键登录";
        int loginBtnTextColor = map.hasKey(JVerificationConstant.LOGIN_BTN_TEXT_COLOR) ? map.getInt(JVerificationConstant.LOGIN_BTN_TEXT_COLOR) : -1;
        String loginBtnImage = map.hasKey(JVerificationConstant.LOGIN_BTN_IMAGE) ? map.getString(JVerificationConstant.LOGIN_BTN_IMAGE) : "umcsdk_login_btn_bg";
        int loginBtnOffsetY = map.hasKey(JVerificationConstant.LOGIN_BTN_OFFSET_Y) ? map.getInt(JVerificationConstant.LOGIN_BTN_OFFSET_Y) : 254;
        String privacyOneName = map.hasKey(JVerificationConstant.PRIVACY_ONE_NAME) ? map.getString(JVerificationConstant.PRIVACY_ONE_NAME) : null;
        String privacyOneUrl = map.hasKey(JVerificationConstant.PRIVACY_ONE_URL) ? map.getString(JVerificationConstant.PRIVACY_ONE_URL) : null;
        String privacyTwoName = map.hasKey(JVerificationConstant.PRIVACY_TWO_NAME) ? map.getString(JVerificationConstant.PRIVACY_TWO_NAME) : null;
        String privacyTwoUrl = map.hasKey(JVerificationConstant.PRIVACY_TWO_URL) ? map.getString(JVerificationConstant.PRIVACY_TWO_URL) : null;
        int privacyBasicColor = map.hasKey(JVerificationConstant.PRIVACY_BASIC_COLOR) ? map.getInt(JVerificationConstant.PRIVACY_BASIC_COLOR) : -10066330;
        int privacyProtocolColor = map.hasKey(JVerificationConstant.PRIVACY_PROTOCOL_COLOR) ? map.getInt(JVerificationConstant.PRIVACY_PROTOCOL_COLOR) : -16007674;
        int privacyOffsetY = map.hasKey(JVerificationConstant.PRIVACY_OFFSET_Y) ? map.getInt(JVerificationConstant.PRIVACY_OFFSET_Y) : 30;
        String checkImage = map.hasKey(JVerificationConstant.PRIVACY_CHECK_IMAGE) ? map.getString(JVerificationConstant.PRIVACY_CHECK_IMAGE) : "umcsdk_check_image";
        String unCheckImage = map.hasKey(JVerificationConstant.PRIVACY_UNCHECK_IMAGE) ? map.getString(JVerificationConstant.PRIVACY_UNCHECK_IMAGE) : "umcsdk_uncheck_image";

        return new JVerifyUIConfig.Builder()
                .setNavColor(navColor)
                .setNavText(navText)
                .setNavTextColor(navTextColor)
                .setNavReturnImgPath(navReturnImage)
                .setLogoHidden(isLogoHidden)
                .setLogoImgPath(logoImage)
                .setLogoWidth(logoWidth)
                .setLogoHeight(logoHeight)
                .setLogoOffsetY(logoOffsetY)
                .setNumberColor(numColor)
                .setNumFieldOffsetY(numOffsetY)
                .setSloganTextColor(sloganTextColor)
                .setSloganOffsetY(sloganOffsetY)
                .setLogBtnText(loginBtnText)
                .setLogBtnTextColor(loginBtnTextColor)
                .setLogBtnImgPath(loginBtnImage)
                .setLogBtnOffsetY(loginBtnOffsetY)
                .setAppPrivacyOne(privacyOneName, privacyOneUrl)
                .setAppPrivacyTwo(privacyTwoName, privacyTwoUrl)
                .setAppPrivacyColor(privacyBasicColor, privacyProtocolColor)
                .setPrivacyOffsetY(privacyOffsetY)
                .setCheckedImgPath(checkImage)
                .setUncheckedImgPath(unCheckImage)
                .build();
    }

    @Override
    public void onHostResume() {
        if (requestPermissionSended) {
            if (AndroidUtils.checkPermission(getCurrentActivity(), REQUIRED_PERMISSIONS)) {
                doCallback(permissionCallback, CODE_PERMISSION_GRANTED, MSG_PERMISSION_GRANTED);
            } else {
                doCallback(permissionCallback, ERR_CODE_PERMISSION, ERR_MSG_PERMISSION);
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

    private void doCallback(Callback callback, int code, String content) {
        WritableMap map = Arguments.createMap();
        map.putInt("code", code);
        map.putString("content", content);
        callback.invoke(map);
    }

    private void doCallback(Callback callback, int code, String content, String operator) {
        WritableMap map = Arguments.createMap();
        map.putInt("code", code);
        map.putString("content", content);
        map.putString("operator", operator);
        callback.invoke(map);
    }
}
