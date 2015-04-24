//
//  UIView+RKUIViewCategory.h
//  
//
//  Created by Roman Kotov on 02.11.14.
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

#import <UIKit/UIKit.h>

@interface UIView (RKUIViewCategory)

/** тэг view (свойство добавляемое в runtime) */
@property (nonatomic, copy) NSString *rk_stringExtra;

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

/** Привязываем View ко всем краям superView */
- (void)setZeroConstraints:(BOOL)set;

/** Изменение высоты view в зависимости от размеров содержащихся subview */
- (void)autoHeight;

/** Встряска из стороны в сторону */
- (void)rk_shakeView;

/**
 *  Получаем текстовую иерархию view в NSLog
 *
 *
 *  @param  indentation Начальный отступ (рекомендуемое значение = 0)
 */
- (void)rk_printSubviewsWithIndentation:(int)indentation;

/**
 *  Найти subview с указанным тегом
 *
 *
 *  @param  tag Тег view, которую мы ищем
 *  @return View с данным тегом
 */
- (UIView *)rk_viewWithStringExtra:(NSString *)tag;



@end
