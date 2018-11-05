//
//  UnivAuthHelper.h
//  account_verify_sdk_core
//
//  Created by zhuof on 2018/3/8.
//  Copyright © 2018年 xiaowo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UnivResultListener.h"

@interface UnivAuthHelper : NSObject

+(UnivAuthHelper *) getInstance;

-(void) getAccessCode :(NSString*) appId appSecret:(NSString*) appSecret listener:(UnivResultListener) listener;

@end
