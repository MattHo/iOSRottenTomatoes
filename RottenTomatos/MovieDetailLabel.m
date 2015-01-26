//
//  MovieDetailLabel.m
//  RottenTomatos
//
//  Created by Matt Ho on 1/26/15.
//  Copyright (c) 2015 Yahoo Inc. All rights reserved.
//

#import "MovieDetailLabel.h"

@implementation MovieDetailLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 10, 0, 10};
    
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
