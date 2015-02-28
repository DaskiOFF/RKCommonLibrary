//
//  RKCL.h
//  
//
//  Created by Roman Kotov on 28.10.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKCL : NSObject

/**
 * Метод для безопасного выполнения кода
 *
 * @param block 		Блок для безопасного выполнения
 * @param catchBlock 	Блок для обработки ошибки
 * @param finalyBlock 	Блок для завершения выполнения
 */
+ (void)rk_safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock finalyBlock:(void (^)())finalyBlock;

/**
 * Метод для безопасного выполнения кода
 *
 * @param block 		Блок для безопасного выполнения
 * @param catchBlock 	Блок для обработки ошибки
 */
+ (void)rk_safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock;

/**
 * Метод для безопасного выполнения кода
 *
 * @param block 		Блок для безопасного выполнения
 */
+ (void)rk_safeWithBlock:(void (^)())block;

/**
 *  Выполнение блока с указанной задержкой
 *
 *
 *  @param block    Блок который необходимо выполнить
 *  @param delay    Задержка, через которую блок начнет выполняться
 */
+ (void)rk_performBlock:(void (^)())block delay:(NSTimeInterval)delay;

/** Быстрая очистка cookies в NSHTTPCookieStorage */
+ (void)rk_clearCookies;

/** Возвращает размер frame для размещения текста
 *
 *
 *  @param text    Текст
 *  @param font    Шрифт
 *  @param size    Пределы размера (максимальная ширина и высота)
 *  @return размер frame для размещения текста
 */
+ (CGSize)rk_frameForText:(NSString*)text sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size;

@end