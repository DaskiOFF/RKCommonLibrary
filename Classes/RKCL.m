//
//  RKCL.m
//  DOCommonElements
//
//  Created by Roman Kotov on 16.12.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

@implementation RKCL : NSObject

+ (void)safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock finalyBlock:(void (^)())finalyBlock {
    @try {
        if (block) {
            block();
        }
    }
    @catch (NSException *exception) {
        if (catchBlock) {
            catchBlock(exception);
        } else {
            DOLog(@"Exception: %@", exception.description);
        }
    }
    @finally {
        if (finalyBlock) {
            finalyBlock();
        }
    }
}

+ (void)safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock {
    [self safeWithBlock:block catchBlock:catchBlock finalyBlock:nil];
}

+ (void)safeWithBlock:(void (^)())block {
    [self safeWithBlock:block catchBlock:nil finalyBlock:nil];
}

@end