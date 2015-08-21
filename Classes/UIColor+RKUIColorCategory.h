//
//  UIColor+RKUIColorCategory.h
//  
//
//  Created by Roman Kotov on 17.12.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// --- Contacts ---
// waydeveloper@gmail.com
// http://waydeveloper.com
// http://vk.com/daskioff
//

#import <UIKit/UIKit.h>

/**
 * Получить цвет согласно RGB
 *
 * @return UIColor
 */
#ifndef RGB
#define RGB(r, g, b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0f]
#endif

/**
 * Получить цвет согласно RGB с заданной прозрачностью (alpha)
 *
 * @return UIColor
 */
#ifndef RGBA
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:(a)]
#endif

/**
 * Получить цвет согласно HEX значению представленному в виде 0xffaacc
 *
 * @return UIColor
 */
#ifndef RGBHexFromInt
#define RGBHexFromInt(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#endif

/**
 * Получить цвет с заданной прозрачностью согласно HEX значению представленному в виде 0xffaacc
 *
 * @return UIColor
 */
#ifndef RGBHexFromIntWithAlpha
#define RGBHexFromIntWithAlpha(rgbValue, alphaValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]
#endif

/**
 * Получить цвет согласно HEX значению представленному в виде @"FFF", @"AFFF", @"FFAAFF", @"AAFFAAFF"
 *
 * @return UIColor
 */
#ifndef RGBHexFromString
#define RGBHexFromString(rgbValue) ([UIColor rk_colorWithHex:rgbValue])
#endif

/**
 * Получить прозрачный цвет
 *
 * @return UIColor
 */
#ifndef ClearColor
#define ClearColor [UIColor clearColor]
#endif

#ifndef WhiteColor
#define WhiteColor [UIColor whiteColor]
#endif

#ifndef BlackColor
#define BlackColor [UIColor blackColor]
#endif

#ifndef GreenColor
#define GreenColor [UIColor greenColor]
#endif

#ifndef RedColor
#define RedColor [UIColor redColor]
#endif

#ifndef YellowColor
#define YellowColor [UIColor yellowColor]
#endif

#ifndef BlueColor
#define BlueColor [UIColor blueColor]
#endif

@interface UIColor (RKUIColorCategory)

/**
 *  Возвращает UIColor по hex значению и значению прозрачности
 *
 *
 *  @param  hexColorString Шестнадцатеричное представление цвета (3 или 6 элементов)
 *  @param  alpha          Прозрачности 0..1
 *  @return UIColor по hex значению и значению прозрачности
 */
+ (UIColor*)rk_colorWithHex:(NSString*)hexColorString alpha:(float)alpha;

/**
 *  Возвращает UIColor по hex значению
 *
 *
 *  @param  hexColorString Шестнадцатеричное представление цвета (3 или 6 элементов)
 *  @return UIColor по hex значению
 */
+ (UIColor *)rk_colorWithHex:(NSString*)hexColorString;

@end
