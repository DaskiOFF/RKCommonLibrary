//
//  UIImage+RKUIImageCategory.m
//  
//
//  Created by Roman Kotov on 31.01.15.
//  Copyright (c) 2015 Roman Kotov. All rights reserved.
//

#import "UIImage+RKUIImageCategory.h"

@implementation UIImage (RKUIImageCategory)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
