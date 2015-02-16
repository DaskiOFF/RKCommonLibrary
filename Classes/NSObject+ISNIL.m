//
//  NSObject+ISNIL.m
//  BrainGame
//
//  Created by Roman Kotov on 16.02.15.
//  Copyright (c) 2015 Roman Kotov. All rights reserved.
//

#import "NSObject+ISNIL.h"

@implementation NSObject (ISNIL)

+ (BOOL)isNilObject:(NSObject*)object {
    return [object isNil];
}

- (BOOL)isNil {
    return self == nil || [self isEqual:[NSNull null]];
}

@end
