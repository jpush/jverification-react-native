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

RCT_EXPORT_METHOD(setup: (NSDictionary *)params) {
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


RCT_EXPORT_METHOD(getToken: (NSDictionary *)params
                  callback: (RCTResponseSenderBlock)callback) {
  
  [JVERIFICATIONService getToken:^(NSDictionary *result) {
    callback(@[result]);
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
    callback(@[result]);
  }];
}

RCT_EXPORT_METHOD(setDebug: (NSNumber *)enable) {
  [JVERIFICATIONService setDebug: [enable boolValue]];
}

@end
