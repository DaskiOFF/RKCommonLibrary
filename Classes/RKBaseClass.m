//
//  RKBaseClass.m
//  BrainGame
//
//  Created by Roman Kotov on 10.02.15.
//  Copyright (c) 2015 Roman Kotov. All rights reserved.
//

#import "RKBaseClass.h"
#import <objc/runtime.h>

@implementation RKBaseClass

- (NSString *)description {
    NSMutableString *descriptionString = [NSMutableString new];
    
    [descriptionString appendString:@"\n"];
    NSMutableString *step = [@"\t" mutableCopy];
    
    // Добавляем имя текущего и родительского классов
    Class superClass = class_getSuperclass([self class]);
    [descriptionString appendFormat:@"%s:  %s {\n", object_getClassName(self), class_getName(superClass)];
    
    // Добавляем свойства текущего класса
    [descriptionString appendString:[self getPropertyValuesForClass:[self class] andStep:step]];
    [step appendString:@"\t"];
    
    // Добавляем свойсва родительских классов
    while (superClass != [NSObject class]) {
        Class oldClass = superClass;
        superClass = class_getSuperclass(superClass);
        
        [descriptionString appendFormat:@"--%s:  %s\n", class_getName(oldClass), class_getName(superClass)];
        
        [descriptionString appendString:[self getPropertyValuesForClass:oldClass andStep:step]];
        [step appendString:@"\t"];
    }
    
    [descriptionString appendString:@"}\n"];
    
    return descriptionString;
}

/**
 *  Составляем строку с описанием свойств класса
 *
 *
 *  @param class    Класс, свойства которого необходимо описать
 *  @return Строка с описанием полей
 */
- (NSString*)getPropertyValuesForClass:(Class)class andStep:(NSString*)step{
    NSMutableString *propertyString = [NSMutableString new];
    
    // Получаем массив свойств
    unsigned int countProperty = 0;
    objc_property_t *property = class_copyPropertyList(class, &countProperty);
    
    for (unsigned int i = 0; i < countProperty; i++) {
        // Получаем атрибут имени свойства
        char *attributeNameProperty = property_copyAttributeValue(property[i], "V");
        // Получаем атрибут типа свойства
        // @see https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101
        char *attributeTypeProperty = property_copyAttributeValue(property[i], "T");
        
        // Получаем значение свойства
        NSValue *value = [self valueForKey:[NSString stringWithFormat:@"%s", attributeNameProperty]];
        
        // Добавляем все в описание "> имя_свойства (тип_свойства) = значение_свойства"
        [propertyString appendFormat:@"%@ %s (%s) = %@\n", step, attributeNameProperty, attributeTypeProperty, value];
        
        // Освобождаем память
        free(attributeNameProperty);
        free(attributeTypeProperty);
    }
    
    // Освобождаем память
    free(property);
    
    return propertyString;
}

@end
