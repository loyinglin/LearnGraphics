//
//  UIKitView.m
//  LearnGraphics
//
//  Created by 林伟池 on 16/2/24.
//  Copyright © 2016年 林伟池. All rights reserved.
//

#import "UIKitView.h"

@implementation UIKitView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 50, 50)];
    [[UIColor redColor] setFill];
    [path fill];
}


@end
