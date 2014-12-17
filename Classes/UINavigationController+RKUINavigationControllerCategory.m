//
//  UINavigationController+RKUINavigationControllerCategory.m
//  tvbreak
//
//  Created by Roman Kotov on 17.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import "UINavigationController+RKUINavigationControllerCategory.h"

@implementation UINavigationController (RKUINavigationControllerCategory)

@dynamic backButtonTitle;

- (void)setBackButtonTitle:(NSString *)backButtonTitle {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:backButtonTitle style:UIBarButtonItemStyleBordered target:self action:nil];
    self.navigationBar.topItem.backBarButtonItem = button;
}

@end
