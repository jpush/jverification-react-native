//
//  RCTJVerificationModule.m
//  RCTJVerificationModule
//
//  Created by oshumini on 2018/11/5.
//  Copyright © 2018 HXHG. All rights reserved.
//

#import "RCTJVerificationModule.h"

#if __has_include(<React/RCTBridge.h>)
#import <React/RCTEventDispatcher.h>
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>
#elif __has_include("RCTBridge.h")
#import "RCTEventDispatcher.h"
#import "RCTRootView.h"
#import "RCTBridge.h"
#elif __has_include("React/RCTBridge.h")
#import "React/RCTEventDispatcher.h"
#import "React/RCTRootView.h"
#import "React/RCTBridge.h"
#endif

#import "JVERIFICATIONService.h"

#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation RCTJVerificationModule

RCT_EXPORT_MODULE();
@synthesize bridge = _bridge;

+ (id)allocWithZone:(NSZone *)zone {
  static RCTJVerificationModule *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [super allocWithZone:zone];
  });
  return sharedInstance;
}

- (id)init {
  self = [super init];
  return self;
}

RCT_EXPORT_METHOD(setDebug: (nonnull NSNumber *)enable) {
    [JVERIFICATIONService setDebug: [enable boolValue]];
}

RCT_EXPORT_METHOD(setupWithConfig: (NSDictionary *)params) {
  JVAuthConfig *config = [[JVAuthConfig alloc] init];
  if (params[@"appKey"]) {
    config.appKey = params[@"appKey"];
  }
  
  if (params[@"channel"]) {
    config.channel = params[@"channel"];
  }
  
  if (params[@"advertisingId"]) {
    config.advertisingId = params[@"advertisingId"];
  }
  
  if (params[@"advertisingId"]) {
    config.advertisingId = params[@"advertisingId"];
  }
  
  if (params[@"isProduction"]) {
    config.isProduction = [params[@"isProduction"] boolValue];
  }

  [JVERIFICATIONService setupWithConfig:config];
}

RCT_EXPORT_METHOD(checkVerifyEnable:(RCTResponseSenderBlock)callback){
    BOOL success = [JVERIFICATIONService checkVerifyEnable];
    if (callback) {
        callback(@[@{@"enable":@(success)}]);
    }
}

RCT_EXPORT_METHOD(getToken: (RCTResponseSenderBlock)callback) {
  
  [JVERIFICATIONService getToken:^(NSDictionary *result) {
      [self doResult:result callback:callback];
  }];
}

RCT_EXPORT_METHOD(verifyNumber: (NSDictionary *)params
                  callback: (RCTResponseSenderBlock)callback) {
  JVAuthEntity *entity = [[JVAuthEntity alloc] init];
  
  if (params[@"number"]) {
    entity.number = params[@"number"];
  }
  
  if (params[@"token"]) {
    entity.token = params[@"token"];
  }
  
  [JVERIFICATIONService verifyNumber:entity result:^(NSDictionary *result) {
      [self doResult:result callback:callback];
  }];
}

RCT_EXPORT_METHOD(customUIWithConfig: (NSDictionary *)params) {
    //移动
    JVMobileUIConfig *mobileUIConfig = [[JVMobileUIConfig alloc] init];
    //联通
    JVUnicomUIConfig *unicomUIConfig = [[JVUnicomUIConfig alloc] init];
    //电信
    JVTelecomUIConfig *telecomUIConfig = [[JVTelecomUIConfig alloc] init];
    
    
    mobileUIConfig.barStyle = 0;
    unicomUIConfig.barStyle = 0;
    telecomUIConfig.barStyle = 0;
    
    if(params[@"navColor"]){
        NSNumber *color = params[@"navColor"];
        UIColor *navColor =  UIColorFromRGBValue(color.integerValue);
        mobileUIConfig.navColor = navColor;
        unicomUIConfig.navColor = navColor;
        telecomUIConfig.navColor = navColor;
    }
    
    NSString *navTextString = @"登录";
    if(params[@"navText"]){
        navTextString = params[@"navText"];
    }
    UIColor *navTextColor = UIColorFromRGBValue(-1);
    if(params[@"navTextColor"]){
        NSNumber *color = params[@"navTextColor"];
        navTextColor =  UIColorFromRGBValue([color intValue]);
    }
    NSDictionary *navTextAttr = @{NSForegroundColorAttributeName:navTextColor};
    NSAttributedString *attr = [[NSAttributedString alloc]initWithString:navTextString attributes:navTextAttr];
    mobileUIConfig.navText = attr;
    unicomUIConfig.navText = attr;
    telecomUIConfig.navText = attr;
    
    if(params[@"navReturnImage"]){
        NSString *str = params[@"navReturnImage"];
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"JVerificationResource" ofType:@"bundle"];
        NSString *imageName =  [NSString stringWithFormat:@"%@.png",str];
        NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];
        UIImage *navReturnImage= [UIImage imageWithContentsOfFile:imagePath];
        mobileUIConfig.navReturnImg = navReturnImage;
        unicomUIConfig.navReturnImg = navReturnImage;
        telecomUIConfig.navReturnImg = navReturnImage;
    }
    
    if(params[@"logoHidden"]){
        BOOL hide =[params[@"logoHidden"] boolValue];
        mobileUIConfig.logoHidden = hide;
        unicomUIConfig.logoHidden = hide;
        telecomUIConfig.logoHidden = hide;
    }
    
    if(params[@"logoWidth"]){
        NSNumber *width = params[@"logoWidth"];
        CGFloat _logoWidth = [width floatValue];
        mobileUIConfig.logoWidth = _logoWidth;
        unicomUIConfig.logoWidth = _logoWidth;
        telecomUIConfig.logoWidth = _logoWidth;
    }
    
    if(params[@"logoHeight"]){
        NSNumber *height = params[@"logoHeight"];
        CGFloat _logoHeight= [height floatValue];
        mobileUIConfig.logoWidth = _logoHeight;
        unicomUIConfig.logoWidth = _logoHeight;
        telecomUIConfig.logoWidth = _logoHeight;
    }
    
    if(params[@"logoImage"]){
        NSString *str = params[@"logoImage"];
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"JVerificationResource" ofType:@"bundle"];
        NSString *imageName =  [NSString stringWithFormat:@"%@.png",str];
        NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];
        UIImage *logoImage= [UIImage imageWithContentsOfFile:imagePath];
        mobileUIConfig.logoImg = logoImage;
        unicomUIConfig.logoImg = logoImage;
        telecomUIConfig.logoImg = logoImage;
    }
    
    if(params[@"logoOffsetY"]){
        NSNumber *offset = params[@"logoOffsetY"];
        CGFloat _logoOffsetY= [offset floatValue];
        mobileUIConfig.logoOffsetY = _logoOffsetY;
        unicomUIConfig.logoOffsetY = _logoOffsetY;
        telecomUIConfig.logoOffsetY = _logoOffsetY;
    }
    
    if(params[@"numColor"]){
        NSNumber *color = params[@"navColor"];
        UIColor *numberColor =  UIColorFromRGBValue([color intValue]);
        mobileUIConfig.numberColor = numberColor;
        unicomUIConfig.numberColor = numberColor;
        telecomUIConfig.numberColor = numberColor;
    }
    
    if(params[@"numOffsetY"]){
        NSNumber *offset = params[@"numOffsetY"];
        CGFloat _numOffsetY= [offset floatValue];
        mobileUIConfig.numFieldOffsetY = _numOffsetY;
        unicomUIConfig.numFieldOffsetY = _numOffsetY;
        telecomUIConfig.numFieldOffsetY = _numOffsetY;
    }
    
    if(params[@"sloganTextColor"]){
        NSNumber *color = params[@"sloganTextColor"];
        UIColor *sloganTextColor =  UIColorFromRGBValue([color intValue]);
        mobileUIConfig.sloganTextColor = sloganTextColor;
        unicomUIConfig.sloganTextColor = sloganTextColor;
        telecomUIConfig.sloganTextColor = sloganTextColor;
    }
    
    if(params[@"sloganOffsetY"]){
        NSNumber *offset = params[@"sloganOffsetY"];
        CGFloat _sloganOffsetY= [offset floatValue];
        mobileUIConfig.sloganOffsetY = _sloganOffsetY;
        unicomUIConfig.sloganOffsetY = _sloganOffsetY;
        telecomUIConfig.sloganOffsetY = _sloganOffsetY;
    }
    
    if(params[@"loginBtnText"]){
        NSString *str = params[@"loginBtnText"];
        mobileUIConfig.logBtnText = str;
        unicomUIConfig.logBtnText = str;
        telecomUIConfig.logBtnText = str;
    }
    
    if(params[@"loginBtnTextColor"]){
        NSNumber *color = params[@"loginBtnTextColor"];
        UIColor *loginBtnTextColor =  UIColorFromRGBValue([color intValue]);
        mobileUIConfig.logBtnTextColor = loginBtnTextColor;
        unicomUIConfig.logBtnTextColor = loginBtnTextColor;
        telecomUIConfig.logBtnTextColor = loginBtnTextColor;
    }
    
    NSString *normalImageStr = nil;
    if(params[@"loginBtnNormalImage"]){
        normalImageStr = params[@"loginBtnNormalImage"];
    }
    NSString *pressedlImageStr = nil;
    if(params[@"loginBtnPressedImage"]){
        pressedlImageStr = params[@"loginBtnPressedImage"];
    }
    NSString *unableImageStr = nil;
    if(params[@"loginBtnUnableImage"]){
        unableImageStr = params[@"loginBtnUnableImage"];
    }
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"JVerificationResource" ofType:@"bundle"];
    UIImage *loginBtnNormalImage= [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",normalImageStr]]];
    UIImage *loginBtnPressedImage= [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",pressedlImageStr]]];
    UIImage *loginBtnUnableImage= [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",unableImageStr]]];
    
    NSArray * images =[[NSArray alloc]initWithObjects:loginBtnNormalImage,loginBtnUnableImage,loginBtnPressedImage,nil];
    mobileUIConfig.logBtnImgs = images;
    unicomUIConfig.logBtnImgs = images;
    telecomUIConfig.logBtnImgs = images;
    
    
    if(params[@"loginBtnOffsetY"]){
        NSNumber *offset = params[@"loginBtnOffsetY"];
        CGFloat _loginBtnOffsetY= [offset floatValue];
        mobileUIConfig.logBtnOffsetY = _loginBtnOffsetY;
        unicomUIConfig.logBtnOffsetY = _loginBtnOffsetY;
        telecomUIConfig.logBtnOffsetY = _loginBtnOffsetY;
    }
    
    NSString *privacyOneName = @"应用自定义服务条款1";
    if(params[@"privacyOneName"]){
        privacyOneName = params[@"privacyOneName"];
    }
    NSString *privacyOneUrl = @"https://www.jiguang.cn/about";
    if(params[@"privacyOneUrl"]){
        privacyOneUrl = params[@"privacyOneUrl"];
    }
    mobileUIConfig.appPrivacyOne = @[privacyOneName,privacyOneUrl];
    unicomUIConfig.appPrivacyOne = @[privacyOneName,privacyOneUrl];
    telecomUIConfig.appPrivacyOne = @[privacyOneName,privacyOneUrl];
    
    NSString *privacyTwoName = @"应用自定义服务条款2";
    if(params[@"privacyTwoName"]){
        privacyTwoName = params[@"privacyTwoName"];
    }
    NSString *privacyTwoUrl = @"https://www.jiguang.cn/about";
    if(params[@"privacyTwoUrl"]){
        privacyOneUrl = params[@"privacyTwoUrl"];
    }
    mobileUIConfig.appPrivacyTwo = @[privacyTwoName,privacyTwoUrl];
    unicomUIConfig.appPrivacyTwo = @[privacyTwoName,privacyTwoUrl];
    telecomUIConfig.appPrivacyTwo = @[privacyTwoName,privacyTwoUrl];
    
    UIColor *privacyBasicColor = [UIColor grayColor];
    if(params[@"privacyBasicColor"]){
        NSNumber *color = params[@"privacyBasicColor"];
        privacyBasicColor =  UIColorFromRGBValue([color intValue]);
    }
    UIColor *privacyProtocolColor = [UIColor blackColor];
    if(params[@"privacyProtocolColor"]){
        NSNumber *color = params[@"privacyProtocolColor"];
        privacyProtocolColor =  UIColorFromRGBValue([color intValue]);
    }
    mobileUIConfig.appPrivacyColor = @[privacyBasicColor,privacyProtocolColor];
    unicomUIConfig.appPrivacyColor = @[privacyBasicColor,privacyProtocolColor];
    telecomUIConfig.appPrivacyColor = @[privacyBasicColor,privacyProtocolColor];
    
    if(params[@"privacyCheckImage"]){
        NSString *str = params[@"privacyCheckImage"];
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"JVerificationResource" ofType:@"bundle"];
        NSString *imageName =  [NSString stringWithFormat:@"%@.png",str];
        NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];
        UIImage *privacyCheckImage= [UIImage imageWithContentsOfFile:imagePath];
        
        mobileUIConfig.checkedImg = privacyCheckImage;
        unicomUIConfig.checkedImg = privacyCheckImage;
        telecomUIConfig.checkedImg = privacyCheckImage;
    }
    
    if(params[@"privacyUncheckImage"]){
        NSString *str = params[@"privacyUncheckImage"];
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"JVerificationResource" ofType:@"bundle"];
        NSString *imageName =  [NSString stringWithFormat:@"%@.png",str];
        NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];
        UIImage *privacyUncheckImage= [UIImage imageWithContentsOfFile:imagePath];
        
        mobileUIConfig.uncheckedImg = privacyUncheckImage;
        unicomUIConfig.uncheckedImg = privacyUncheckImage;
        telecomUIConfig.uncheckedImg = privacyUncheckImage;
    }
    
    if(params[@"privacyOffsetY"]){
        NSNumber *offset = params[@"privacyOffsetY"];
        CGFloat _privacyOffsetY= [offset floatValue];
        mobileUIConfig.privacyOffsetY = _privacyOffsetY;
        unicomUIConfig.privacyOffsetY = _privacyOffsetY;
        telecomUIConfig.privacyOffsetY = _privacyOffsetY;
    }
    
    [JVERIFICATIONService customUIWithConfig:mobileUIConfig customViews:^(UIView *customAreaView) {}];
    [JVERIFICATIONService customUIWithConfig:unicomUIConfig customViews:^(UIView *customAreaView) {}];
    [JVERIFICATIONService customUIWithConfig:telecomUIConfig customViews:^(UIView *customAreaView) {}];
}

RCT_EXPORT_METHOD(getAuthorizationWithController: (RCTResponseSenderBlock)callback) {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *vc =[self getPresentedViewController];
        [JVERIFICATIONService getAuthorizationWithController:vc completion:^(NSDictionary *result) {
            //callback(@[result]);
            [self doResult:result callback:callback];
        }];
    });
}

- (UIViewController *)getPresentedViewController{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

-(void)doResult:(NSDictionary *)result callback:(RCTResponseSenderBlock)callback{
    NSInteger code = -9999;
    NSString *content = nil;
    NSString *operator = nil;
    if(result[@"code"]){
        code = [result[@"code"] integerValue];
    }
    if(result[@"token"]){
        content = result[@"token"];
    }
    if(result[@"content"]){
        content = result[@"content"];
    }
    if(result[@"operator"]){
        operator = result[@"operator"];
    }
    callback(@[@{@"code":@(code),@"content":content?:@"",@"operator":operator?:@""}]);
}




@end
