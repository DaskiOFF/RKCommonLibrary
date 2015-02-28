//
//  RKBaseClass.h
//  
//
//  Created by Roman Kotov on 10.02.15.
//  Copyright (c) 2015 Roman Kotov. All rights reserved.
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
- (NSData*)rk_serializeToData;

/**
 *  Метод возвращающий название класса, объекты которого
 *  должны быть созданны согласно данным в JSON
 *  !Перегружая метод ОБЯЗАТЕЛЬНО вызывать его у родителя!
 *
 *  @param  fieldName   Имя свойства класса типа NSArray
 *  @return Название класса содержащегося в массиве или nil
 */
- (NSString*)rk_classStringForField:(NSString*)fieldName;

@end
