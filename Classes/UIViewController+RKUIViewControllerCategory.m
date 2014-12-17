//
//  UIViewController+RKUIViewControllerCategory.m
//  tvbreak
//
//  Created by Roman Kotov on 17.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import "UIViewController+RKUIViewControllerCategory.h"
#import <UIColor+RKUIColorCategory.h>

@implementation UIViewController (RKUIViewControllerCategory)

- (UINavigationController*)toNavController {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
    
    nav.navigationBar.tintColor = [UIColor whiteColor];
    //    nav.navigationBar.barStyle = UIBarStyleBlack;
    //    nav.navigationBar.barTintColor = [UIColor colorWithWhite:.5 alpha:.1];//[UIColor colorWithHex:@"#8e96c2"];
    
//    if (isIpad) {
//        [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"Background-HeaderNavigationIPAD"] forBarMetrics:UIBarMetricsDefault];
//    } else {
//        [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"Background-HeaderNavigation"] forBarMetrics:UIBarMetricsDefault];
//    }
    nav.navigationBar.translucent = YES;
    
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(0, -20, MAX(screenSize.width, screenSize.height),nav.navigationBar.frame.size.height + 20);
//    layer.backgroundColor = [UIColor colorWithHex:@"#df4568" alpha:.75].CGColor;
//    layer.zPosition = -5;
//    [nav.navigationBar.layer addSublayer:layer];
    
//    [nav.navigationBar setShadowImage:[[UIImage alloc] init]];
//    
//    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    return nav;
}

@end
