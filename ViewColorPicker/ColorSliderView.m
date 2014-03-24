//
//  ColorSliderView.m
//  TapViewColors
//
//  Created by Diego de Paz Sierra on 3/20/14.
//  Copyright (c) 2014 Depa. All rights reserved.
//

#import "ColorSliderView.h"

@implementation ColorSliderView

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
    //// General Declarations
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(x+12, y+3.5)];
    [bezierPath addLineToPoint: CGPointMake(x+7, y+3.5)];
    [bezierPath addLineToPoint: CGPointMake(x+7, y+51.5)];
    [bezierPath addLineToPoint: CGPointMake(x+12, y+51.5)];
    [bezierPath addLineToPoint: CGPointMake(x+12, y+3.5)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(x+20, y+55)];
    [bezierPath addLineToPoint: CGPointMake(x+0, y+55)];
    [bezierPath addLineToPoint: CGPointMake(x+0, y+0)];
    [bezierPath addLineToPoint: CGPointMake(x+20, y+0)];
    [bezierPath addLineToPoint: CGPointMake(x+20, y+55)];
    [bezierPath closePath];
    [[UIColor colorWithRed: 0.833 green: 0.833 blue: 0.833 alpha: 1] setFill];
    [bezierPath fill];
    [[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1] setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    
    //// Cleanup
    CGColorSpaceRelease(colorSpace);

}

- (CGPoint) getCenterPoint{
    return  self.center;
}


@end
