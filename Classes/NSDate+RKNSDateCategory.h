//
//  NSDate+RKNSDateCategory.h
//  
//
//  Created by Roman Kotov on 16.12.14.
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

@interface NSDate (RKNSDateCategory)

/**
 *  Текущая дата в пользовательсом формате
 *
 *
 *  @param  format  формат в котором должна быть возвращена дата
 *  @return Строка с датой в виде предоставленного формата
 */
+ (NSString*)rk_nowStringWithFormat:(NSString*)format;

/** Текущая дата в формате yyyy-MM-dd hh:mm:ss */
+ (NSString*)rk_nowString;

/** Текущая дата в формате yyyy-MM-dd */
+ (NSString*)rk_nowStringDate;

/** Текущее время в формате hh:mm:ss */
+ (NSString*)rk_nowStringTime;

/** Возвращает количество секунд с 1.1.1970 */
+ (NSTimeInterval)timeIntervalSince1970;

/**
 *  Дата в пользовательсом формате
 *
 *
 *  @param  format  формат в котором должна быть возвращена дата
 *  @return Строка с датой в виде предоставленного формата
 */
- (NSString*)rk_stringWithFormat:(NSString*)format;

/** Дата в формате yyyy-MM-dd hh:mm:ss */
- (NSString*)rk_string;

/** Дата в формате yyyy-MM-dd */
- (NSString*)rk_stringDate;

/** Время в формате hh:mm:ss */
- (NSString*)rk_stringTime;

@end
