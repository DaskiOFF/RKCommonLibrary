//
//  UIColor+RKUIColorCategory.m
//  
//
//  Created by Roman Kotov on 17.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import "UIColor+RKUIColorCategory.h"

@implementation UIColor (RKUIColorCategory)

+ (UIColor*)rk_colorWithHex:(NSString*)hexColorString alpha:(float)alpha {
    // Значение по умолчанию
    UIColor *defaultColor = [UIColor blackColor];
    
    if ([hexColorString hasPrefix:@"#"] && [hexColorString length] > 1) {
        hexColorString = [hexColorString substringFromIndex:1];
    } else {
        return defaultColor;
    }
    
    NSUInteger componentLength = 0;
    if ([hexColorString length] == 3) {
        componentLength = 1;
    } else if ([hexColorString length] == 6) {
        componentLength = 2;
    } else {
        return defaultColor;
    }
    
    BOOL isValid = YES;
    CGFloat components[3];
    
    //Seperate the R,G,B values
    for (NSUInteger i = 0; i < 3; i++) {
        NSString *component = [hexColorString substringWithRange:NSMakeRange(componentLength * i, componentLength)];
        if (componentLength == 1) {
            component = [component stringByAppendingString:component];
        }
        NSScanner *scanner = [NSScanner scannerWithString:component];
        unsigned int value;
        isValid &= [scanner scanHexInt:&value];
        components[i] = (CGFloat)value / 255.0f;
    }
    
    if (!isValid) {
        return defaultColor;
    }
    
    return [UIColor colorWithRed:components[0]
                           green:components[1]
                            blue:components[2]
                           alpha:alpha];
}

+ (UIColor *)rk_colorWithHex:(NSString*)hexColorString {
    NSUInteger length = hexColorString.length;
    if (length == 9 || length == 5) {
        if ([hexColorString hasPrefix:@"#"]) {
            NSString *hexColor = [NSString stringWithFormat:@"#%@", [hexColorString substringFromIndex:(length == 9 ? 3 : 2)]];
            NSString *hexAlpha = [hexColorString substringWithRange:NSMakeRange(1, (length == 9 ? 2 : 1))];
            
            NSScanner *scanner = [NSScanner scannerWithString:hexAlpha];
            unsigned int alpha = 1;
            [scanner scanHexInt:&alpha];
            return [self rk_colorWithHex:hexColor alpha:(float)alpha / (length == 5 ? 15.0 : 255.0)];
        }
    }
    return [self rk_colorWithHex:hexColorString alpha:1];
}

@end
