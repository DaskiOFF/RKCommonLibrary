//
//  NSObject+RKNSObjectCategory.m
//  
//
//  Created by Roman Kotov on 16.02.15.
//  Copyright (c) 2015 Roman Kotov. All rights reserved.
//

#import "NSObject+RKNSObjectCategory.h"

@implementation NSObject (RKNSObjectCategory)

+ (BOOL)isNilObject:(NSObject*)object {
    return [object isNil];
}

- (BOOL)isNil {
    return self == nil || [self isEqual:[NSNull null]];
}

@end
