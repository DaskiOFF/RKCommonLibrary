//
//  UIViewController+RKUIViewControllerCategory.h
//  
//
//  Created by Roman Kotov on 17.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RKUIViewControllerCategory)

/** Создает Navigation controller и устанавливает в корневой View Controller текущий */
- (UINavigationController*)rk_vcToNavController;

@end
