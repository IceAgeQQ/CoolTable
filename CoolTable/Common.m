//
//  Common.m
//  CoolTable
//
//  Created by Chao Xu on 13-11-18.
//  Copyright (c) 2013年 Chao Xu. All rights reserved.
//

#import "Common.h"

@implementation Common

void drawLinearGradient(CGContextRef context,CGRect rect,CGColorRef startColor,CGColorRef endColor){
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0,1.0};
    
    NSArray *colors = @[(__bridge id)startColor,(__bridge id)endColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

CGRect rectFor1PxStroke(CGRect rect){
    return CGRectMake(rect.origin.x+0.5, rect.origin.y + 0.5, rect.size.width -1, rect.size.height -1);
}
@end














































