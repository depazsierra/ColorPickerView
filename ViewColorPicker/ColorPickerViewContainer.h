//
//  ColorPickerViewContainer.h
//  TapViewColors
//
//  Created by Diego de Paz Sierra on 3/20/14.
//  Copyright (c) 2014 Depa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorPickerViewContainer : UIView

@property (assign, nonatomic) BOOL startMovingSlider;

-(void) moveSlider:(CGPoint) point;

-(UIColor *) getColor;

-(BOOL) isPointInsideSlider:(CGPoint) point;

@end
