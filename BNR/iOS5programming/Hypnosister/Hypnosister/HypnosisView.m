//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Todd Pickell on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

@synthesize circleColor;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor magentaColor]];
    }
    return self;
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)setCircleColor:(UIColor *)cColor
{
    circleColor = cColor;
    [self setNeedsDisplay];
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {

        NSLog(@"Device started shaking");
        [self setCircleColor:[UIColor greenColor]];
    }
}

-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    //get center of bounds rect
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //radius of circle should be nearly as big as view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    //thickness of line 10 pts wide
    CGContextSetLineWidth(ctx, 10);
    
    //color of line = gray 
    [[self circleColor] setStroke];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        //add a shape to the context
        CGContextAddArc(ctx, center .x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
    
        //perform a drawing instruction
        CGContextStrokePath(ctx);
    }
    
    NSString *text = @"You are getting sleepy.";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    [[UIColor blackColor] setFill];
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    [text drawInRect:textRect withFont:font];
    
}

@end
