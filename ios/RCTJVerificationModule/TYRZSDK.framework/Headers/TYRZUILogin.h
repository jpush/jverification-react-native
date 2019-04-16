//
//  TYRZUILogin.h
//  TYRZ
//
//  Created by 林涛 on 2017/6/21.
//  Copyright © 2017年 林涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UACustomModel.h"

@interface TYRZUILogin : NSObject

/**
 SDK版本号
 */
@property (nonatomic,class,readonly) NSString *sdkVersion;

/**
 网络类型及运营商
 网络类型  key:networkType    value:0.无网络/ 1.数据流量 / 2.wifi / 3.数据+wifi
 运营商   key:operatorType         value:0.未知 / 1.中国移动 / 2.中国联通 / 3.中国电信
 */
@property (nonatomic,class,readonly) NSDictionary *networkType;

/**
 初始化SDK参数
 @param appId 申请能力平台成功后，分配给网站的appId
 @param appKey 申请能力平台成功后，分配给网站的appKey
 */
+ (void)initializeWithAppId:(NSString *)appId appKey:(NSString *)appKey;

/**
 控制台日志输出控制（默认关闭）
 @param enable 开关参数
 */
+ (void)printConsoleEnable:(BOOL)enable;

/**
 自定义UI样式参数
 @param viewModel UI实例Model（UACustomModel.h可查看属性）
 @param customViews 自定义视图
 */
+ (void)customUIWithParams:(UACustomModel *)viewModel
               customViews:(void(^)(UIView *customAreaView))customViews;

/**
 自定义短信验证码开关
 @param flag 开关标记
 */
+ (void)enableCustomSMS:(BOOL)flag;


/**
 预取号
 @param timeout 超时时间(毫秒)
 @param complete 回调
 */
+ (void)getPhonenumberWithTimeout:(NSTimeInterval)timeout
                          completion:(void(^)(id sender))complete;


/**
 授权登录
 @param vc 当前控制器
 @param timeout 超时时间(毫秒)
 @param complete 回调
 */
+ (void)getAuthorizationWithController:(UIViewController *)vc
                          timeout:(NSTimeInterval)timeout
                         complete:(void (^)(id sender))complete;

/**
 本机号码校验
 @param timeout 超时时间(毫秒)
 @param complete 回调
 */
+ (void)mobileAuthWithTimeout:(NSTimeInterval)timeout
                      complete:(void (^)(id sender))complete;

/**
 删除内存中的缓存
 */

+(BOOL)delectScrip;

@end
