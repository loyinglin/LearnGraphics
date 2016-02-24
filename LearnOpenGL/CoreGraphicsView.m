//
//  CoreGraphicsView.m
//  LearnGraphics
//
//  Created by 林伟池 on 16/2/24.
//  Copyright © 2016年 林伟池. All rights reserved.
//

#import "CoreGraphicsView.h"

@implementation CoreGraphicsView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 50, 50));
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillPath(context);
}

@end
