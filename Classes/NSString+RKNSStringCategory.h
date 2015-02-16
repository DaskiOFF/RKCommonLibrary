//
//  NSString+RKNSStringCategory.h
//  
//
//  Created by Roman Kotov on 16.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RKNSStringCategory)

/** Возвращает YES, если строка явялется пустой, иначе NO */
- (BOOL)isEmpty;

/** Возвращает MD5 строки */
- (NSString *)md5String;

/**
 *  Возвращает MD5 строки
 *
 *
 *  @param  string  Строка, для которой необходимо вычислить MD5
 *  @return MD5 строки
 */
+ (NSString *)md5String:(NSString *)string;

@end
