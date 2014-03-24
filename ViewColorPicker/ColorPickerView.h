//
//  ViewColorPicker.h
//  TapViewColors
//
//  Created by Diego de Paz Sierra on 3/19/14.
//  Copyright (c) 2014 Depa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorPickerView : UIView

-(BOOL) isPointInsideColorPicker:(CGPoint) point;

@property (nonatomic,assign) CGRect roundedRectangleRect;

@end
