//
//  NSDate+RKNSDateCategory.m
//  
//
//  Created by Roman Kotov on 16.12.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

#import "NSDate+RKNSDateCategory.h"

@implementation NSDate (RKNSDateCategory)

+ (NSString*)rk_nowStringWithFormat:(NSString*)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString*)rk_nowString {
    return [self rk_nowStringWithFormat:@"yyyy-MM-dd hh:mm:ss"];
}

+ (NSString*)rk_nowStringDate {
    return [self rk_nowStringWithFormat:@"yyyy-MM-dd"];
}

+ (NSString*)rk_nowStringTime {
    return [self rk_nowStringWithFormat:@"hh:mm:ss"];
}

+ (NSTimeInterval)timeIntervalSince1970 {
    return [NSDate date].timeIntervalSince1970;
}

- (NSString*)rk_stringWithFormat:(NSString*)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

- (NSString*)rk_string {
    return [self rk_stringWithFormat:@"yyyy-MM-dd hh:mm:ss"];
}

- (NSString*)rk_stringDate {
    return [self rk_stringWithFormat:@"yyyy-MM-dd"];
}

- (NSString*)rk_stringTime {
    return [self rk_stringWithFormat:@"hh:mm:ss"];
}

@end
