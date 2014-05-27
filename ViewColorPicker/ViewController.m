//
//  ViewController.m
//  TapViewColors
//
//  Created by Diego de Paz Sierra on 3/19/14.
//  Copyright (c) 2014 Depa. All rights reserved.
//

#import "ViewController.h"
#import "ColorPickerViewContainer.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelView;

@property (weak, nonatomic) IBOutlet ColorPickerViewContainer *colorPickerViewContainer;
@end

@implementation ViewController

static void *kvoContext = &kvoContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //[self.colorPickerViewContainer addObserver:self forKeyPath:@"color" options:NSKeyValueObservingOptionOld context:nil];
     [self.colorPickerViewContainer addObserver:self forKeyPath:NSStringFromSelector(@selector(color)) options:NSKeyValueObservingOptionOld context:kvoContext];
    
    
    [self.labelView setTextColor:[self.colorPickerViewContainer getColor]];

}

- (void)dealloc
{
    [self.colorPickerViewContainer removeObserver:self forKeyPath:NSStringFromSelector(@selector(color)) context:kvoContext];
}

/*-(BOOL)shouldAutorotate {
    return NO;
}*/


/*
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)evt {
    UITouch *touch=[touches anyObject];
    CGPoint pt=[touch locationInView:self.colorPickerViewContainer];
    
    self.colorPickerViewContainer.startMovingSlider = [self.colorPickerViewContainer isPointInsideSlider:pt];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.colorPickerViewContainer.startMovingSlider) {
        UITouch *touch=[touches anyObject];
        CGPoint pt=[touch locationInView:self.colorPickerViewContainer];
        
        UIColor * color = [self.colorPickerViewContainer getColor];
        
        [self.labelView setTextColor:color];
        
        [self.colorPickerViewContainer moveSlider:pt];
        NSLog(@"The user touch the point x %f, y %f ", pt.x, pt.y);
        NSLog(@"The color is %@", color);
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.colorPickerViewContainer.startMovingSlider =  NO;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.colorPickerViewContainer.startMovingSlider = NO;
}*/

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    if (context != kvoContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    } else {
        [self.labelView setTextColor:[self.colorPickerViewContainer getColor]];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
