//
//  UIView+RKUIViewCategory.m
//  
//
//  Created by Roman Kotov on 02.11.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

#import "UIView+RKUIViewCategory.h"
#import <objc/runtime.h>

@implementation UIView (RKUIViewCategory)

static NSString *kStringExtraKey = @"StringTagKey";

/** Получить значение в добавленном свойстве stringTag */
- (NSString *)rk_stringExtra {
    return objc_getAssociatedObject(self,
                                    (__bridge const void *)(kStringExtraKey));
}

/** Установить значение добавленному свойству stringExtra */
- (void)setRk_stringExtra:(NSString *)stringExtra {
    objc_setAssociatedObject(self,
                             (__bridge const void *)(kStringExtraKey),
                             stringExtra,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/** Получить view с указаным тегом */
- (UIView *)rk_viewWithStringExtra:(NSString *)tag {
    return [self rk_viewWithStringExtra:tag andView:self];
}

/** Получить view с указанным тегом */
- (UIView *)rk_viewWithStringExtra:(NSString *)tag andView:(UIView *)view {
    for (UIView *subview in view.subviews) {
        if ([subview.rk_stringExtra isEqualToString:tag]) {
            return subview;
        }
        
        UIView *view = [self rk_viewWithStringExtra:tag andView:subview];
        if (view) return view;
    }
    
    return nil;
}

/** Изменение высоты view в зависимости от размеров содержащихся subview */
- (void)autoHeight {
    CGFloat viewHeight = 0.0f;
    for (UIView *view in self.subviews)
    {
        if (!view.hidden)
        {
            CGFloat y = view.frame.origin.y;
            CGFloat h = view.frame.size.height;
            if (y + h > viewHeight)
            {
                viewHeight = h + y;
            }
        }
    }
    
    CGRect viewFrame = self.frame;
    viewFrame.size.height = viewHeight;
    self.frame = viewFrame;
}

/** Встряска из стороны в сторону */
- (void)rk_shakeView
{
    CGFloat t = 2;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    self.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        self.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

/** Получаем текстовую иерархию view в NSLog */
- (void)rk_printSubviewsWithIndentation:(int)indentation
{
    // Получаем все subviews
    NSArray *subviews = [self subviews];
    
    //Обычный цикл по всем subviews
    for (int i = 0; i < [subviews count]; i++) {
        
        // Получаем subview по индексу
        UIView *currentSubview = [subviews objectAtIndex:i];
        
        // Будем собирать описание используя изменяемую строку
        NSMutableString *currentViewDescription = [[NSMutableString alloc] init];
        
        // Отступ актуального описания, чтобы наглядно видеть на каком уровне находится view
        for (int j = 0; j <= indentation; j++) {
            [currentViewDescription appendString:@"   "];
        }
        
        // Собираем актульаную строку
        [currentViewDescription appendFormat:@"[%d]: class: '%@'", i, NSStringFromClass([currentSubview class])];
        
        // Выводим в лог
        NSLog(@"%@", currentViewDescription);
        
        // Рекурсивно получаем остальное
        [currentSubview rk_printSubviewsWithIndentation:indentation+1];
    }
}

#pragma mark -
#pragma mark Fast coordinates
- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect newFrame = self.frame;
    newFrame.origin = origin;
    self.frame = newFrame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect newFrame = self.frame;
    newFrame.size = size;
    self.frame = newFrame;
}

#pragma mark -
#pragma mark Center
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

#pragma mark -
#pragma mark Border
- (CGFloat)top {
    return self.y;
}

- (void)setTop:(CGFloat)top {
    self.y = top;
}

- (CGFloat)bottom {
    return self.y + self.height;
}

- (void)setBottom:(CGFloat)bottom {
    self.y = bottom - self.height;
}

- (CGFloat)left {
    return self.x;
}

- (void)setLeft:(CGFloat)left {
    self.x = left;
}

- (CGFloat)right {
    return self.x + self.width;
}

- (void)setRight:(CGFloat)right {
    self.x = right - self.width;
}

- (void)setZeroConstraints:(BOOL)set {
    if (set) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:@{@"view":self}]];
        [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:@{@"view":self}]];
        [self.superview setNeedsUpdateConstraints];
        [self.superview updateConstraintsIfNeeded];
    }
    else {
        self.translatesAutoresizingMaskIntoConstraints = YES;
        
        int i = 0;
        while (i < self.superview.constraints.count) {
            NSLayoutConstraint *constr = self.superview.constraints[i];
            
            if ([constr.firstItem isEqual:self] || [constr.secondItem isEqual:self]) {
                [self.superview removeConstraint:constr];
            }
            else {
                i++;
            }
        }
        
        [self.superview updateConstraintsIfNeeded];
    }
}

@end
