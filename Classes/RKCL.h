//
//  RKCL.h
//  DOCommonElements
//
//  Created by Roman Kotov on 28.10.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef __RKCL__
    #define __RKCL__

	#import "UIView+RKUIViewCategory.h"

#endif /* __RKCL__ */

/**
 * Возвращает корневой View Controller
 */
#define rootVC ((NVSlideMenuController *)[[UIApplication sharedApplication] delegate].window.rootViewController)

/**
 * Возвращает userDefaults
 */
#define userDefaults [NSUserDefaults standardUserDefaults]

/**
 * Возвращает текущую локаль
 *
 * @return NSString
 */
#define currentLocale [[NSLocale preferredLanguages] firstObject]

/**
 * Возвращает булевское значение указывающее русская локаль или нет
 *
 * @return BOOL
 */
#define isRussian [currentLocale isEqual:@"ru"]

/**
 * Возвращает структуру содержащую размеры экрана
 *
 * @return CGSize
 */
#define screenSize [[UIScreen mainScreen] bounds].size

/**
 * Возвращает значение является ли данная модель телефона iPhone 4
 *
 * @return BOOL
 */
#define isIphone4 ((screenSize.height <= 480.0) ? YES : NO)

/**
 * Возвращает значение является ли данная модель телефона iPhone 5
 *
 * @return BOOL
 */
#define isIphone5 ((isIphone4 || isIphone6 || isIphone6Plus) ? NO : YES)

/**
 * Возвращает значение является ли данная модель телефона iPhone 6
 *
 * @return BOOL
 */
#define isIphone6 ((screenSize.height > 568.0 && screenSize.height <= 667.0) ? YES : NO)

/**
 * Возвращает значение является ли данная модель телефона iPhone 6+
 *
 * @return BOOL
 */
#define isIphone6Plus ((!(isIphone4 || isIphone5 || isIphone6) && screenSize.height <= 736) ? YES : NO)

/**
 * Возвращает рандомное число в заданном диапазоне
 */
#define randFromTo(min, max) (min + arc4random_uniform(max - min + 1))

/**
 * Какое смещение делать относительно высоты экрана (Проверка на версию телефона iPhone 4)
 */
#define assetByScreenHeight(regular, longScreen) ((isIphone4) ? regular : longScreen)

/**
 * Получить цвет согласно RGB
 *
 * @return UIColor
 */
#define RGB(r, g, b) [UIColor colorWithRed:(r/255) green:(g/255) blue:(b/255) alpha:1.0f]

/**
 * Получить цвет согласно RGB с заданной прозрачностью (alpha)
 *
 * @return UIColor
 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r/255) green:(g/255) blue:(b/255) alpha:(a)]

/**
 * Получить прозрачный цвет
 *
 * @return UIColor
 */
#define ClearColor [UIColor clearColor]

/**
 * Вывести в лог, если режим отладки, иначе ничего не делать
 */
#ifdef DEBUG
    #define DOLog(format, ...) NSLog(format, ## __VA_ARGS__)
    #define DODiscLog(...) NSLog(@"%@", ## __VA_ARGS__)
#else
    #define DOLog(format, ...)
    #define DODiscLog(...)
#endif