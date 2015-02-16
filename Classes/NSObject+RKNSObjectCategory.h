//
//  NSObject+RKNSObjectCategory.h
//  
//
//  Created by Roman Kotov on 16.02.15.
//  Copyright (c) 2015 Roman Kotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RKNSObjectCategory)

/**
 *  Возвращает логическое значение является ли объект object == nil
 *
 *
 *  @param  object 	Проверяемый объект
 *  @return true, если объект == nil, false иначе
 */
+ (BOOL)isNilObject:(NSObject*)object;

/** Возвращает логическое значение является ли объект nil */
- (BOOL)isNil;

@end
