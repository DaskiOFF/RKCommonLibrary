RKCommonLibrary
===============

Common Library for iOS Project

Contacts
===============
* waydeveloper@gmail.com
* http://waydeveloper.com
* http://vk.com/daskioff

include
===========
pod 'RKCommonLibrary'

RKCL.h
===========
* UDIDString - Возвращает UDID устройства в виде строки
* rootVC - Возвращает корневой View Controller
* userDefaults - Возвращает userDefaults
* NotificationAdd(sel,nameNotif) - Подписаться на уведомление о событии
* NotificationPost(name) - Отправить уведомление о событии
* currentLocale - Возвращает текущую локаль
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
Базовый класс, в котором перегружен метод description, который выводит информацию о свойствах класса
Реализован парсинг JSON с помощью runtime.h

* + (instancetype)initWithJson: - Создание объекта с данными предоставленными в JSON. Имена !свойств! должны совпадать с ключами в JSON
* + (NSArray*)initArrayWithJsonArray: - Создание массива объектов с данными предоставленными в JSON. Имена !свойств! должны совпадать с ключами в JSON
* - (instancetype)initWithJson: - Создание объекта с данными предоставленными в JSON. Имена !свойств! должны совпадать с ключами в JSON
* - (NSString*)classStringForField: - Метод возвращающий название класса, объекты которого должны быть созданны согласно данным в JSON

RKCL Class
==============
* + (void)safeWithBlock:catchBlock:finalyBlock: - Метод для безопасного выполнения кода
* + (void)safeWithBlock:catchBlock: - Метод для безопасного выполнения кода
* + (void)safeWithBlock: - Метод для безопасного выполнения кода
* + (void)performBlock:delay: - Выполнение блока с указанной задержкой
* + (void)clearCookies - Быстрая очистка cookies в NSHTTPCookieStorage
* + (CGSize)frameForText:sizeWithFont:constrainedToSize: - Возвращает размер frame для размещения текста

NSObject+RKNSObjectCategory.h
==============
* + (BOOL)isNilObject:(NSObject*)object - Возвращает логическое значение является ли объект object == nil
* - (BOOL)isNil - Возвращает логическое значение является ли объект nil

UIImage+RKUIImageCategory.h
==============
* + (UIImage *)imageWithColor:(UIColor *)color - создает UIImage с указанным цветом фона

UIView+RKUIViewCategory.h
==============
* @property stringExtra - Тэг view (свойство добавляемое в runtime)
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
* - (void)autoHeight - Изменение высоты view в зависимости от размеров содержащихся subview
* - (void)shakeView - Встряска из стороны в сторону
* - (void)printSubviewsWithIndentation: - Получаем текстовую иерархию view в NSLog
* - (UIView *)viewWithStringExtra: - Найти subview с указанным тегом

NSString+RKNSStringCategory.h
==============
* - (BOOL)isEmpty - Возвращает YES, если строка явялется пустой, иначе NO
* - (NSString *)md5String - Возвращает MD5 строки
* + (NSString *)md5String: - Возвращает MD5 строки

NSDate+RKNSDateCategory.h
==============
* + (NSString*)nowStringWithFormat:(NSString*)format - Текущая дата в пользовательсом формате
* + (NSString*)nowString - Текущая дата в формате yyyy-MM-dd hh:mm:ss
* + (NSString*)nowStringDate - Текущая дата в формате yyyy-MM-dd
* + (NSString*)nowStringTime - Текущее время в формате hh:mm:ss
* + (NSTimeInterval)timeIntervalSince1970 - Возвращает количество секунд с 1.1.1970
* - (NSString*)stringWithFormat:(NSString*)format - Дата в пользовательсом формате
* - (NSString*)string - Дата в формате yyyy-MM-dd hh:mm:ss
* - (NSString*)stringDate - Дата в формате yyyy-MM-dd
* - (NSString*)stringTime - Время в формате hh:mm:ss

UIColor+RKUIColorCategory.h
==============
* + (UIColor*)colorWithHex:alpha: - Возвращает UIColor по hex значению и значению прозрачности
* + (UIColor *)colorWithHex: - Возвращает UIColor по hex значению

UIViewController+RKUIViewControllerCategory.h
==============
* - (UINavigationController*)toNavController - Создает Navigation controller и устанавливает в корневой View Controller текущий

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
