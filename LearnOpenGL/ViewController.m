//
//  ViewController.m
//  LearnOpenGL
//
//  Created by 林伟池 on 16/2/11.
//  Copyright © 2016年 林伟池. All rights reserved.
//

#import "ViewController.h"
#import "ViewDelegate.h"

@interface ViewController ()
@property (nonatomic , strong) EAGLContext* context;
@property (nonatomic , strong) GLKBaseEffect* effect;
@property (nonatomic , strong) ViewDelegate* lyDelegate;
@property (nonatomic , strong) IBOutlet UIImageView* myImageView;
@property (nonatomic , strong) IBOutlet UIImageView* myImageView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    GLfloat squareVertexData[48] =
    //    {
    //        0.5f, 0.5f, -0.9f,    0.0f, 0.0f, 1.0f,   1.0f, 1.0f,
    //        -0.5f, 0.5f, -0.9f,    0.0f, 0.0f, 1.0f,   0.0f, 1.0f,
    //        0.5f, -0.5f, -0.9f,    0.0f, 0.0f, 1.0f,   1.0f, 0.0f,
    //        0.5f, -0.5f, -0.9f,    0.0f, 0.0f, 1.0f,   1.0f, 0.0f,
    //        -0.5f, 0.5f, -0.9f,    0.0f, 0.0f, 1.0f,   0.0f, 1.0f,
    //        -0.5f, -0.5f, -0.9f,    0.0f, 0.0f, 1.0f,   0.0f, 0.0f
    //    };
    //    GLuint buffer;
    //    glGenBuffers(1, &buffer);
    //    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    //    glBufferData(GL_ARRAY_BUFFER, sizeof(squareVertexData), squareVertexData, GL_STATIC_DRAW);
    //    glEnableVertexAttribArray(GLKVertexAttribPosition);
    //    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 4 * 8, (char *)NULL + 0);
    //
    //    glEnableVertexAttribArray(GLKVertexAttribNormal);
    //    glVertexAttribPointer(GLKVertexAttribNormal, 3, GL_FLOAT, GL_FALSE, 4 * 8, (char *)NULL + 12);
    //
    //    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    //    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 4 * 8, (char *)NULL + 24);
    //
    //    // Do any additional setup after loading the view, typically from a nib.
    //    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    //
    //    GLKView* view = (GLKView *)self.view;
    //    view.context = self.context;
    //    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    //    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    //
    //    [EAGLContext setCurrentContext:self.context];
    //    glEnable(GL_DEPTH_TEST);
    //
    //    self.effect = [[GLKBaseEffect alloc] init];
    //    self.effect.light0.enabled = GL_TRUE;
    //    self.effect.light0.diffuseColor = GLKVector4Make(0.0f, 1.0f, 0.0f, 1.0f);
    //
    
    CALayer* layer = [CALayer layer];
    self.lyDelegate = [[ViewDelegate alloc] init];
    layer.delegate = self.lyDelegate;
    layer.backgroundColor=[UIColor brownColor].CGColor;
    layer.frame = CGRectMake(0, 0, 100, 100);
    [self.view.layer addSublayer:layer];
    [layer setNeedsDisplay]; //注意不是self.view.layer
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIGraphicsBeginImageContextWithOptions(self.myImageView.bounds.size, NO, 0);
        UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 50, 50)];
        [[UIColor redColor] setFill];
        [path fill];
        UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myImageView setImage:image];
        });
        UIGraphicsEndImageContext();
        
        
        UIGraphicsBeginImageContextWithOptions(self.myImageView.bounds.size, NO, 0);
        //core started
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 20, 20));
        CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
        CGContextFillPath(ctx);
        CGContextFillRect(ctx, CGRectMake(30, 30, 20, 20));
        image = UIGraphicsGetImageFromCurrentImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myImageView2 setImage:image];
        });
        //end
        UIGraphicsEndImageContext();
        
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  场景数据变化
 */
- (void)update {
    CGSize size = self.view.bounds.size;
    float aspect = fabsf(size.width / size.height);
    GLKMatrix4 projectionMatrix = GLKMatrix4Identity;
    projectionMatrix = GLKMatrix4Scale(projectionMatrix, 1.0f, aspect, 1.0f);
    self.effect.transform.projectionMatrix = projectionMatrix;
}


/**
 *  渲染场景代码
 *
 *  @param view <#view description#>
 *  @param rect <#rect description#>
 */
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(0.3f, 0.6f, 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    [self.effect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, 3);
}
@end
