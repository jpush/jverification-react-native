//
//  TYRZLogin.h
//  TYRZ
//
//  Created by 林涛 on 2017/4/24.
//  Copyright © 2017年 林涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYRZLogin : NSObject


/**
 获取本机号码校验需要使用的token
 
 @param appid 开放平台申请得到的appid
 @param appkey 开放平台申请得到的appkey
 @param complete 方法回调
 */
+ (void)getTokenWithAppId:(NSString *)appid appkey:(NSString *)appkey complete:(void (^)(id sender))complete;

//返回SDK版本号
+ (NSString *)version;

/**
 控制台日志输出控制（默认关闭）
 
 @param enable 开关参数
 */
+ (void)printConsoleEnable:(BOOL)enable;

@end
