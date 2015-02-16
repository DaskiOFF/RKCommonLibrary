//
//  RKBaseClass.h
//  
//
//  Created by Roman Kotov on 10.02.15.
//  Copyright (c) 2015 Roman Kotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKBaseClass : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSNumber* id;
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, assign) NSUInteger count;

@end
