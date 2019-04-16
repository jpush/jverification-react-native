//
//  UACustomModel.h
//  Test
//
//  Created by issuser on 2018/5/18.
//  Copyright © 2018年 林涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UACustomModel : NSObject

/**
 SDK5.3.8版本注意事项:
 授权页面的各个控件的Y轴默认值都是以375*667屏幕为基准 系数 ： 当前屏幕高度/667
 1、当设置Y轴并有效时 偏移量OffsetY属于相对导航栏的绝对Y值
 2、（负数且超出当前屏幕无效）为保证各个屏幕适配,请自行设置好Y轴在屏幕上的比例（推荐:当前屏幕高度/667）
 */

/*----------------------------------------授权页面-----------------------------------*/

//MARK:导航栏*************

/**导航栏颜色*/
@property (nonatomic,strong) UIColor *navColor;
/**状态栏着色样式*/
@property (nonatomic,assign) UIBarStyle barStyle;
/**导航栏标题*/
@property (nonatomic,strong) NSAttributedString *navText;
/**导航返回图标*/
@property (nonatomic,strong) UIImage *navReturnImg;
/**导航栏右侧自定义控件*/
@property (nonatomic,strong) UIBarButtonItem *navControl;

//MARK:图片设置************

/**LOGO图片*/
@property (nonatomic,strong) UIImage *logoImg;
/**LOGO图片宽度*/
@property (nonatomic,assign) CGFloat logoWidth;
/**LOGO图片高度*/
@property (nonatomic,assign) CGFloat logoHeight;
/**LOGO图片偏移量*/
@property (nonatomic,assign) CGFloat logoOffsetY;
/**LOGO图片隐藏*/
@property (nonatomic,assign) BOOL logoHidden;

//MARK:登录按钮************

/**登录按钮文本*/
@property (nonatomic,strong) NSString *logBtnText;
/**登录按钮Y偏移量*/
@property (nonatomic,assign) CGFloat logBtnOffsetY;
/**登录按钮文本颜色*/
@property (nonatomic,strong) UIColor *logBtnTextColor;
/**登录按钮背景图片添加到数组(顺序如下)
 @[激活状态的图片,失效状态的图片,高亮状态的图片]
*/
@property (nonatomic,strong) NSArray *logBtnImgs;

//MARK:号码框设置************

/**显示旧版号码栏样式*/
@property (nonatomic,assign) BOOL oldStyle;
/**手机号码字体颜色*/
@property (nonatomic,strong) UIColor *numberColor;
/**隐藏切换账号按钮*/
@property (nonatomic,assign) BOOL swithAccHidden;
/**切换账号字体颜色*/
@property (nonatomic,strong) UIColor *swithAccTextColor;
/**设置切换账号相对于标题栏下边缘y偏移*/
@property (nonatomic,assign) CGFloat switchOffsetY;
/**号码栏Y偏移量*/
@property (nonatomic,assign) CGFloat numFieldOffsetY;

//MARK:隐私条款************

/**复选框未选中时图片*/
@property (nonatomic,strong) UIImage *uncheckedImg;
/**复选框选中时图片*/
@property (nonatomic,strong) UIImage *checkedImg;
/**隐私条款一:数组（务必按顺序）
 @[条款名称,条款链接]
 */
@property (nonatomic,strong) NSArray *appPrivacyOne;
/**隐私条款二:数组（务必按顺序）
 @[条款名称,条款链接]
 */
@property (nonatomic,strong) NSArray *appPrivacyTow;
/**隐私条款名称颜色
 @[基础文字颜色,条款颜色]
 */
@property (nonatomic,strong) NSArray *appPrivacyColor;
/**隐私条款Y偏移量(注:此属性为与屏幕底部的距离)*/
@property (nonatomic,assign) CGFloat privacyOffsetY;

//MARK:底部标识Title************

/**slogan偏移量Y*/
@property (nonatomic,assign) CGFloat sloganOffsetY;
/**slogan文字颜色*/
@property (nonatomic,strong) UIColor *sloganTextColor;

/*----------------------------------------短信页面-----------------------------------*/
/**短验页面导航栏标题*/
@property (nonatomic,strong) NSAttributedString *SMSNavText;
/**登录按钮文本内容*/
@property (nonatomic,strong) NSString *SMSLogBtnText;
/**登录按钮文本颜色*/
@property (nonatomic,strong) UIColor *SMSLogBtnTextColor;
/**短验登录按钮图片请按顺序添加到数组(顺序如下)
 @[激活状态的图片,失效状态的图片,高亮状态的图片]

 */
@property (nonatomic,strong) NSArray *SMSLogBtnImgs;

@end
