//
//  NSDate+RKNSDateCategory.h
//  
//
//  Created by Roman Kotov on 16.12.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
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
