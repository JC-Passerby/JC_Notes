//
//  BaseHeader.h
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/28.
//  Copyright © 2020 刘某某. All rights reserved.
//

#ifndef BaseHeader_h
#define BaseHeader_h

//定义屏幕的宽度和高度
#define JCScreenWidth  [UIScreen mainScreen].bounds.size.width
#define JCScreenHeight [UIScreen mainScreen].bounds.size.height

// 字符串格式化
#define JCStringFormat(ISstr)  [NSString stringWithFormat:@"%@",ISstr]

//判断iPhoneX
#define iOS11Later ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
#define isIphoneX ({\
BOOL isPhoneX = NO;\
if (iOS11Later) {\
    if (!UIEdgeInsetsEqualToEdgeInsets([UIApplication sharedApplication].delegate.window.safeAreaInsets, UIEdgeInsetsZero)) {\
    isPhoneX = YES;\
    }\
}\
isPhoneX;\
})

//状态栏+导航栏高度
#define JCTopBarHeight  (isIphoneX ? 88 : 64)

//底部高度
#define JCBottomHeight  (isIphoneX ? 34 : 0)

// RGB颜色转换（16进制->10进制）
#define JCColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define JCColorFromRGBAndAlpha(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#endif /* BaseHeader_h */
