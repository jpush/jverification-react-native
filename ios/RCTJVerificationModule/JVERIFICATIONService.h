//
//  JVERIFICATIONService.h
//  JVerification
//
//  Created by andy on 2018/9/11.
//  Copyright © 2018年 hxhg. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JVER_VERSION_NUMBER 1.1.0

@interface JVAuthConfig : NSObject

/* appKey 必须的,应用唯一的标识. */
@property (nonatomic, copy) NSString *appKey;
/* channel 发布渠道. 可选，默认为空*/
@property (nonatomic, copy) NSString *channel;
/* advertisingIdentifier 广告标识符（IDFA). 可选，默认为空*/
@property (nonatomic, copy) NSString *advertisingId;
/* isProduction 是否生产环境. 如果为开发状态,设置为NO;如果为生产状态,应改为YES.可选，默认为NO */
@property (nonatomic, assign) BOOL isProduction;

@end

@interface JVAuthEntity : NSObject<NSCopying>

/* number 必须的,需要认证的手机号. */
@property (nonatomic, copy) NSString *number;
/* token 认证手机号码的授权码. 可选，默认为空，则自动获取后再认证*/
@property (nonatomic, copy) NSString *token;

@end

@interface JVERIFICATIONService : NSObject

+ (void)setupWithConfig:(JVAuthConfig *)config;

/**
 获取手机号校验token

 @param completion token相关信息。
 */
+ (void)getToken:(void (^)(NSDictionary *result))completion;

/**
 手机号校验

 @param entity  认证配置信息
 @param completion 认证结果
 */
+ (void)verifyNumber:(JVAuthEntity *)entity result:(void (^)(NSDictionary *result))completion;

/*!
 * @abstract 设置是否打印sdk产生的Debug级log信息, 默认为NO(不打印log)
 *
 * SDK 默认开启的日志级别为: Info. 只显示必要的信息, 不打印调试日志.
 *
 * 请在SDK启动后调用本接口，调用本接口可打开日志级别为: Debug, 打印调试日志.
 * 请在发布产品时改为NO，避免产生不必要的IO
 */
+ (void)setDebug:(BOOL)enable;

@end
