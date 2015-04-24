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
#pragma mark Init with Json
+ (instancetype)initWithJson:(NSDictionary*)json
{
    return [[[self class] alloc] initWithJson:json];
}

- (instancetype)initWithJson:(NSDictionary*)json
{
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

#pragma mark -
#pragma mark Init array with Json
+ (NSArray*)initArrayWithJsonArray:(NSArray*)jsonArray
{
    NSMutableArray *resultArray = [NSMutableArray new];
    
    for (NSDictionary *json in jsonArray) {
        [resultArray addObject:[[[self class] alloc] initWithJson:json]];
    }
    
    return resultArray;
}

#pragma mark -
#pragma mark Init with Data
+ (instancetype)initWithData:(NSData *)data
{
    return [[self alloc] initWithData:data];
}

- (instancetype)initWithData:(NSData *)data
{
    if (!data) {
        return [super init];
    }
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

#pragma mark -
#pragma mark Init with Coder
- (instancetype)initWithCoder:(NSCoder *)coder
{
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

- (void)encodeWithCoder:(NSCoder *)aCoder
{
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

/**
 *  Считаем, что префикс "NS" сторонний разработчик не использует
 *
 *  1) Создаем новый объект
 *  2) Перебираем все его свойства и инициализируем их по следующему правилу
 *      a) Если тип является типом apple, то по префиксу определяем какую копию делать
 *      b) В остальных случаях делаем неизменяемую копию
 *  3) Возвращаем инициализированный объект, который является копией текущего
 */
- (id)copyWithZone:(NSZone *)zone
{
    RKBaseClass *newObject = [[[self class] allocWithZone:zone] init];

    const char *prefixMutableClass = "NSMutable";
    
    [self enumerateFieldsForClass:[self class] withActionBlock:^(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty) {
        id value = [self valueForKey:atrNameProperty];
        
        if (isAppleClassWithType(atrTypeProperty)) {
            if (strstr(atrTypeProperty + 2, prefixMutableClass) != NULL) {
                [newObject setValue:[value mutableCopy] forKey:atrNameProperty];
            }
            else {
                [newObject setValue:[value copy] forKey:atrNameProperty];
            }
        }
        else {
            [newObject setValue:[value copy] forKey:atrNameProperty];
        }
    }];
    
    return newObject;
}

BOOL isAppleClassWithType(const char *type)
{
    return strlen(type) > 2 &&
        ((type[2] == 'N' && type[3] == 'S') ||
         type[0] == '_');
}

#pragma mark -
#pragma mark Serialize
- (void)getValuesForClass:(Class)class withCoder:(NSCoder*)coder
{
    [self enumerateFieldsForClass:class withActionBlock:^(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty) {
        id object = [coder decodeObjectForKey:atrNamePropertyKey];
        
        [self setValue:[self getValueFromObject:object withType:atrTypeProperty] forKey:atrNameProperty];
    }];
}

- (void)codeValuesForClass:(Class)class withCoder:(NSCoder*)coder
{
    [self enumerateFieldsForClass:class withActionBlock:^(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty) {
        id object = [self valueForKey:atrNameProperty];
        
        [coder encodeObject:[self getValueFromObject:object withType:atrTypeProperty]
                     forKey:atrNamePropertyKey];
    }];
}

- (NSData*)rk_serializeToData
{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

#pragma mark -
#pragma mark Description
- (NSString *)description
{
    NSMutableString *descriptionString = [[NSMutableString alloc] initWithString:@"\n"];
    NSString *step = @"\t";
    
    // Добавляем имя текущего и родительского классов
    Class superClass = class_getSuperclass([self class]);
    [descriptionString appendFormat:@"%s:  %s\n", object_getClassName(self), class_getName(superClass)];
    
    // Добавляем свойства текущего класса
    [descriptionString appendString:[self getPropertyValuesForClass:[self class] andStep:step]];
    
    // Добавляем свойсва родительских классов
    while (superClass != [NSObject class]) {
        Class oldClass = superClass;
        superClass = class_getSuperclass(superClass);
        
        [descriptionString appendFormat:@"%s:  %s\n", class_getName(oldClass), class_getName(superClass)];
        
        [descriptionString appendString:[self getPropertyValuesForClass:oldClass andStep:step]];
    }
    
    [descriptionString appendString:@"\n"];
    
    return descriptionString;
}

/**
 *  Составляем строку с описанием свойств класса
 *
 *
 *  @param class    Класс, свойства которого необходимо описать
 *  @param step     Отступ от края, для свойств
 *  @return Строка с описанием полей
 */
- (NSString*)getPropertyValuesForClass:(Class)class andStep:(NSString*)step
{
    __block NSMutableString *propertyString = [NSMutableString new];
    
    [self enumerateFieldsForClass:class withActionBlock:^(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty) {
        // Получаем значение свойства
        NSValue *value = [self valueForKey:atrNameProperty];
        
        // Добавляем все в описание "> имя_свойства (тип_свойства) = значение_свойства"
        [propertyString appendFormat:@"%@ %@ (%s) = %@\n", step, atrNamePropertyKey, atrTypeProperty, value];
    }];
    
    return propertyString;
}

#pragma mark -
#pragma mark Accessory
/**
 *  Перечисляет все свойства класса и вызывает блок для каждого из них
 *
 *  @param  class       Класс, свойства которого будем перебирать
 *  @param  actionBlock Блок, который будет вызываться для каждого из свойств
 */
- (void)enumerateFieldsForClass:(Class)class withActionBlock:(void(^)(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty))actionBlock
{
    // Получаем массив свойств
    unsigned int countProperty = 0; /** Количество свойств */
    objc_property_t *property = class_copyPropertyList(class, &countProperty); /** Массив свойств */
    
    for (unsigned int i = 0; i < countProperty; i++) {
        // Получаем атрибут имени свойства (iVar переменной с префиксом '_')
        char *attributeNameProperty = property_copyAttributeValue(property[i], "V");
        if (attributeNameProperty == NULL) {
            free(attributeNameProperty);
            continue;
        }
        // Убираем префикс
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
            NSLog(@"Exception in enumerateFieldsForClassWithActionBlock. (file: %s) %@", __FILE__, exception.description);
        }
        
        // Освобождаем память
        free(attributeNameProperty);
        free(attributeTypeProperty);
    }
    
    // Освобождаем память
    free(property);
}

- (id)getValueFromObject:(id)object withType:(char*)atrType
{
    switch (atrType[0]) {
        case _C_CHR:
            return @([object charValue]);
        case _C_INT:
            return @([object intValue]);
        case _C_SHT:
            return @([object shortValue]);
        case _C_LNG:
            return @([object longValue]);
        case _C_LNG_LNG:
            return @([object longLongValue]);
        case _C_UCHR:
            return @([object unsignedCharValue]);
        case _C_UINT:
            return @([object unsignedIntValue]);
        case _C_USHT:
            return @([object unsignedShortValue]);
        case _C_ULNG:
            return @([object unsignedLongValue]);
        case _C_ULNG_LNG:
            return @([object unsignedLongLongValue]);
        case _C_FLT:
            return @([object floatValue]);
        case _C_DBL:
            return @([object doubleValue]);
        case _C_BOOL:
            return @([object boolValue]);
        case _C_ID:
            return object;
        case _C_CLASS:
            return NSClassFromString([object description]);
        default: {
            if (strcmp(atrType, @encode(CGAffineTransform)) == 0)
                return NSStringFromCGAffineTransform([object CGAffineTransformValue]);
            else if (strcmp(atrType, @encode(CGPoint)) == 0)
                return NSStringFromCGPoint([object CGPointValue]);
            else if (strcmp(atrType, @encode(CGRect)) == 0)
                return NSStringFromCGRect([object CGRectValue]);
            else if (strcmp(atrType, @encode(CGSize)) == 0)
                return NSStringFromCGSize([object CGSizeValue]);
            else if (strcmp(atrType, @encode(NSRange)) == 0)
                return NSStringFromRange([object rangeValue]);
            else if (strcmp(atrType, @encode(UIEdgeInsets)) == 0)
                return NSStringFromUIEdgeInsets([object UIEdgeInsetsValue]);
            else if (strcmp(atrType, @encode(UIOffset)) == 0)
                return NSStringFromUIOffset([object UIOffsetValue]);
        }
    }
    
    return nil;
}

/**
 *  Инициализируем свойства класса данными из Json
 *
 *
 *  @param  class   Класс, свойства которого будем инициализировать
 *  @param  json    json, из которого будем брать данные для свойств
 */
- (void)getValuesForClass:(Class)class withJson:(NSDictionary*)json
{
    [self enumerateFieldsForClass:class withActionBlock:^(NSString *atrNameProperty, NSString *atrNamePropertyKey, char *atrTypeProperty) {
        // Обновляем ключ JSON для мапинга
        atrNamePropertyKey = [self rk_keyStringForField:atrNamePropertyKey];

        if (atrTypeProperty[0] == '@') {
            // Если такого ключа нет, пропускаем инициализацию данного поля
            if (!json[atrNamePropertyKey] || [json[atrNamePropertyKey] isEqual:[NSNull null]]) {
                return;
            }
            
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
                NSString *className = [self rk_classStringForField:atrNamePropertyKey];
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
            // Если ключ содержится в json, инициализируем данное поле
            if (json[atrNamePropertyKey] && ![json[atrNamePropertyKey] isEqual:[NSNull null]]) {
                [self setValue:[json valueForKey:atrNamePropertyKey] forKey:atrNameProperty];
            }
        }
    }];
}

- (NSString*)rk_classStringForField:(NSString*)fieldName
{
    return @"NSDictionary";
}

- (NSDictionary *)rk_keysForField {
    return nil;
}

/**
 *  Получаем ключ для мапинга объекта в поле fieldName
 *  с данными из JSON по ключу который возвращает метод
 *
 *  @param  fieldName имя свойства, для которого необходимо получить ключ
 *  @return NSString ключ для JSON
 */
- (NSString *)rk_keyStringForField:(NSString *)fieldName {
    NSDictionary *mappingDictionary = [self rk_keysForField];
    
    if (mappingDictionary && mappingDictionary[fieldName]) {
        return mappingDictionary[fieldName];
    }
    
    return fieldName;
}

@end
