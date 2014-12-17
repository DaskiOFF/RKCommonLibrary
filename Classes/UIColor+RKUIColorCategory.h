//
//  UIColor+RKUIColorCategory.h
//  tvbreak
//
//  Created by Roman Kotov on 17.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RKUIColorCategory)

/**
 *  Возвращает UIColor по hex значению и значению прозрачности
 *
 *
 *  @param  hexColorString Шестнадцатеричное представление цвета (3 или 6 элементов)
 *  @param  alpha          Прозрачности 0..1
 *  @return UIColor по hex значению и значению прозрачности
 */
+ (UIColor*)colorWithHex:(NSString*)hexColorString alpha:(float)alpha;

/**
 *  Возвращает UIColor по hex значению
 *
 *
 *  @param  hexColorString Шестнадцатеричное представление цвета (3 или 6 элементов)
 *  @return UIColor по hex значению
 */
+ (UIColor *)colorWithHex:(NSString*)hexColorString;

@end
