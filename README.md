RKCommonLibrary
===============
Common Library for iOS Project. 
Attention, version 0.2.x brings a change of method names compared to 0.1.x!

Библиотека общих методов для iOS проектов. 
Внимание, версия 0.2.x несет в себе изменение имен методов по сравнению с 0.1.x!

Contacts
===============
* waydeveloper@gmail.com
* http://waydeveloper.com
* http://vk.com/daskioff

include
===========
	pod 'RKCommonLibrary'

	#include "RKCommonLibrary.h"

RKDefines.h
===========
* UUIDString - Возвращает UDID устройства в виде строки
* rootVC - Возвращает корневой View Controller
* userDefaults - Возвращает userDefaults
* classToString(myClass) - Возвращает имя класса в виде строки
* NotificationAdd(sel,nameNotif) - Подписаться на уведомление о событии
* NotificationPost(name) - Отправить уведомление о событии
* currentLocale - Возвращает текущую локаль
* rk_mainBundle - [NSBundle mainBundle]
* isRussian - Возвращает булевское значение указывающее русская локаль или нет
* screenSize - Возвращает структуру содержащую размеры экрана
* SCREEN_HEIGHT_LANSCAPE - Возвращает высоту экрана в альбомной ориентации (для поддержки iOS7 и iOS8)
* SCREEN_WIDTH_LANDSCAPE - Возвращает ширину экрана в альбомной ориентации (для поддержки iOS7 и iOS8)
* isIpad - Возвращает значение является ли данная модель iPad
* isIphone4 - Возвращает значение является ли данная модель телефона iPhone 4
* isIphone5 - Возвращает значение является ли данная модель телефона iPhone 5
* isIphone6 - Возвращает значение является ли данная модель телефона iPhone 6
* isIphone6Plus - Возвращает значение является ли данная модель телефона iPhone 6+
* SYSTEM_VERSION_EQUAL_TO(v) - Возвращает значение равна ли данная версия ОС v
* SYSTEM_VERSION_GREATER_THAN(v) - Возвращает значение данная версия ОС больше v или нет
* SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) - Возвращает значение данная версия ОС больше или равна v или нет
* SYSTEM_VERSION_LESS_THAN(v) - Возвращает значение данная версия ОС меньше v или нет
* SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) - Возвращает значение данная версия ОС меньше или равна v или нет
* randFromTo(min, max) - Возвращает рандомное число в заданном диапазоне
* assetByScreenHeight(regular, longScreen) - Какое смещение делать относительно высоты экрана (Проверка на версию телефона iPhone 4)
* RGB(r, g, b) - Получить цвет согласно RGB
* RGBA(r, g, b, a) - Получить цвет согласно RGB с заданной прозрачностью (alpha)
* ClearColor - Получить прозрачный цвет
* DOLog - Вывести в лог с форматом, если режим отладки, иначе ничего не делать
* DODiscLog - Вывести в лог @"%@", если режим отладки, иначе ничего не делать

RKBaseClass Class
==============
Базовый класс, в котором перегружен метод description, который выводит информацию о свойствах класса.

Реализован парсинг JSON с помощью runtime.h;

Реализовано копирование [object copy]

* + (instancetype)initWithJson: - Создание объекта с данными предоставленными в JSON. Имена !свойств! должны совпадать с ключами в JSON
* + (NSArray*)initArrayWithJsonArray: - Создание массива объектов с данными предоставленными в JSON. Имена !свойств! должны совпадать с ключами в JSON
* - (instancetype)initWithJson: - Создание объекта с данными предоставленными в JSON. Имена !свойств! должны совпадать с ключами в JSON
* - (NSString*)rk_classStringForField: - Метод возвращающий название класса, объекты которого должны быть созданны согласно данным в JSON
* - (NSDictionary*)rk_keysForField - Метод возвращающий словарь {fieldName:jsonKey} для мапинга
* + (instancetype)initWithData: - Создание объекта с данными предоставленными в NSData которые были созданы с помощью метода serializeToData или с помощью класса NSKeyedArchiver
* - (instancetype)initWithData: - Создание объекта с данными предоставленными в NSData которые были созданы с помощью метода serializeToData или с помощью класса NSKeyedArchiver
* - (NSData*)rk_serializeToData - Сериализует объект в NSData для последующего сохранения

RKCL Class
==============
* + (void)rk_safeWithBlock:catchBlock:finalyBlock: - Метод для безопасного выполнения кода
* + (void)rk_safeWithBlock:catchBlock: - Метод для безопасного выполнения кода
* + (void)rk_safeWithBlock: - Метод для безопасного выполнения кода
* + (void)rk_performBlock:delay: - Выполнение блока с указанной задержкой
* + (void)rk_clearCookies - Быстрая очистка cookies в NSHTTPCookieStorage
* + (CGSize)rk_frameForText:sizeWithFont:constrainedToSize: - Возвращает размер frame для размещения текста
* + (NSString*)rk_endingForNumber:andEnding: - Функция возвращает окончание для множественного числа слова на основании числа и массива окончаний

NSObject+RKNSObjectCategory.h
==============
* + (BOOL)isNilObject:(NSObject*)object - Возвращает логическое значение является ли объект object == nil
* - (BOOL)isNil - Возвращает логическое значение является ли объект nil

UIImage+RKUIImageCategory.h
==============
* + (UIImage *)imageWithColor:(UIColor *)color - создает UIImage с указанным цветом фона
* + (void)cornerRadiusForPicture:(UIImage*)image imageView:(UIImageView*)imageView radius:(CGFloat)radius;
* + (UIImage*)cornerRadiusForPicture:(UIImage*)image radius:(CGFloat)radius;

UITableView+RKUITableViewCategory
==============
* - (void)rk_registerNibWithClass:(Class)class - Регистрация ячейки c Xib для класса class с использованием NSStringForClass

UIView+RKUIViewCategory.h
==============
* @property (nonatomic, copy) NSString *rk_stringExtra - Тэг view (свойство добавляемое в runtime)
* @property (nonatomic, assign) CGFloat x - Координата X
* @property (nonatomic, assign) CGFloat y - Координата Y
* @property (nonatomic, assign) CGFloat width - Ширина
* @property (nonatomic, assign) CGFloat height - Высота
* @property (nonatomic, assign) CGPoint origin - Точка отсчета
* @property (nonatomic, assign) CGSize size - Размеры
* @property (nonatomic, assign) CGFloat centerX - Координата X центра
* @property (nonatomic, assign) CGFloat centerY - Координата Y центра
* @property (nonatomic, assign) CGFloat top - Верхний край
* @property (nonatomic, assign) CGFloat bottom - Нижний край
* @property (nonatomic, assign) CGFloat left - Левый край
* @property (nonatomic, assign) CGFloat right - Правый край
* - (void)setZeroConstraints: - Привязываем View ко всем краям superView
* - (void)autoHeight - Изменение высоты view в зависимости от размеров содержащихся subview
* - (void)rk_shakeView - Встряска из стороны в сторону
* - (void)rk_printSubviewsWithIndentation: - Получаем текстовую иерархию view в NSLog
* - (UIView *)rk_viewWithStringExtra: - Найти subview с указанным тегом

NSString+RKNSStringCategory.h
==============
* - (BOOL)isEmpty - Возвращает YES, если строка явялется пустой, иначе NO
* - (NSString *)md5String - Возвращает MD5 строки
* + (NSString *)md5String: - Возвращает MD5 строки

NSDate+RKNSDateCategory.h
==============
* + (NSString*)rk_nowStringWithFormat:(NSString*)format - Текущая дата в пользовательском формате
* + (NSString*)rk_nowString - Текущая дата в формате yyyy-MM-dd hh:mm:ss
* + (NSString*)rk_nowStringDate - Текущая дата в формате yyyy-MM-dd
* + (NSString*)rk_nowStringTime - Текущее время в формате hh:mm:ss
* + (NSTimeInterval)timeIntervalSince1970 - Возвращает количество секунд с 1.1.1970
* - (NSString*)rk_stringWithFormat:(NSString*)format - Дата в пользовательском формате
* - (NSString*)rk_string - Дата в формате yyyy-MM-dd hh:mm:ss
* - (NSString*)rk_stringDate - Дата в формате yyyy-MM-dd
* - (NSString*)rk_stringTime - Время в формате hh:mm:ss

UIColor+RKUIColorCategory.h
==============
* + (UIColor*)rk_colorWithHex:alpha: - Возвращает UIColor по hex значению и значению прозрачности
* + (UIColor *)rk_colorWithHex: - Возвращает UIColor по hex значению

UIViewController+RKUIViewControllerCategory.h
==============
* - (UINavigationController*)rk_vcToNavController - Создает Navigation controller и устанавливает в корневой View Controller текущий

UINavigationController+RKUINavigationControllerCategory.h
==============
* @property (nonatomic, strong) NSString* backButtonTitle - Текст кнопки "назад"

UILabel+RKUILabelCategory.h
==============
* - (CGFloat)autoHeight - Изменить высоту в зависимости от текста
* - (CGFloat)autoWidth - Изменить ширину в зависимости от текста

LICENSE
==============
The MIT License (MIT)

Copyright (c) 2015 Roman Kotov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
