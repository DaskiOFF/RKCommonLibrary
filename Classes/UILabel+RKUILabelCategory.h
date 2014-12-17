//
//  UILabel+RKUILabelCategory.h
//  tvbreak
//
//  Created by Roman Kotov on 17.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (RKUILabelCategory)

/** Изменить высоту в зависимости от текста */
- (CGFloat)autoHeight;

/** Изменить ширину в зависимости от текста */
- (CGFloat)autoWidth;

@end
