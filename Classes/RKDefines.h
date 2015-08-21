//
//  RKDefines.h
//
//
//  Created by Roman Kotov on 28.02.15.
// 	Copyright (c) 2014 Roman Kotov. All rights reserved.
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

#ifndef __RKDefines__
#define __RKDefines__

/** Возвращает UDID устройства в виде строки */
#ifndef UUIDString
#define UUIDString [[UIDevice currentDevice] identifierForVendor].UUIDString
#endif

/** Возвращает корневой View Controller */
#ifndef rootVC
#define rootVC ((UIViewController*)[[UIApplication sharedApplication] delegate].window.rootViewController)
#endif

/** Возвращает userDefaults */
#ifndef userDefaults
#define userDefaults [NSUserDefaults standardUserDefaults]
#endif

/** Возвращает имя класса в виде строки*/
#ifndef classToString
#define classToString(myClass) NSStringFromClass([myClass class])
#endif

/** Подписаться на уведомление о событии */
#ifndef NotificationAdd
#define NotificationAdd(sel,nameNotif) [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sel) name:(nameNotif) object:nil];
#endif

/** Отправить уведомление о событии */
#ifndef NotificationPost
#define NotificationPost(name) [[NSNotificationCenter defaultCenter] postNotificationName:(name) object:nil]
#endif

#ifndef rk_mainBundle
#define rk_mainBundle [NSBundle mainBundle]
#endif

/**
 * Возвращает текущую локаль
 *
 * @return NSString
 */
#ifndef currentLocale
#define currentLocale [[NSLocale preferredLanguages] firstObject]
#endif

/**
 * Возвращает булевское значение указывающее русская локаль или нет
 *
 * @return BOOL
 */
#ifndef isRussianLocale
#define isRussianLocale [currentLocale isEqual:@"ru"]
#endif

/**
 * Возвращает структуру содержащую размеры экрана
 *
 * @return CGSize
 */
#ifndef screenSize
#define screenSize [[UIScreen mainScreen] bounds].size
#endif

/**
 * Возвращает высоту экрана в альбомной ориентации (для поддержки iOS7 и iOS8)
 *
 * @return CGFloat
 */
#ifndef SCREEN_HEIGHT_LANSCAPE
#define SCREEN_HEIGHT_LANSCAPE MIN(screenSize.width, screenSize.height)
#endif

/**
 * Возвращает ширину экрана в альбомной ориентации (для поддержки iOS7 и iOS8)
 *
 * @return CGFloat
 */
#ifndef SCREEN_WIDTH_LANDSCAPE
#define SCREEN_WIDTH_LANDSCAPE MAX(screenSize.width, screenSize.height)
#endif

/**
 * Возвращает значение является ли данная модель iPad
 *
 * @return BOOL
 */
#ifndef isIpad
#define isIpad (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
#endif

/**
 * Возвращает значение является ли данная модель телефона iPhone 4
 *
 * @return BOOL
 */
#ifndef isIphone4
#define isIphone4 ((SCREEN_WIDTH_LANDSCAPE <= 480.0) ? YES : NO)
#endif

/**
 * Возвращает значение является ли данная модель телефона iPhone 6
 *
 * @return BOOL
 */
#ifndef isIphone6
#define isIphone6 ((SCREEN_WIDTH_LANDSCAPE > 568.0 && SCREEN_WIDTH_LANDSCAPE <= 667.0) ? YES : NO)
#endif

/**
 * Возвращает значение является ли данная модель телефона iPhone 5
 *
 * @return BOOL
 */
#ifndef isIphone5
#define isIphone5 ((isIphone4 || isIphone6 || SCREEN_WIDTH_LANDSCAPE > 568.0) ? NO : YES)
#endif

/**
 * Возвращает значение является ли данная модель телефона iPhone 6+
 *
 * @return BOOL
 */
#ifndef isIphone6Plus
#define isIphone6Plus ((!(isIphone4 || isIphone5 || isIphone6) && SCREEN_WIDTH_LANDSCAPE <= 736) ? YES : NO)
#endif

/**
 * Возвращает значение равна ли данная версия ОС v
 *
 * @return BOOL
 */
#ifndef SYSTEM_VERSION_EQUAL_TO
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#endif

/**
 * Возвращает значение данная версия ОС больше v или нет
 *
 * @return BOOL
 */
#ifndef SYSTEM_VERSION_GREATER_THAN
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#endif

/**
 * Возвращает значение данная версия ОС больше или равна v или нет
 *
 * @return BOOL
 */
#ifndef SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#endif

/**
 * Возвращает значение данная версия ОС меньше v или нет
 *
 * @return BOOL
 */
#ifndef SYSTEM_VERSION_LESS_THAN
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#endif

/**
 * Возвращает значение данная версия ОС меньше или равна v или нет
 *
 * @return BOOL
 */
#ifndef SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#endif

/** Возвращает рандомное число в заданном диапазоне */
#ifndef randFromTo
#define randFromTo(min, max) (min + arc4random_uniform(max - min + 1))
#endif

/** Какое смещение делать относительно высоты экрана (Проверка на версию телефона iPhone 4) */
#ifndef assetByScreenHeight
#define assetByScreenHeight(regular, longScreen) ((isIphone4) ? regular : longScreen)
#endif

/** Вывести в лог, если режим отладки, иначе ничего не делать */
#ifdef DEBUG
    #define DOLog(format, ...) NSLog(format, ## __VA_ARGS__)
    #define DODiscLog(...) NSLog(@"%@", ## __VA_ARGS__)
#else
    #define DOLog(format, ...)
    #define DODiscLog(...)
#endif


#endif /* __RKDefines__ */
