RKCommonLibrary
===============

Common Library for iOS Project

include
===========
pod 'RKCommonLibrary'

RKCL.h
===========
* rootVC - Возвращает корневой View Controller
* userDefaults - Возвращает userDefaults
* currentLocale - Возвращает текущую локаль
* isRussian - Возвращает булевское значение указывающее русская локаль или нет
* screenSize - Возвращает структуру содержащую размеры экрана
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
* + (void)safeWithBlock:catchBlock:finalyBlock: - Метод для безопасного выполнения кода
* + (void)safeWithBlock:catchBlock: - Метод для безопасного выполнения кода
* + (void)safeWithBlock: - Метод для безопасного выполнения кода

UIView+RKUIViewCategory.h
==============
- @property stringExtra -- Тэг view (свойство добавляемое в runtime)

- (void)autoHeight -- Изменение высоты view в зависимости от размеров содержащихся subview

- (void)shakeView -- Встряска из стороны в сторону

- (void)printSubviewsWithIndentation:(int)indentation -- Получаем текстовую иерархию view в NSLog

- (UIView *)viewWithStringExtra:(NSString *)tag -- Найти subview с указанным тегом

LICENSE
==============
The MIT License (MIT)

Copyright (c) 2014 Roman Kotov

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
