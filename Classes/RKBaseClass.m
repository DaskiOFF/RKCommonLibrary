//
//  RKBaseClass.m
//  
//
//  Created by Roman Kotov on 10.02.15.
//  Copyright (c) 2015 Roman Kotov. All rights reserved.
//

#import "RKBaseClass.h"
#import <objc/runtime.h>

@implementation RKBaseClass

#pragma mark -
#pragma mark Init
+ (instancetype)initWithJson:(NSDictionary*)json {
    return [[[self class] alloc] initWithJson:json];
}

+ (NSArray*)initArrayWithJsonArray:(NSArray*)jsonArray {
    NSMutableArray *resultArray = [NSMutableArray new];
    
    for (NSDictionary *json in jsonArray) {
        [resultArray addObject:[[[self class] alloc] initWithJson:json]];
    }
    
    return resultArray;
}

- (instancetype)initWithJson:(NSDictionary*)json {
    self = [super init];
    if (self) {
        /// Заполняем поля текущего класса
        [self getValuesForClass:[self class] withJson:json];
        
        /// Получаем суперкласс текущего
        Class superClass = class_getSuperclass([self class]);
        // Заполняем поля родительских классов
        while (superClass != [NSObject class]) {
            Class oldClass = superClass;
            superClass = class_getSuperclass(superClass);
            [self getValuesForClass:oldClass withJson:json];
        }
    }
    
    return self;
}

- (void)getValuesForClass:(Class)class withJson:(NSDictionary*)json {
    [self enumerateFieldsForClass:class withActionBlock:^(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty) {
        if (atrTypeProperty[0] == '@') {
            // Тип свойства начинается с символа @ => это объект
            if ([json[atrNamePropertyKey] isKindOfClass:[NSDictionary class]]) {
                // Объект в json похож на вложенный json. Получаем тип данного свойства и инициализаируем его
                NSString *className = [NSString stringWithFormat:@"%s", (atrTypeProperty + 2)];
                className = [className substringToIndex:className.length - 1];
                if ([className isEqualToString:@"NSDictionary"]) {
                    [self setValue:json[atrNamePropertyKey]
                            forKey:atrNameProperty];
                }
                else if ([className isEqualToString:@"NSMutableDictionary"]) {
                    [self setValue:[json[atrNamePropertyKey] mutableCopy]
                            forKey:atrNameProperty];
                }
                else {
                    [self setValue:[[NSClassFromString(className) alloc] initWithJson:json[atrNamePropertyKey]]
                            forKey:atrNameProperty];
                }
            }
            else if ([json[atrNamePropertyKey] isKindOfClass:[NSArray class]]) {
                // Если объект в json это массив, то запросим какой класс там должен храниться
                NSString *className = [self classStringForField:atrNamePropertyKey];
                if (className) {
                    NSArray *arrayForField = nil;
                    if ([className isEqualToString:@"NSDictionary"] || [className isEqualToString:@"NSMutableDictionary"]) {
                        arrayForField = json[atrNamePropertyKey];
                    }
                    else {
                        arrayForField = [NSClassFromString(className) initArrayWithJsonArray:json[atrNamePropertyKey]];
                    }
                    [self setValue:arrayForField forKey:atrNameProperty];
                }
            }
            else {
                [self setValue:[json objectForKey:atrNamePropertyKey] forKey:atrNameProperty];
            }
        }
        else {
            [self setValue:[json valueForKey:atrNamePropertyKey] forKey:atrNameProperty];
        }
    }];
}

- (NSString*)classStringForField:(NSString*)fieldName {
    return @"NSDictionary";
}

#pragma mark -
#pragma mark Init with Data
+ (instancetype)initWithData:(NSData *)data {
    return [[self alloc] initWithData:data];
}

- (instancetype)initWithData:(NSData *)data {
    if (!data) {
        return [super init];
    }
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

#pragma mark -
#pragma mark Serialize
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        /// Заполняем поля текущего класса
        [self getValuesForClass:[self class] withCoder:coder];
        
        /// Получаем суперкласс текущего
        Class superClass = class_getSuperclass([self class]);
        // Заполняем поля родительских классов
        while (superClass != [NSObject class]) {
            Class oldClass = superClass;
            superClass = class_getSuperclass(superClass);
            [self getValuesForClass:oldClass withCoder:coder];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    /// Заполняем поля текущего класса
    [self codeValuesForClass:[self class] withCoder:aCoder];
    
    /// Получаем суперкласс текущего
    Class superClass = class_getSuperclass([self class]);
    // Заполняем поля родительских классов
    while (superClass != [NSObject class]) {
        Class oldClass = superClass;
        superClass = class_getSuperclass(superClass);
        [self codeValuesForClass:oldClass withCoder:aCoder];
    }
}

- (void)getValuesForClass:(Class)class withCoder:(NSCoder*)coder {
    [self enumerateFieldsForClass:class withActionBlock:^(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty) {
        id object = [coder decodeObjectForKey:atrNamePropertyKey];
        
        switch (atrTypeProperty[0]) {
        case _C_CHR:
            [self setValue:@([object charValue]) forKey:atrNameProperty];
            break;
        case _C_INT:
            [self setValue:@([object intValue]) forKey:atrNameProperty];
            break;
        case _C_SHT:
            [self setValue:@([object shortValue]) forKey:atrNameProperty];
            break;
        case _C_LNG:
            [self setValue:@([object longValue]) forKey:atrNameProperty];
            break;
        case _C_LNG_LNG:
            [self setValue:@([object longLongValue]) forKey:atrNameProperty];
            break;
        case _C_UCHR:
            [self setValue:@([object unsignedCharValue]) forKey:atrNameProperty];
            break;
        case _C_UINT:
            [self setValue:@([object unsignedIntValue]) forKey:atrNameProperty];
            break;
        case _C_USHT:
            [self setValue:@([object unsignedShortValue]) forKey:atrNameProperty];
            break;
        case _C_ULNG:
            [self setValue:@([object unsignedLongValue]) forKey:atrNameProperty];
            break;
        case _C_ULNG_LNG:
            [self setValue:@([object unsignedLongLongValue]) forKey:atrNameProperty];
            break;
        case _C_FLT:
            [self setValue:@([object floatValue]) forKey:atrNameProperty];
            break;
        case _C_DBL:
            [self setValue:@([object doubleValue]) forKey:atrNameProperty];
            break;
        case _C_BOOL:
            [self setValue:@([object boolValue]) forKey:atrNameProperty];
            break;
        case _C_ID:
            [self setValue:object forKey:atrNameProperty];
            break;
        case _C_CLASS:
            [self setValue:NSClassFromString([object description]) forKey:atrNameProperty];
            break;
        default: {
                NSString *string = [object description];
                if (strcmp(atrTypeProperty, @encode(CGAffineTransform)) == 0)
                    [self setValue:[NSValue valueWithCGAffineTransform:CGAffineTransformFromString(string)] forKey:atrNameProperty];
                else if (strcmp(atrTypeProperty, @encode(CGPoint)) == 0)
                    [self setValue:[NSValue valueWithCGPoint:CGPointFromString(string)] forKey:atrNameProperty];
                else if (strcmp(atrTypeProperty, @encode(CGRect)) == 0)
                    [self setValue:[NSValue valueWithCGRect:CGRectFromString(string)] forKey:atrNameProperty];
                else if (strcmp(atrTypeProperty, @encode(CGSize)) == 0)
                    [self setValue:[NSValue valueWithCGSize:CGSizeFromString(string)] forKey:atrNameProperty];
                else if (strcmp(atrTypeProperty, @encode(NSRange)) == 0)
                    [self setValue:[NSValue valueWithRange:NSRangeFromString(string)] forKey:atrNameProperty];
                else if (strcmp(atrTypeProperty, @encode(UIEdgeInsets)) == 0)
                    [self setValue:[NSValue valueWithUIEdgeInsets:UIEdgeInsetsFromString(string)] forKey:atrNameProperty];
                else if (strcmp(atrTypeProperty, @encode(UIOffset)) == 0)
                    [self setValue:[NSValue valueWithUIOffset:UIOffsetFromString(string)] forKey:atrNameProperty];
            }
        }
    }];
}

- (void)codeValuesForClass:(Class)class withCoder:(NSCoder*)coder {
    [self enumerateFieldsForClass:class withActionBlock:^(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty) {
        id object = [self valueForKey:atrNameProperty];
        
        switch (atrTypeProperty[0]) {
            case _C_CHR:
                [coder encodeObject:@([object charValue]) forKey:atrNamePropertyKey];
                break;
            case _C_INT:
                [coder encodeObject:@([object intValue]) forKey:atrNamePropertyKey];
                break;
            case _C_SHT:
                [coder encodeObject:@([object shortValue]) forKey:atrNamePropertyKey];
                break;
            case _C_LNG:
                [coder encodeObject:@([object longValue]) forKey:atrNamePropertyKey];
                break;
            case _C_LNG_LNG:
                [coder encodeObject:@([object longLongValue]) forKey:atrNamePropertyKey];
                break;
            case _C_UCHR:
                [coder encodeObject:@([object unsignedCharValue]) forKey:atrNamePropertyKey];
                break;
            case _C_UINT:
                [coder encodeObject:@([object unsignedIntValue]) forKey:atrNamePropertyKey];
                break;
            case _C_USHT:
                [coder encodeObject:@([object unsignedShortValue]) forKey:atrNamePropertyKey];
                break;
            case _C_ULNG:
                [coder encodeObject:@([object unsignedLongValue]) forKey:atrNamePropertyKey];
                break;
            case _C_ULNG_LNG:
                [coder encodeObject:@([object unsignedLongLongValue]) forKey:atrNamePropertyKey];
                break;
            case _C_FLT:
                [coder encodeObject:@([object floatValue]) forKey:atrNamePropertyKey];
                break;
            case _C_DBL:
                [coder encodeObject:@([object doubleValue]) forKey:atrNamePropertyKey];
                break;
            case _C_BOOL:
                [coder encodeObject:@([object boolValue]) forKey:atrNamePropertyKey];
                break;
            case _C_ID:
                [coder encodeObject:object forKey:atrNamePropertyKey];
                break;
            case _C_CLASS:
                [coder encodeObject:NSClassFromString([object description]) forKey:atrNamePropertyKey];
                break;
            default: {
                if (strcmp(atrTypeProperty, @encode(CGAffineTransform)) == 0)
                    [coder encodeObject:NSStringFromCGAffineTransform([object CGAffineTransformValue]) forKey:atrNamePropertyKey];
                else if (strcmp(atrTypeProperty, @encode(CGPoint)) == 0)
                    [coder encodeObject:NSStringFromCGPoint([object CGPointValue]) forKey:atrNamePropertyKey];
                else if (strcmp(atrTypeProperty, @encode(CGRect)) == 0)
                    [coder encodeObject:NSStringFromCGRect([object CGRectValue]) forKey:atrNamePropertyKey];
                else if (strcmp(atrTypeProperty, @encode(CGSize)) == 0)
                    [coder encodeObject:NSStringFromCGSize([object CGSizeValue]) forKey:atrNamePropertyKey];
                else if (strcmp(atrTypeProperty, @encode(NSRange)) == 0)
                    [coder encodeObject:NSStringFromRange([object rangeValue]) forKey:atrNamePropertyKey];
                else if (strcmp(atrTypeProperty, @encode(UIEdgeInsets)) == 0)
                    [coder encodeObject:NSStringFromUIEdgeInsets([object UIEdgeInsetsValue]) forKey:atrNamePropertyKey];
                else if (strcmp(atrTypeProperty, @encode(UIOffset)) == 0)
                    [coder encodeObject:NSStringFromUIOffset([object UIOffsetValue]) forKey:atrNamePropertyKey];
            }
        }
    }];
}

- (NSData*)serializeToData {
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

#pragma mark -
#pragma mark Description
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
    __block NSMutableString *propertyString = [NSMutableString new];
    
    [self enumerateFieldsForClass:class withActionBlock:^(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty) {
        // Получаем значение свойства
        NSValue *value = [self valueForKey:atrNameProperty];
        
        // Добавляем все в описание "> имя_свойства (тип_свойства) = значение_свойства"
        [propertyString appendFormat:@"%@ %@ (%s) = %@\n", step, atrNameProperty, atrTypeProperty, value];
    }];

    return propertyString;
}

#pragma mark -
#pragma mark Enumerate fields
- (void)enumerateFieldsForClass:(Class)class withActionBlock:(void(^)(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty))actionBlock {
    // Получаем массив свойств
    unsigned int countProperty = 0;
    objc_property_t *property = class_copyPropertyList(class, &countProperty);
    
    for (unsigned int i = 0; i < countProperty; i++) {
        // Получаем атрибут имени свойства
        char *attributeNameProperty = property_copyAttributeValue(property[i], "V");
        NSString *attributeNameKey = [NSString stringWithFormat:@"%s", (attributeNameProperty + 1)];
        // Получаем атрибут типа свойства
        // @see https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101
        char *attributeTypeProperty = property_copyAttributeValue(property[i], "T");
        
        @try {
            if (actionBlock) {
                actionBlock([NSString stringWithFormat:@"%s", attributeNameProperty],
                            attributeNameKey,
                            attributeTypeProperty);
            }
        }
        @catch (NSException *exception) {
            NSLog(@"Exception in enumerateFieldsForClassWithActionBlock. %@", exception.description);
        }
        
        // Освобождаем память
        free(attributeNameProperty);
        free(attributeTypeProperty);
    }
    
    // Освобождаем память
    free(property);
}

@end
