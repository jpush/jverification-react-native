//
//  UnivAuthHelper.h
//  account_verify_sdk_core
//
//  Created by zhuof on 2018/3/8.
//  Copyright © 2018年 xiaowo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^UnivResultListener)(NSDictionary *data);

@interface UnivAuthHelper : NSObject

+(UnivAuthHelper *) getInstance;

-(void) getAccessCode :(NSString*) appId appSecret:(NSString*) appSecret timeout:(double)timeout listener:(UnivResultListener) listener;

@end
