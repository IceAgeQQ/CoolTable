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
    UIColor * separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0];
  
    CGRect paperRect = self.bounds;
    drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
    
    CGRect strokeRect = paperRect;
    strokeRect.size.height -= 1;
    strokeRect = rectFor1PxStroke(strokeRect);
    CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
    
  
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, strokeRect);
    
    CGPoint startPoint = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height -1);
    CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width -1, paperRect.origin.y + paperRect.size.height -1 );
    draw1PxStroke(context, startPoint, endPoint, separatorColor.CGColor);
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




































