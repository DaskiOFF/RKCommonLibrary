//
//  NSDate+RKNSDateCategory.h
//  test2
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
+ (NSString*)nowStringWithFormat:(NSString*)format;

/** Текущая дата в формате yyyy-MM-dd hh:mm:ss */
+ (NSString*)nowString;

/** Текущая дата в формате yyyy-MM-dd */
+ (NSString*)nowStringDate;

/** Текущее время в формате hh:mm:ss */
+ (NSString*)nowStringTime;

/**
 *  Дата в пользовательсом формате
 *
 *
 *  @param  format  формат в котором должна быть возвращена дата
 *  @return Строка с датой в виде предоставленного формата
 */
- (NSString*)stringWithFormat:(NSString*)format;

/** Дата в формате yyyy-MM-dd hh:mm:ss */
- (NSString*)string;

/** Дата в формате yyyy-MM-dd */
- (NSString*)stringDate;

/** Время в формате hh:mm:ss */
- (NSString*)stringTime;

@end
