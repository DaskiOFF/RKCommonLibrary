//
//  RKCL.h
//  
//
//  Created by Roman Kotov on 28.10.14.
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RKDefines.h"

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

/**
 *  Функция возвращает окончание для множественного числа слова на основании числа и массива окончаний
 *
 *
 *  @param  number  Число на основе которого нужно сформировать окончание
 *  @param  ending  Массив слов или окончаний для чисел (1, 4, 5),
 *         например array('яблоко', 'яблока', 'яблок')
 *  @return Окончание для множественного числа
 */
+ (NSString*)rk_endingForNumber:(NSInteger)number andEnding:(NSArray*)ending;

@end