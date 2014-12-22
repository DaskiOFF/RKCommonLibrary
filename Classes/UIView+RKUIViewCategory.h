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

/// Координата X
@property (nonatomic, assign) CGFloat x;

/// Координата Y
@property (nonatomic, assign) CGFloat y;

/// Ширина
@property (nonatomic, assign) CGFloat width;

/// Высота
@property (nonatomic, assign) CGFloat height;

/// Точка отсчета
@property (nonatomic) CGPoint origin;

/// Размеры
@property (nonatomic) CGSize size;

/// Координата X центра
@property (nonatomic, assign) CGFloat centerX;

/// Координата Y центра
@property (nonatomic, assign) CGFloat centerY;

/// Верхний край
@property (nonatomic, assign) CGFloat top;

/// Нижний край
@property (nonatomic, assign) CGFloat bottom;

/// Левый край
@property (nonatomic, assign) CGFloat left;

/// Правый край
@property (nonatomic, assign) CGFloat right;

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
