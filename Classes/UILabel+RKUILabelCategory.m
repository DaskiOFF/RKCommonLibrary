//
//  UILabel+RKUILabelCategory.m
//  
//
//  Created by Roman Kotov on 17.12.14.
//  Copyright (c) 2014 Kaerus. All rights reserved.
//

#import "UILabel+RKUILabelCategory.h"

@implementation UILabel (RKUILabelCategory)

- (CGFloat)autoHeight {
    CGRect labelRect;
    
    if (self.attributedText) {
        labelRect = [self.attributedText boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                                      options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                      context:nil];
    } else {
        labelRect = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
    }
    
    CGRect labelFrame = self.frame;
    labelFrame.size.height = labelRect.size.height;
    self.frame = labelFrame;
    
    return labelRect.size.height;
}
- (CGFloat)autoWidth {
    CGRect labelRect;
    
    if (self.attributedText) {
        labelRect = [self.attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    } else {
        labelRect = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
    }
    
    CGRect labelFrame = self.frame;
    labelFrame.size.width = labelRect.size.width;
    self.frame = labelFrame;
    
    return labelRect.size.height;
}

@end
