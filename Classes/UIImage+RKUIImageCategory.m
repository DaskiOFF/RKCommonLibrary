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

+ (void)rk_cornerRadiusForPicture:(UIImage*)image imageView:(UIImageView*)imageView radius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                cornerRadius:radius] addClip];
    
    [image drawInRect:imageView.bounds];
    
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
}

+ (UIImage*)rk_cornerRadiusForPicture:(UIImage*)image radius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, [UIScreen mainScreen].scale);
    
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, image.size.width, image.size.height)
                                cornerRadius:radius] addClip];
    
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
