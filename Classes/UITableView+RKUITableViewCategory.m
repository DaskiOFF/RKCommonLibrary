//
//  UITableView+RKUITableViewCategory.m
//  Pods
//
//  Created by Roman Kotov on 24.04.15.
//
//

#import "UITableView+RKUITableViewCategory.h"

@implementation UITableView (RKUITableViewCategory)

- (void)rk_registerNibWithClass:(Class)class {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass(class)];
}

@end
