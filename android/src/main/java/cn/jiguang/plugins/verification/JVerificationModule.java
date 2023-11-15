package cn.jiguang.plugins.verification;

import android.app.Activity;
import android.text.TextUtils;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.ImageButton;
import android.view.ViewGroup;

import com.facebook.react.ReactApplication;
import com.facebook.react.ReactRootView;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;

import org.json.JSONObject;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import cn.jiguang.plugins.verification.common.JConstans;
import cn.jiguang.plugins.verification.common.JLogger;
import cn.jiguang.verifysdk.api.AuthPageEventListener;
import cn.jiguang.verifysdk.api.JVerificationInterface;
import cn.jiguang.verifysdk.api.JVerifyUIConfig;
import cn.jiguang.verifysdk.api.PreLoginListener;
import cn.jiguang.verifysdk.api.PrivacyBean;
import cn.jiguang.verifysdk.api.RequestCallback;
import cn.jiguang.verifysdk.api.VerifyListener;

import android.view.Gravity;

import static android.view.ViewGroup.LayoutParams.MATCH_PARENT;
import static android.view.ViewGroup.LayoutParams.WRAP_CONTENT;

public class JVerificationModule extends ReactContextBaseJavaModule {

    private ReactApplicationContext reactContext;
    private JVerifyUIConfig.Builder builder;

    public JVerificationModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "JVerificationModule";
    }

    @ReactMethod
    public void setDebugMode(boolean enable){
        JVerificationInterface.setDebugMode(enable);
        JLogger.setLoggerEnable(enable);
    }

    @ReactMethod
    public void init(){
        JVerificationInterface.init(reactContext);
    }

    @ReactMethod
    public void init(ReadableMap readableMap, final Callback callback){
        int time = 10000;
        if(readableMap!=null){
            time = readableMap.hasKey(JConstans.TIME)?readableMap.getInt(JConstans.TIME):5000;
        }
        JVerificationInterface.init(reactContext,time, new RequestCallback<String>() {
            @Override
            public void onResult(int code, String content) {
                if(callback==null)return;
                callback.invoke(convertToResult(code,content));
            }
        });
    }

    @ReactMethod
    public void isInitSuccess(Callback callback){
        if(callback==null)return;
        callback.invoke(convertToResult(JVerificationInterface.isInitSuccess()));
    }

    @ReactMethod
    public void checkVerifyEnable(Callback callback){
        if(callback==null)return;
        callback.invoke(convertToResult(JVerificationInterface.checkVerifyEnable(reactContext)));
    }

    @ReactMethod
    public void checkVerifyEnable(boolean strictMode, Callback callback){
        if(callback==null)return;
        callback.invoke(convertToResult(JVerificationInterface.checkVerifyEnable(reactContext,strictMode)));
    }

    @ReactMethod
    public void getToken(int time, final Callback callback){
        JVerificationInterface.getToken(reactContext, time, new VerifyListener() {
            @Override
            public void onResult(int code, String content, String operator, final JSONObject operatorReturn) {
                if(callback==null)return;
                callback.invoke(convertToResult(code,content,operator));
            }
        });
    }

    @ReactMethod
    public void preLogin(int time,final  Callback callback){
        JVerificationInterface.preLogin(reactContext, time, new PreLoginListener() {
            @Override
            public void onResult(final int code, final String content, final JSONObject operatorReturn) {
                if(callback==null)return;
                callback.invoke(convertToResult(code,content));
            }
        });
    }

    @ReactMethod
    public void clearPreLoginCache(){
        JVerificationInterface.clearPreLoginCache();
    }

    @ReactMethod
    public void loginAuth(boolean enable){
        if(builder==null){
            builder = new JVerifyUIConfig.Builder();
        }
        JVerificationInterface.setCustomUIWithConfig(builder.build());
        JVerificationInterface.loginAuth(reactContext, enable, new VerifyListener() {
            @Override
            public void onResult(int code, String content, String operator, final JSONObject operatorReturn) {
                sendEvent(JConstans.LOGIN_EVENT,convertToResult(code,content,operator));
            }
        }, new AuthPageEventListener() {
            @Override
            public void onEvent(int code, String content) {
                sendEvent(JConstans.LOGIN_EVENT,convertToResult(code,content));
            }
        });
    }

    @ReactMethod
    public void dismissLoginAuthActivity(){
        reactContext.runOnUiQueueThread(new Runnable() {
            @Override
            public void run() {
                JVerificationInterface.dismissLoginAuthActivity();
            }
        });

    }

    @ReactMethod
    public void setCustomUIWithConfig(final ReadableMap readableMap, final ReadableArray readableArray){
        builder = null;        
        System.out.println("readableMap>>>:"+readableMap);
        convertToConfig(readableMap);
        reactContext.runOnUiQueueThread(new Runnable() {
            @Override
            public void run() {
                if(readableArray==null){
                    JLogger.w(JConstans.PARAMS_NULL);
                    return;
                }
                for (int i = 0;i<readableArray.size();i++){
                    if(builder==null){
                        builder = new JVerifyUIConfig.Builder();
                    }
                    ReactRootView view = convertToView(readableArray.getMap(i));
                    builder.addCustomView(view,false,null);
                }
            }
        });
    }
    // 获取验证码
    @ReactMethod
    public void getSmsCode(ReadableMap object, final Callback jsCallback) {
        System.out.println("object:"+object);
        String phoneNumber = "";
        String signID = "";
        String templateID = "";
        if (object != null) {
            phoneNumber = object.hasKey(JConstans.PHONE_NUMBER) ? object.getString(JConstans.PHONE_NUMBER):"18925247365";
            signID = object.hasKey(JConstans.SING_ID) ? object.getString(JConstans.SING_ID):"13649";
            templateID = object.hasKey(JConstans.TEMPLATE_ID) ? object.getString(JConstans.TEMPLATE_ID):"1";
        }
        JVerificationInterface.getSmsCode(reactContext, phoneNumber, signID, templateID, new RequestCallback<String>() {
            @Override
            public void onResult(int code, String msg) {
                if (jsCallback == null) return;
                WritableMap result = Arguments.createMap();
                result.putInt("code", code);
                if(code == 3000) {
                    result.putString("uuid", msg);
                    result.putString("msg", "");
                } else {
                    result.putString("uuid", "");
                    result.putString("msg", msg);
                }
                jsCallback.invoke(result);
            }
        });
    }
    // 设置前后两次获取验证码的时间间隔
    @ReactMethod
    public void setTimeWithConfig(int time){
        JVerificationInterface.setSmsIntervalTime(time);
    }

    private void sendEvent(String eventName, WritableMap params) {
        try {
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit(eventName, params);
        }catch (Throwable throwable){
            JLogger.e("sendEvent error:"+throwable.getMessage());
        }
    }

    private WritableMap convertToResult(boolean enable){
        WritableMap writableMap = Arguments.createMap();
        writableMap.putBoolean(JConstans.ENABLE,enable);
        return writableMap;
    }

    private WritableMap convertToResult(int code,String content){
        WritableMap writableMap = Arguments.createMap();
        writableMap.putInt(JConstans.CODE,code);
        writableMap.putString(JConstans.CONTENT,content);
        return writableMap;
    }

    private WritableMap convertToResult(int code,String content,String operator){
        WritableMap writableMap = Arguments.createMap();
        writableMap.putInt(JConstans.CODE,code);
        writableMap.putString(JConstans.CONTENT,content);
        writableMap.putString(JConstans.OPERATOR,operator);
        return writableMap;
    }

    private void convertToConfig(ReadableMap readableMap){
        if(builder==null){
            builder = new JVerifyUIConfig.Builder();
        }
        //背景图
        if(readableMap.hasKey(JConstans.BACK_GROUND_IMAGE)){
            builder.setAuthBGImgPath(readableMap.getString(JConstans.BACK_GROUND_IMAGE));
        }
        //状态栏
        if(readableMap.hasKey(JConstans.STATUS_BAR_HIDDEN)){
            builder.setStatusBarHidden(readableMap.getBoolean(JConstans.STATUS_BAR_HIDDEN));
        }
        if(readableMap.hasKey(JConstans.STATUS_BAR_MODE)){
            if(readableMap.getString(JConstans.STATUS_BAR_MODE).equals(JConstans.STATUS_BAR_MODE_LIGHT)){
                builder.setStatusBarDarkMode(false);
            }else if(readableMap.getString(JConstans.STATUS_BAR_MODE).equals(JConstans.STATUS_BAR_MODE_DARK)){
                builder.setStatusBarDarkMode(true);
            }else {
                builder.setStatusBarColorWithNav(true);
            }
        }
        //导航栏
        if(readableMap.hasKey(JConstans.NAV_HIDDEN)){
            builder.setNavHidden(readableMap.getBoolean(JConstans.NAV_HIDDEN));
        }
        if(readableMap.hasKey(JConstans.NAV_COLOR)){
            builder.setNavColor(readableMap.getInt(JConstans.NAV_COLOR));
        }
        if(readableMap.hasKey(JConstans.NAV_TITLE)){
            builder.setNavText(readableMap.getString(JConstans.NAV_TITLE));
        }
        if(readableMap.hasKey(JConstans.NAV_TITLE_SIZE)){
            builder.setNavTextSize(readableMap.getInt(JConstans.NAV_TITLE_SIZE));
        }
        if(readableMap.hasKey(JConstans.NAV_TITLE_COLOR)){
            builder.setNavTextColor(readableMap.getInt(JConstans.NAV_TITLE_COLOR));
        }
        if(readableMap.hasKey(JConstans.NAV_RETURN_BTN_HIDDEN)){
            builder.setNavReturnBtnHidden(readableMap.getBoolean(JConstans.NAV_RETURN_BTN_HIDDEN));
        }
        if(readableMap.hasKey(JConstans.NAV_RETURN_BTN_IMAGE)){
            builder.setNavReturnImgPath(readableMap.getString(JConstans.NAV_RETURN_BTN_IMAGE));
        }
        if(readableMap.hasKey(JConstans.NAV_RETURN_BTN_X)){
            builder.setNavReturnBtnOffsetX(dp2Pix(readableMap.getInt(JConstans.NAV_RETURN_BTN_X)));
        }
        if(readableMap.hasKey(JConstans.NAV_RETURN_BTN_Y)){
            builder.setNavReturnBtnOffsetY(dp2Pix(readableMap.getInt(JConstans.NAV_RETURN_BTN_Y)));
        }
        if(readableMap.hasKey(JConstans.NAV_RETURN_BTN_W)){
            builder.setNavReturnBtnWidth(dp2Pix(readableMap.getInt(JConstans.NAV_RETURN_BTN_W)));
        }
        if(readableMap.hasKey(JConstans.NAV_RETURN_BTN_H)){
            builder.setNavReturnBtnHeight(dp2Pix(readableMap.getInt(JConstans.NAV_RETURN_BTN_H)));
        }
        //logo
        if(readableMap.hasKey(JConstans.LOGO_HIDDEN)){
            builder.setLogoHidden(readableMap.getBoolean(JConstans.LOGO_HIDDEN));
        }
        if(readableMap.hasKey(JConstans.LOGO_IMAGE)){
            builder.setLogoImgPath(readableMap.getString(JConstans.LOGO_IMAGE));
        }
        if(readableMap.hasKey(JConstans.LOGO_X)){
            builder.setLogoOffsetX(dp2Pix(readableMap.getInt(JConstans.LOGO_X)));
        }
        if(readableMap.hasKey(JConstans.LOGO_Y)){
            builder.setLogoOffsetY(dp2Pix(readableMap.getInt(JConstans.LOGO_Y)));
        }
        if(readableMap.hasKey(JConstans.LOGO_W)){
            builder.setLogoWidth(dp2Pix(readableMap.getInt(JConstans.LOGO_W)));
        }
        if(readableMap.hasKey(JConstans.LOGO_H)){
            builder.setLogoHeight(dp2Pix(readableMap.getInt(JConstans.LOGO_H)));
        }
        //号码
        if(readableMap.hasKey(JConstans.NUMBER_SIZE)){
            builder.setNumberSize(readableMap.getInt(JConstans.NUMBER_SIZE));
        }
        if(readableMap.hasKey(JConstans.NUMBER_COLOR)){
            builder.setNumberColor(readableMap.getInt(JConstans.NUMBER_COLOR));
        }
        if(readableMap.hasKey(JConstans.NUMBER_X)){
            builder.setNumFieldOffsetX(dp2Pix(readableMap.getInt(JConstans.NUMBER_X)));
        }
        if(readableMap.hasKey(JConstans.NUMBER_Y)){
            builder.setNumFieldOffsetY(dp2Pix(readableMap.getInt(JConstans.NUMBER_Y)));
        }
        if(readableMap.hasKey(JConstans.NUMBER_W)){
            builder.setNumberFieldWidth(dp2Pix(readableMap.getInt(JConstans.NUMBER_W)));
        }
        if(readableMap.hasKey(JConstans.NUMBER_H)){
            builder.setNumberFieldHeight(dp2Pix(readableMap.getInt(JConstans.NUMBER_H)));
        }
        //slogan
        if(readableMap.hasKey(JConstans.SLOGAN_HIDDEN)){
            builder.setSloganHidden(readableMap.getBoolean(JConstans.SLOGAN_HIDDEN));
        }
        if(readableMap.hasKey(JConstans.SLOGAN_TEXT_SIZE)){
            builder.setSloganTextSize(readableMap.getInt(JConstans.SLOGAN_TEXT_SIZE));
        }
        if(readableMap.hasKey(JConstans.SLOGAN_TEXT_COLOR)){
            builder.setSloganTextColor(readableMap.getInt(JConstans.SLOGAN_TEXT_COLOR));
        }
        if(readableMap.hasKey(JConstans.SLOGAN_X)){
            builder.setSloganOffsetX(dp2Pix(readableMap.getInt(JConstans.SLOGAN_X)));
        }
        if(readableMap.hasKey(JConstans.SLOGAN_Y)){
            builder.setSloganOffsetY(dp2Pix(readableMap.getInt(JConstans.SLOGAN_Y)));
        }
        //登录按钮
        if(readableMap.hasKey(JConstans.LOGIN_BTN_TEXT)){
            builder.setLogBtnText(readableMap.getString(JConstans.LOGIN_BTN_TEXT));
        }
        if(readableMap.hasKey(JConstans.LOGIN_BTN_TEXT_SIZE)){
            builder.setLogBtnTextSize(readableMap.getInt(JConstans.LOGIN_BTN_TEXT_SIZE));
        }
        if(readableMap.hasKey(JConstans.LOGIN_BTN_TEXT_COLOR)){
            builder.setLogBtnTextColor(readableMap.getInt(JConstans.LOGIN_BTN_TEXT_COLOR));
        }
        if(readableMap.hasKey(JConstans.LOGIN_BTN_IMAGE_SELECTOR)){
            // TODO:
            JLogger.w("setLogBtnImgPath:"+readableMap.getString(JConstans.LOGIN_BTN_IMAGE_SELECTOR));
            builder.setLogBtnImgPath(readableMap.getString(JConstans.LOGIN_BTN_IMAGE_SELECTOR));
        }
        if(readableMap.hasKey(JConstans.LOGIN_BTN_X)){
            builder.setLogBtnOffsetX(dp2Pix(readableMap.getInt(JConstans.LOGIN_BTN_X)));
        }
        if(readableMap.hasKey(JConstans.LOGIN_BTN_Y)){
            builder.setLogBtnOffsetY(dp2Pix(readableMap.getInt(JConstans.LOGIN_BTN_Y)));
        }
        if(readableMap.hasKey(JConstans.LOGIN_BTN_W)){
            builder.setLogBtnWidth(dp2Pix(readableMap.getInt(JConstans.LOGIN_BTN_W)));
        }
        if(readableMap.hasKey(JConstans.LOGIN_BTN_H)){
            builder.setLogBtnHeight(dp2Pix(readableMap.getInt(JConstans.LOGIN_BTN_H)));
        }
        //协议
        if(readableMap.hasKey(JConstans.PRIVACY_ONE)){//过期 2.7.3+不生效
            ReadableArray array = readableMap.getArray(JConstans.PRIVACY_ONE);
            builder.setAppPrivacyOne(array.getString(0),array.getString(1));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_TWO)){//过期 2.7.3+不生效
            ReadableArray array = readableMap.getArray(JConstans.PRIVACY_TWO);
            builder.setAppPrivacyTwo(array.getString(0),array.getString(1));
        }
        if (readableMap.hasKey(JConstans.PRIVACY_NAME_AND_URL_BEANLIST)) {// since 273
            ReadableArray jsonArray = readableMap.getArray(JConstans.PRIVACY_NAME_AND_URL_BEANLIST);
            if(jsonArray!=null&&jsonArray.size()!=0){
                List<PrivacyBean> beanArrayList = new ArrayList<>();

                for (int i=0;i<jsonArray.size();i++){
                    ReadableMap jsonObject1 = jsonArray.getMap(i);
                    String name = jsonObject1.getString("name");
                    String url = jsonObject1.getString("url");
                    String beforeName = jsonObject1.getString("beforeName");
                    JLogger.d("setPrivacyNameAndUrlBeanList:"+beforeName+name+":"+url);
                    beanArrayList.add(new PrivacyBean(name!=null?name:"",url!=null?url:"",beforeName!=null?beforeName:""));
                }
                builder.setPrivacyNameAndUrlBeanList(beanArrayList);
            }
        }
        if(readableMap.hasKey(JConstans.PRIVACY_COLOR)){
            ReadableArray array = readableMap.getArray(JConstans.PRIVACY_COLOR);
            builder.setAppPrivacyColor(array.getInt(0),array.getInt(1));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_TEXT)){
            ReadableArray array = readableMap.getArray(JConstans.PRIVACY_TEXT);
            builder.setPrivacyText(array.getString(0),array.getString(1));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_TEXT_SIZE)){
            builder.setPrivacyTextSize(readableMap.getInt(JConstans.PRIVACY_TEXT_SIZE));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_W)){
            builder.setPrivacyTextWidth(dp2Pix(readableMap.getInt(JConstans.PRIVACY_W)));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_TEXT_GRAVITY_MODE)){
            if(readableMap.getString(JConstans.PRIVACY_TEXT_GRAVITY_MODE).equals(JConstans.PRIVACY_TEXT_GRAVITY_CENTER)){
                builder.setPrivacyTextCenterGravity(true);
            }else if(readableMap.getString(JConstans.PRIVACY_TEXT_GRAVITY_MODE).equals(JConstans.PRIVACY_TEXT_GRAVITY_LEFT)){
                builder.setPrivacyTextCenterGravity(false);
            }else {
                builder.setPrivacyTextCenterGravity(false);
            }
        }

        if (readableMap.hasKey(JConstans.EnableHintToast)){
           boolean show = readableMap.getBoolean(JConstans.EnableHintToast);
            if (show == true) {
                builder.enableHintToast(true,null);
            }
        }

        if(readableMap.hasKey(JConstans.PRIVACY_X)){
            builder.setPrivacyOffsetX(dp2Pix(readableMap.getInt(JConstans.PRIVACY_X)));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_Y)){
            builder.setPrivacyOffsetY(dp2Pix(readableMap.getInt(JConstans.PRIVACY_Y)));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_CHECKBOX_HIDDEN)){
            builder.setPrivacyCheckboxHidden(readableMap.getBoolean(JConstans.PRIVACY_CHECKBOX_HIDDEN));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_CHECKBOX_SIZE)){
            builder.setPrivacyCheckboxSize(readableMap.getInt(JConstans.PRIVACY_CHECKBOX_SIZE));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_CHECK_ENABLE)){
            builder.setPrivacyState(readableMap.getBoolean(JConstans.PRIVACY_CHECK_ENABLE));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_CHECKBOX_IMAGE)){
            builder.setCheckedImgPath(readableMap.getString(JConstans.PRIVACY_CHECKBOX_IMAGE));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_UNCHECKED_IMAGE)){
            builder.setUncheckedImgPath(readableMap.getString(JConstans.PRIVACY_UNCHECKED_IMAGE));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_BOOK_SYMBOL_ENABLE)){
            builder.setPrivacyWithBookTitleMark(readableMap.getBoolean(JConstans.PRIVACY_BOOK_SYMBOL_ENABLE));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_WEB_NAV_COLOR)){
            builder.setPrivacyNavColor(readableMap.getInt(JConstans.PRIVACY_WEB_NAV_COLOR));
        }
         if(readableMap.hasKey(JConstans.PRIVACY_WEB_NAV_TITLE_SIZE)){
             builder.setPrivacyNavTitleTextSize(readableMap.getInt(JConstans.PRIVACY_WEB_NAV_TITLE_SIZE));
         }
        if(readableMap.hasKey(JConstans.PRIVACY_WEB_NAV_TITLE_COLOR)){
            builder.setPrivacyNavTitleTextColor(readableMap.getInt(JConstans.PRIVACY_WEB_NAV_TITLE_COLOR));
        }
        if(readableMap.hasKey(JConstans.PRIVACY_WEB_NAV_RETURN_IMAGE)){
            try {
                String imageString = readableMap.getString(JConstans.PRIVACY_WEB_NAV_RETURN_IMAGE);
                Class drawable = R.drawable.class;
                Field field =drawable.getField(imageString);
                int imageID = field.getInt(field.getName());
                ImageView view = new ImageView(reactContext);
                view.setImageResource(imageID);
                builder.setPrivacyNavReturnBtn(view);
            }catch (Exception e){
                JLogger.e("setPrivacyWebNavReturnBtnImage error:"+e.getMessage());
            }
        }
        
        // 二级协议弹窗
        if (readableMap.hasKey(JConstans.PRIVACY_ENABLE_PRIVACY_CHHECK_DIALOG)) {
            Boolean enablePrivacyCheckDialog = readableMap.getBoolean(JConstans.PRIVACY_ENABLE_PRIVACY_CHHECK_DIALOG);
            builder.enablePrivacyCheckDialog(enablePrivacyCheckDialog);
        }

        if (readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_GRAVITY_MODE_CENTER)) {
            Boolean privacyCheckDialogGravityCenter = readableMap.getBoolean(JConstans.PRIVACY_CHHECK_DIALOG_GRAVITY_MODE_CENTER);
            if(privacyCheckDialogGravityCenter){
                builder.setprivacyCheckDialogGravity(Gravity.CENTER);
            }else{
                builder.setprivacyCheckDialogGravity(Gravity.BOTTOM);
            }
        }else{
            builder.setprivacyCheckDialogGravity(Gravity.BOTTOM);
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_OFFSET_X)){
            builder.setPrivacyCheckDialogOffsetX(dp2Pix(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_OFFSET_X)));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_OFFSET_Y)){
            builder.setPrivacyCheckDialogOffsetY(dp2Pix(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_OFFSET_Y)));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_WIDTH)){
            builder.setPrivacyCheckDialogWidth(dp2Pix(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_WIDTH)));
        }else{
            builder.setPrivacyCheckDialogWidth(WRAP_CONTENT);
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_HEIGHT)){
            builder.setPrivacyCheckDialogHeight(dp2Pix(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_HEIGHT)));
        }else{
            builder.setPrivacyCheckDialogHeight(WRAP_CONTENT);
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_TITLE_TEXT)){
            builder.setPrivacyCheckDialogTitleText(readableMap.getString(JConstans.PRIVACY_CHHECK_DIALOG_TITLE_TEXT));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_TITLE_TEXT_SIZE)){
            builder.setPrivacyCheckDialogTitleTextSize(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_TITLE_TEXT_SIZE));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_TITLE_TEXT_COLOR)){
            builder.setPrivacyCheckDialogTitleTextColor(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_TITLE_TEXT_COLOR));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_GRAVITY_MODE)){
            if(readableMap.getString(JConstans.PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_GRAVITY_MODE).equals(JConstans.PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_GRAVITY_LEFT)){
                builder.setPrivacyCheckDialogContentTextGravity(Gravity.LEFT);
            }else if(readableMap.getString(JConstans.PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_GRAVITY_MODE).equals(JConstans.PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_GRAVITY_CENTER)){
                builder.setPrivacyCheckDialogContentTextGravity(Gravity.CENTER);
            }else {
                builder.setPrivacyCheckDialogContentTextGravity(Gravity.CENTER);
            }
        }else {
            builder.setPrivacyCheckDialogContentTextGravity(Gravity.CENTER);
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_SIZE)){
            builder.setPrivacyCheckDialogContentTextSize(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_SIZE));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_TOP)){
            builder.setPrivacyCheckDialogLogBtnMarginT(dp2Pix(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_TOP)));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_BOTTOM)){
            builder.setPrivacyCheckDialogLogBtnMarginB(dp2Pix(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_BOTTOM)));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_LEFT)){
            builder.setPrivacyCheckDialogLogBtnMarginL(dp2Pix(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_LEFT)));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_IMG_PATH)){
            try {
                String imageString = readableMap.getString(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_IMG_PATH);
                if(!TextUtils.isEmpty(imageString)){
                    builder.setPrivacyCheckDialogLogBtnImgPath(imageString);
                }
            }catch (Exception e){
                JLogger.e("setPrivacyCheckDialogLogBtnImgPath error:"+e.getMessage());
            }
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_TEXT_COLOR)){
            builder.setPrivacyCheckDialoglogBtnTextColor(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_TEXT_COLOR));
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_WIDTH)){
            builder.setPrivacyCheckDialogLogBtnWidth(dp2Pix(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_WIDTH)));
        }else{
            builder.setPrivacyCheckDialogLogBtnWidth(WRAP_CONTENT);
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_HEIGHT)){
            builder.setPrivacyCheckDialogLogBtnHeight(dp2Pix(readableMap.getInt(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_HEIGHT)));
        }else{
            builder.setPrivacyCheckDialogLogBtnHeight(WRAP_CONTENT);
        }

        if(readableMap.hasKey(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_TEXT)){
            builder.setPrivacyCheckDialogLogBtnText(readableMap.getString(JConstans.PRIVACY_CHHECK_DIALOG_LOG_BTN_TEXT));
        }

        //  授权页动画
        if (readableMap.hasKey(JConstans.PRIVACY_NEED_START_ANIM)) {
            builder.setNeedStartAnim(readableMap.getBoolean(JConstans.PRIVACY_NEED_START_ANIM));
        }
        if (readableMap.hasKey(JConstans.PRIVACY_NEED_CLOSE_ANIM)) {
            builder.setNeedCloseAnim(readableMap.getBoolean(JConstans.PRIVACY_NEED_CLOSE_ANIM));
        }
        //  授权页弹窗模式
        if (readableMap.hasKey(JConstans.PRIVACY_DIALOG_THEME)) {
            ReadableArray array = readableMap.getArray(JConstans.PRIVACY_DIALOG_THEME);
            builder.setDialogTheme(array.getInt(0), array.getInt(1),array.getInt(2), array.getInt(3), array.getBoolean(4));
        }
        // 弹窗是否需要关闭
        if (readableMap.hasKey(JConstans.PRIVACY_NEED_CLOSE) && readableMap.hasKey(JConstans.PRIVACY_CLOSE_THEME)) {
            boolean needClose = readableMap.getBoolean(JConstans.PRIVACY_NEED_CLOSE);
            if(needClose) {
                //自定义返回按钮示例 
                ImageButton sampleReturnBtn = new ImageButton(reactContext);
                sampleReturnBtn.setImageResource(R.drawable.umcsdk_return_bg);
                RelativeLayout.LayoutParams returnLP = new RelativeLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                // 返回按钮样式
                ReadableArray array = readableMap.hasKey(JConstans.PRIVACY_CLOSE_THEME) ? readableMap.getArray(JConstans.PRIVACY_CLOSE_THEME) : null;
                returnLP.setMargins(array.getInt(0), array.getInt(1),array.getInt(2), array.getInt(3));
                sampleReturnBtn.setLayoutParams(returnLP);
                builder.addCustomView(sampleReturnBtn,true,null);
            }
        }

    }

    private ReactRootView convertToView(ReadableMap readableMap){
        String viewName = readableMap.hasKey(JConstans.CUSTOM_VIEW_NAME) ? readableMap.getString(JConstans.CUSTOM_VIEW_NAME) : "";
        ReadableArray viewPoint = readableMap.hasKey(JConstans.CUSTOM_VIEW_POINT) ? readableMap.getArray(JConstans.CUSTOM_VIEW_POINT) : null;
        JLogger.w("convertToView: viewName="+viewName);
        if (TextUtils.isEmpty(viewName)) {
            JLogger.e("viewName is null");
            return null;
        }
        ReactRootView reactView = new ReactRootView(reactContext);
        Activity currentActivity =  getCurrentActivity();
        if (currentActivity == null){
            JLogger.e("currentActivity is null");
            return  null;
        }
        ReactApplication application = (ReactApplication)currentActivity.getApplication();
        if (application == null){
            JLogger.e("application is null");
            return  null;
        }
        reactView.startReactApplication(application.getReactNativeHost().getReactInstanceManager(), viewName);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(RelativeLayout.LayoutParams.WRAP_CONTENT, RelativeLayout.LayoutParams.WRAP_CONTENT);
        if (viewPoint != null) {
            int x = dp2Pix(viewPoint.getInt(0));
            int y = dp2Pix(viewPoint.getInt(1));
            int w = dp2Pix(viewPoint.getInt(2));
            int h = dp2Pix(viewPoint.getInt(3));
            layoutParams.setMargins(x, y, 0, 0);
            layoutParams.width = w;
            layoutParams.height = h;
        }
        reactView.setLayoutParams(layoutParams);
        return reactView;
    }
    
    private int dp2Pix(float dp) {
        try {
            float density = reactContext.getApplicationContext().getResources().getDisplayMetrics().density;
            return (int) (dp * density + 0.5F);
        } catch (Exception e) {
            return (int) dp;
        }
    }

}