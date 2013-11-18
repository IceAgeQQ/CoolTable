//
//  CustomCellBackground.m
//  CoolTable
//
//  Created by Chao Xu on 13-11-18.
//  Copyright (c) 2013年 Chao Xu. All rights reserved.
//

#import "CustomCellBackground.h"
#import "Common.h"
@implementation CustomCellBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();//UIGraphicsGetCurrentContext() to get the Core Graphics Context that you’ll use in the rest of the method.
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
   // CGContextSetFillColorWithColor(context, redColor.CGColor);//very easy to convert the easy-to-use UIColor to a CGColor – just by accessing the CGColor property of the UIColor.
    CGRect paperRect = self.bounds;
    //CGContextFillRect(context, self.bounds);
    drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
    
    CGRect strokeRect = rectFor1PxStroke(CGRectInset(paperRect, 1.0, 1.0));
    CGContextSetStrokeColorWithColor(context, redColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, strokeRect);
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




































