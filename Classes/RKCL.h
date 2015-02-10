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
	#import "NSString+RKNSStringCategory.h"
	#import "NSDate+RKNSDateCategory.h"
	#import "UIColor+RKUIColorCategory.h"
	#import "UILabel+RKUILabelCategory.h"
	#import "UINavigationController+RKUINavigationControllerCategory.h"
	#import "UIViewController+RKUIViewControllerCategory.h"
	#import "RKBaseClass.h"

#endif /* __RKCL__ */

/** Возвращает UDID устройства в виде строки */
#define UDIDString [[UIDevice currentDevice] identifierForVendor].UUIDString

/** Возвращает корневой View Controller */
#define rootVC ((UIViewController*)[[UIApplication sharedApplication] delegate].window.rootViewController)

/** Возвращает userDefaults */
#define userDefaults [NSUserDefaults standardUserDefaults]

/** Подписаться на уведомление о событии */
#define NotificationAdd(sel,nameNotif) [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sel) name:(nameNotif) object:nil];

/** Отправить уведомление о событии */
#define NotificationPost(name) [[NSNotificationCenter defaultCenter] postNotificationName:(name) object:nil]

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
 * Возвращает высоту экрана в альбомной ориентации (для поддержки iOS7 и iOS8)
 *
 * @return CGFloat
 */
#define SCREEN_HEIGHT_LANSCAPE MIN(screenSize.width, screenSize.height)

/**
 * Возвращает ширину экрана в альбомной ориентации (для поддержки iOS7 и iOS8)
 *
 * @return CGFloat
 */
#define SCREEN_WIDTH_LANDSCAPE MAX(screenSize.width, screenSize.height)

/**
 * Возвращает значение является ли данная модель iPad
 *
 * @return BOOL
 */
#define isIpad (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)

/**
 * Возвращает значение является ли данная модель телефона iPhone 4
 *
 * @return BOOL
 */
#define isIphone4 ((SCREEN_WIDTH_LANDSCAPE <= 480.0) ? YES : NO)

/**
 * Возвращает значение является ли данная модель телефона iPhone 6
 *
 * @return BOOL
 */
#define isIphone6 ((SCREEN_WIDTH_LANDSCAPE > 568.0 && SCREEN_WIDTH_LANDSCAPE <= 667.0) ? YES : NO)

/**
 * Возвращает значение является ли данная модель телефона iPhone 5
 *
 * @return BOOL
 */
#define isIphone5 ((isIphone4 || isIphone6 || SCREEN_WIDTH_LANDSCAPE > 568.0) ? NO : YES)

/**
 * Возвращает значение является ли данная модель телефона iPhone 6+
 *
 * @return BOOL
 */
#define isIphone6Plus ((!(isIphone4 || isIphone5 || isIphone6) && SCREEN_WIDTH_LANDSCAPE <= 736) ? YES : NO)

/**
 * Возвращает значение равна ли данная версия ОС v
 *
 * @return BOOL
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

/**
 * Возвращает значение данная версия ОС больше v или нет
 *
 * @return BOOL
 */
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

/**
 * Возвращает значение данная версия ОС больше или равна v или нет
 *
 * @return BOOL
 */
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

/**
 * Возвращает значение данная версия ОС меньше v или нет
 *
 * @return BOOL
 */
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

/**
 * Возвращает значение данная версия ОС меньше или равна v или нет
 *
 * @return BOOL
 */
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/** Возвращает рандомное число в заданном диапазоне */
#define randFromTo(min, max) (min + arc4random_uniform(max - min + 1))

/** Какое смещение делать относительно высоты экрана (Проверка на версию телефона iPhone 4) */
#define assetByScreenHeight(regular, longScreen) ((isIphone4) ? regular : longScreen)

/**
 * Получить цвет согласно RGB
 *
 * @return UIColor
 */
#define RGB(r, g, b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0f]

/**
 * Получить цвет согласно RGB с заданной прозрачностью (alpha)
 *
 * @return UIColor
 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:(a)]

/**
 * Получить прозрачный цвет
 *
 * @return UIColor
 */
#define ClearColor [UIColor clearColor]

/** Вывести в лог, если режим отладки, иначе ничего не делать */
#ifdef DEBUG
    #define DOLog(format, ...) NSLog(format, ## __VA_ARGS__)
    #define DODiscLog(...) NSLog(@"%@", ## __VA_ARGS__)
#else
    #define DOLog(format, ...)
    #define DODiscLog(...)
#endif

@interface RKCL : NSObject

/**
 * Метод для безопасного выполнения кода
 *
 * @param block 		Блок для безопасного выполнения
 * @param catchBlock 	Блок для обработки ошибки
 * @param finalyBlock 	Блок для завершения выполнения
 */
+ (void)safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock finalyBlock:(void (^)())finalyBlock;

/**
 * Метод для безопасного выполнения кода
 *
 * @param block 		Блок для безопасного выполнения
 * @param catchBlock 	Блок для обработки ошибки
 */
+ (void)safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock;

/**
 * Метод для безопасного выполнения кода
 *
 * @param block 		Блок для безопасного выполнения
 */
+ (void)safeWithBlock:(void (^)())block;

/**
 *  Выполнение блока с указанной задержкой
 *
 *
 *  @param block    Блок который необходимо выполнить
 *  @param delay    Задержка, через которую блок начнет выполняться
 */
+ (void)performBlock:(void (^)())block delay:(NSTimeInterval)delay;

/** Быстрая очистка cookies в NSHTTPCookieStorage */
+ (void)clearCookies;

/** Возвращает размер frame для размещения текста
 *
 *
 *  @param text    Текст
 *  @param font    Шрифт
 *  @param size    Пределы размера (максимальная ширина и высота)
 *  @return размер frame для размещения текста
 */
+ (CGSize)frameForText:(NSString*)text sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size;

@end