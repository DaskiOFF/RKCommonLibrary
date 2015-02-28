//
//  UIViewController+RKUIViewControllerCategory.m
//  
//
//  Created by Roman Kotov on 17.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import "UIViewController+RKUIViewControllerCategory.h"

@implementation UIViewController (RKUIViewControllerCategory)

- (UINavigationController*)rk_vcToNavController {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
    
    return nav;
}

@end
