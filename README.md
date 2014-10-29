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
* isIphone4 - Возвращает значение является ли данная модель телефона iPhone 4
* isIphone5 - Возвращает значение является ли данная модель телефона iPhone 5
* isIphone6 - Возвращает значение является ли данная модель телефона iPhone 6
* isIphone6Plus - Возвращает значение является ли данная модель телефона iPhone 6+
* randFromTo(min, max) - Возвращает рандомное число в заданном диапазоне
* assetByScreenHeight(regular, longScreen) - Какое смещение делать относительно высоты экрана (Проверка на версию телефона iPhone 4)


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
