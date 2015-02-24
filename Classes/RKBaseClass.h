//
//  RKBaseClass.h
//  
//
//  Created by Roman Kotov on 10.02.15.
//  Copyright (c) 2015 Roman Kotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKBaseClass : NSObject

/**
 *  Создание объекта с данными предоставленными в JSON
 *  Имена !свойств! должны совпадать с ключами в JSON
 *
 *  @param  json    данные в формате json
 *  @return экземпляр объекта с заполненными данными
 */
+ (instancetype)initWithJson:(NSDictionary*)json;

/**
 *  Создание массива объектов с данными предоставленными в JSON
 *  Имена !свойств! должны совпадать с ключами в JSON
 *
 *  @param  jsonArray Массив данных в формате json
 *  @return экземпляр объекта с заполненными данными
 */
+ (NSArray*)initArrayWithJsonArray:(NSArray*)jsonArray;

/**
 *  Создание объекта с данными предоставленными в JSON
 *  Имена !свойств! должны совпадать с ключами в JSON
 *
 *  @param  json    данные в формате json
 *  @return экземпляр объекта с заполненными данными
 */
- (instancetype)initWithJson:(NSDictionary*)json;

/**
 *  Метод возвращающий название класса, объекты которого
 *  должны быть созданны согласно данным в JSON
 *
 *  @param  fieldName   Имя свойства класса типа NSArray
 *  @return Название класса содержащегося в массиве или nil
 */
- (NSString*)classStringForField:(NSString*)fieldName;

/**
 *  Создание объекта с данными предоставленными в NSData
 *  которые были созданы с помощью метода serializeToData
 *  или с помощью класса NSKeyedArchiver
 *
 *  @param  data    Сериализованный класс в NSData
 *  @return экземпляр объекта с заполненными данными
 */
+ (instancetype)initWithData:(NSData*)data;

/**
 *  Создание объекта с данными предоставленными в NSData
 *  которые были созданы с помощью метода serializeToData
 *  или с помощью класса NSKeyedArchiver
 *
 *  @param  data    Сериализованный класс в NSData
 *  @return экземпляр объекта с заполненными данными
 */
- (instancetype)initWithData:(NSData*)data;

/**
 *  Сериализует объект в NSData для последующего сохранения
 *
 *
 *  @return объект упакованный в NSData
 */
- (NSData*)serializeToData;

@end
