//
//  ViewColorPicker.m
//  TapViewColors
//
//  Created by Diego de Paz Sierra on 3/19/14.
//  Copyright (c) 2014 Depa. All rights reserved.
//

#import "ColorPickerView.h"

@interface ColorPickerView()

@end

@implementation ColorPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    //// Frames
    CGRect frame = rect;
    
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 0.571 blue: 0.571 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 1 green: 1 blue: 0.571 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.571 green: 0.857 blue: 1 alpha: 1];
    UIColor* color7 = [UIColor colorWithRed: 0.571 green: 1 blue: 0.857 alpha: 1];
    UIColor* color5 = [UIColor colorWithRed: 0.571 green: 0.571 blue: 1 alpha: 1];
    UIColor* color8 = [UIColor colorWithRed: 0.857 green: 0.571 blue: 1 alpha: 1];
    UIColor* color9 = [UIColor colorWithRed: 1 green: 0.343 blue: 0.562 alpha: 1];
    UIColor* color10 = [UIColor colorWithRed: 0.167 green: 0.167 blue: 0.167 alpha: 0.625];
    UIColor* color11 = [UIColor colorWithRed: 1 green: 0.781 blue: 0.343 alpha: 1];
    UIColor* color12 = [UIColor colorWithRed: 0.714 green: 1 blue: 0.571 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradienteMulticolorColors = [NSArray arrayWithObjects:
                                          (id)color2.CGColor,
                                          (id)[UIColor colorWithRed: 1 green: 0.676 blue: 0.457 alpha: 1].CGColor,
                                          (id)color11.CGColor,
                                          (id)color3.CGColor,
                                          (id)color12.CGColor,
                                          (id)color7.CGColor,
                                          (id)color6.CGColor,
                                          (id)color5.CGColor,
                                          (id)color8.CGColor,
                                          (id)color9.CGColor,
                                          (id)[UIColor whiteColor].CGColor,
                                          (id)[UIColor colorWithRed: 0.5 green: 0.5 blue: 0.5 alpha: 1].CGColor,
                                          (id)[UIColor blackColor].CGColor, nil];
    CGFloat gradienteMulticolorLocations[] = {0, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 1};
    CGGradientRef gradienteMulticolor = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradienteMulticolorColors, gradienteMulticolorLocations);
    
    //// Shadow Declarations
    UIColor* shadow = color10;
    CGSize shadowOffset = CGSizeMake(-3.1, 3.1);
    CGFloat shadowBlurRadius = 4;
    
    //// Rounded Rectangle Drawing
    
    self.roundedRectangleRect = CGRectMake(CGRectGetMinX(frame) + 9.5, CGRectGetMinY(frame) + 0.5, 270, 49);
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRect: self.roundedRectangleRect];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [roundedRectanglePath addClip];
    CGContextDrawLinearGradient(context, gradienteMulticolor,
                                CGPointMake(CGRectGetMinX(self.roundedRectangleRect), CGRectGetMidY(self.roundedRectangleRect)),
                                CGPointMake(CGRectGetMaxX(self.roundedRectangleRect), CGRectGetMidY(self.roundedRectangleRect)),
                                0);
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    [[UIColor blackColor] setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];

    //// Cleanup
    CGGradientRelease(gradienteMulticolor);
    CGColorSpaceRelease(colorSpace);

}

-(BOOL) isPointInsideColorPicker:(CGPoint) point {
    return CGRectContainsPoint(self.roundedRectangleRect, point);
}


@end
