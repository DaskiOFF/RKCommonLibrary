//
//  NSString+RKNSStringCategory.m
//  tvbreak
//
//  Created by Roman Kotov on 16.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import "NSString+RKNSStringCategory.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (RKNSStringCategory)

- (BOOL)isEmpty {
    NSString *string = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return string.length == 0;
}

- (NSString *)md5String {
    const char *concat_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(concat_str, (int)strlen(concat_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [hash appendFormat:@"%02X", result[i]];
    
    return [hash lowercaseString];
}

+ (NSString *)md5String:(NSString *)string {
    return [string md5String];
}

@end
