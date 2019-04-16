//
//  UniAuthHelper.h
//  account_verify_sdk_core
//
//  Created by zhuof on 2018/3/8.
//  Copyright © 2018年 xiaowo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UniResultListener.h"
//#import <UIKit/UIKit.h>

@interface UniAuthHelper : NSObject

+(UniAuthHelper *) getInstance;

-(void) getAccessCode :(NSString*) appId appSecret:(NSString*) appSecret listener:(UniResultListener) listener;

-(void) getAccessToken : (NSString *) accessCode listener:(UniResultListener) listener;

-(void) login :(NSString*) appId appSecret:(NSString*) appSecret listener:(UniResultListener) listener;

@end
