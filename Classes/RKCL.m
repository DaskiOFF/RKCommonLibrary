//
//  RKCL.m
//  
//
//  Created by Roman Kotov on 16.12.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

#import "RKCL.h"

@implementation RKCL : NSObject

+ (void)rk_safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock finalyBlock:(void (^)())finalyBlock {
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

+ (void)rk_safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock {
    [self rk_safeWithBlock:block catchBlock:catchBlock finalyBlock:nil];
}

+ (void)rk_safeWithBlock:(void (^)())block {
    [self rk_safeWithBlock:block catchBlock:nil finalyBlock:nil];
}

+ (void)rk_performBlock:(void (^)())block delay:(NSTimeInterval)delay {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        block();
    });
}

+ (void)rk_clearCookies {
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookies)
    {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
    DOLog(@"Cookies очищены!");
}

+ (CGSize)rk_frameForText:(NSString*)text sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size {
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          font, NSFontAttributeName,
                                          nil];
    CGRect frame = [text boundingRectWithSize:size
                                      options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                   attributes:attributesDictionary
                                      context:nil];
    
    return frame.size;
}

+ (NSString*)rk_endingForNumber:(NSInteger)number andEnding:(NSArray*)ending {
    if (!ending || ending.count < 3) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"endin.count must be == 3 in %@", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    
    number = number % 100;
    if (number >= 11 && number <= 19) {
        return ending[2];
    }
    else {
        switch (number % 10) {
            case 1:
                return ending[0];
            case 2:
            case 3:
            case 4:
                return ending[1];
            default:
                return ending[2];
        }
    }
}

@end