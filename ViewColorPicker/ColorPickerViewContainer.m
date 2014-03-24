//
//  ColorPickerViewContainer.m
//  TapViewColors
//
//  Created by Diego de Paz Sierra on 3/20/14.
//  Copyright (c) 2014 Depa. All rights reserved.
//

#import "ColorPickerViewContainer.h"
#import "ColorPickerView.h"
#import "ColorSliderView.h"

@interface ColorPickerViewContainer ()

@property (nonatomic, strong) ColorPickerView * colorPickerView;

@property (nonatomic, strong) ColorSliderView * colorSliderView;

-(UIColor * ) colorOfPoint:(CGPoint) point;

@property (nonatomic, strong) UIColor * color;

@end

@implementation ColorPickerViewContainer

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self create];
    }
    return self;
}

-(void)create {
    
    self.colorPickerView = [[ColorPickerView alloc]initWithFrame:CGRectMake(15.5, 2, 289, 55)];
    
   // UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
     //                                        initWithTarget:self action:@selector(respondToTapGesture:)];
    
    
    [self addSubview:self.colorPickerView];
    
    
    
    self.colorSliderView = [[ColorSliderView alloc]initWithFrame:CGRectMake(30, 0, 20, 55)];
    [self addSubview:self.colorSliderView];
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(respondToPanning:)];
    
    [self.colorSliderView addGestureRecognizer:panRecognizer];
}

- (IBAction)respondToPanning:(UITapGestureRecognizer *)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged) {
        
        self.startMovingSlider = YES;
        CGPoint pt=[recognizer locationInView:self];
        
        [self moveSlider:pt];
  //      NSLog(@"The user touch the point x %f, y %f ", pt.x, pt.y);
        
        self.color = [self colorOfPoint:pt];
        NSLog(@"The color is %@", self.color);
        
    } else {
        self.startMovingSlider = NO;
    }

}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self create];
    }
    return self;
}

-(UIColor *)getColor {
    
    CGPoint centerPointSlider =[self.colorSliderView getCenterPoint];

    CGPoint pointReferenceToColorPicker = [self.colorPickerView convertPoint:centerPointSlider fromView:self];
    
    return [self colorOfPoint:pointReferenceToColorPicker];
}

- (UIColor *) colorOfPoint:(CGPoint)point
{
    unsigned char pixel[4] = {0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast);
    
    CGContextTranslateCTM(context, -point.x, -point.y);
    
    [self.colorPickerView.layer renderInContext:context];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    //NSLog(@"pixel: %d %d %d %d", pixel[0], pixel[1], pixel[2], pixel[3]);
    
    UIColor *color = [UIColor colorWithRed:pixel[0]/255.0 green:pixel[1]/255.0 blue:pixel[2]/255.0 alpha:pixel[3]/255.0];
    
    return color;
}

-(void) moveSlider:(CGPoint) point {
    
    if (self.startMovingSlider){
        
        
        
        CGRect oldFrame = [self.colorSliderView frame];
        
        CGRect rectColorPicker = self.colorPickerView.roundedRectangleRect;
        CGPoint originColorPickerReferenceToContainer = [self.colorPickerView convertPoint:rectColorPicker.origin toView:self];
        
        //if()

        
        float minX = originColorPickerReferenceToContainer.x-5;
        float maxX = originColorPickerReferenceToContainer.x-12 + rectColorPicker.size.width;
        
        
        if (point.x<= minX) {
            
            NSLog(@"LOWER LIMIT");
            
            [self.colorSliderView setFrame:CGRectMake(minX, 0, oldFrame.size.width, oldFrame.size.height)];
            
            
        } else if (point.x >= maxX) {
            
            NSLog(@"UPPER LIMIT");
            
            [self.colorSliderView setFrame:CGRectMake(maxX, 0, oldFrame.size.width, oldFrame.size.height)];
        
        } else {
            [self.colorSliderView setFrame:CGRectMake(point.x, 0, oldFrame.size.width, oldFrame.size.height)];
        }
    }
    
}


-(BOOL)isPointInsideSlider:(CGPoint)point {
    CGRect frame = self.colorSliderView.frame;
    
    return CGRectContainsPoint(frame, point);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
