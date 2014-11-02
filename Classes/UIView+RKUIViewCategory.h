//
//  UIView+RKUIViewCategory.h
//  testMyPod
//
//  Created by Roman Kotov on 02.11.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RKUIViewCategory)

/** тэг view (свойство добавляемое в runtime) */
@property (nonatomic, copy) NSString *stringExtra;

/** Изменение высоты view в зависимости от размеров содержащихся subview */
- (void)autoHeight;

/** Встряска из стороны в сторону */
- (void)shakeView;

/**
 *  Получаем текстовую иерархию view в NSLog
 *
 *
 *  @param  indentation Начальный отступ (рекомендуемое значение = 0)
 */
- (void)printSubviewsWithIndentation:(int)indentation;

/**
 *  Найти subview с указанным тегом
 *
 *
 *  @param  tag Тег view, которую мы ищем
 *  @return View с данным тегом
 */
- (UIView *)viewWithStringExtra:(NSString *)tag;

@end
