//
//  TYRZLogin.h
//  TYRZ
//
//  Created by 林涛 on 2017/4/24.
//  Copyright © 2017年 林涛. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYRZLogin : NSObject

+ (nullable instancetype)loginWithAppId:(NSString *)appid appKey:(NSString *)appkey;

/**
 本机号码校验获取token
 @param duration 请求时间(毫秒)
 @param complete 回调
 */
- (void)requestTokenWithTimeout:(NSTimeInterval)duration Complete:(void(^)(NSDictionary *))complete;

//返回SDK版本号
+ (NSString *)sdkVersion;


@end

NS_ASSUME_NONNULL_END
