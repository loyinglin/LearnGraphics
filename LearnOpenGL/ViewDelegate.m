//
//  ViewDelegate.m
//  LearnGraphics
//
//  Created by 林伟池 on 16/2/24.
//  Copyright © 2016年 林伟池. All rights reserved.
//

#import "ViewDelegate.h"

@implementation ViewDelegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"ABC %@", ctx);
    UIGraphicsPushContext(ctx);
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 50, 50)];
    
    [[UIColor redColor] setFill];
    [path fill];
    
    UIGraphicsPopContext();
    
    CGContextAddEllipseInRect(ctx, CGRectMake(30, 30, 20, 20));
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextFillPath(ctx);
}

@end
