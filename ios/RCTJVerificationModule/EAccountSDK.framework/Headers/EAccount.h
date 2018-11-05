//
//  EAccount.h
//  EAccount
//
//  Created by 21CN on 14-4-3.
//  Copyright (c) 2014年 21CN. All rights reserved.
//

/*
 修订历史：2017、04、26
 添加预取号接口：preGetMobileAccessCode
 添加新的网关认证的接口：gatewayAuth
 删除旧的网关认证接口:gatewayLoginOnly
 修改打开免密登录页面接口的参数。
 */

/*
 SDK说明：
 SDk_ Version: 3.10
 build版本号：
 一些特别说明：凡是涉及到页面操作的接口，请保证在主线程中调用，SDK也保证在主线程中返回
 不涉及到页面操作的接口，SDK会开子线程去处理，不保证在子线程中返回。
 */


/*
 
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>








#pragma mark - 主模块功能。

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AuthorizationLoginType)
{
    LOGIN_TYPE_DEFAULT  = 0,     //默认为显示登录类型
    LOGIN_TYPE_IMPLICIT = 1    //隐式登录类型（）
};

typedef NS_ENUM(NSInteger, VerificationCodeType)
{
    //一个账号，有可能设置了密保手机号，也绑定了手机号，也可能是绑定了邮箱，而且可以是不同的号码，这个时候，用验证验证码时，要确定是用的密保的手机，还是绑定的手机，还是绑定的邮箱
    
    bandMobileType = 1,         //绑定手机的验证码
    secretMobileType  = 2,      //密保手机的验证码
    emailType = 3               //
};

/**
 声明一个block
 
 @param resultDic 网络返回的data的解析结果
 
 */
typedef   void (^successHandler) ( NSDictionary * _Nonnull resultDic);
/**
 声明一个block
 
 @param error 网络返回的错误或者其它错误
 
 */
typedef   void (^failureHandler) (NSError * _Nonnull error);

@interface EAccount : NSObject

//@property (nonatomic)       BOOL                    alwayShowLoginWAP;
@property (nonatomic, weak) UIViewController    *   rootViewController;
/*
 @description 获取当前设备的设备id
 
 @return deviceId(）
 */
@property (NS_NONATOMIC_IOSONLY, getter=getCurrentDeviceId, readonly, copy) NSString * _Nonnull currentDeviceId;


//自营业务的初始化
/**
 初始化SDK

 @param appKey 接入方在账号平台领取的appKey
 @param appSecrect 接入方在账号平台领取的appSecrect
 @param appName 接入方在账号平台领取的appName
 */
+ (void)initWithSelfKey:(NSString *)appKey
                      appSecret:(NSString *)appSecrect
                        appName:(NSString *)appName;



/**
    获取授权码
 @param completion  成功回调
 @param fail  失败的回调
 @param bussinessType 业务类型
 */
+ (void)preGetMobileAccessCode:(NSString *)bussinessType completion:(successHandler)completion failure:(failureHandler)fail;


+ (void)gatewayAuth:(BOOL)needComfirmCode veriyType:(BOOL)veriyType phone:(NSString*)phone success:(successHandler)completion failure:(failureHandler)fail;


@end

NS_ASSUME_NONNULL_END
