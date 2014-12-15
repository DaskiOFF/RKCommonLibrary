//
//  UIView+RKUIViewCategory.m
//  testMyPod
//
//  Created by Roman Kotov on 02.11.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

#import "RKCL.h"

@implementation RKCL

static NSString *kStringExtraKey = @"StringTagKey";

/** Получить значение в добавленном свойстве stringTag */
- (NSString *)stringExtra {
    return objc_getAssociatedObject(self,
                                    (__bridge const void *)(kStringExtraKey));
}

/** Установить значение добавленному свойству stringExtra */
- (void)setStringExtra:(NSString *)stringExtra {
    objc_setAssociatedObject(self,
                             (__bridge const void *)(kStringExtraKey),
                             stringExtra,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/** Получить view с указаным тегом */
- (UIView *)viewWithStringExtra:(NSString *)tag {
    return [self viewWithStringExtra:tag andView:self];
}

/** Получить view с указанным тегом */
- (UIView *)viewWithStringExtra:(NSString *)tag andView:(UIView *)view {
    for (UIView *subview in view.subviews) {
        if ([subview.stringExtra isEqualToString:tag]) {
            return subview;
        }
        
        UIView *view = [self viewWithStringExtra:tag andView:subview];
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
- (void)shakeView
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
- (void)printSubviewsWithIndentation:(int)indentation
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
        [currentSubview printSubviewsWithIndentation:indentation+1];
    }
}

@end
