//
//  CustomHeader.m
//  CoolTable
//
//  Created by Chao Xu on 13-11-26.
//  Copyright (c) 2013年 Chao Xu. All rights reserved.
//

#import "CustomHeader.h"
#import "Common.h"

@interface CustomHeader()
@property (nonatomic,assign)CGRect coloredBoxRect;
@property(nonatomic,assign)CGRect paperRect;
@end

@implementation CustomHeader
@synthesize titleLabel = _titleLabel;
@synthesize lightColor = _lightColor;
@synthesize darkColor = _darkColor;
-(id)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.opaque = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _titleLabel.shadowOffset = CGSizeMake(0, -1);
        [self addSubview:_titleLabel];
        _lightColor = [UIColor colorWithRed:105.0f/255.0f green:179.0f/255.0f blue:216.0f/255.0f alpha:1.0];
        _darkColor = [UIColor colorWithRed:21.0/255.0 green:92.0/255.0 blue:136.0/255.0 alpha:1.0];
    }
    return self;
}

-(void) drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    
    CGContextSetFillColorWithColor(context, whiteColor.CGColor);
    CGContextFillRect(context, _paperRect);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor.CGColor);//set up shadow drawing.The first parameter is the offset of the shadow to draw. Here you set it up to draw 2 points underneath the given path.
    //  The next parameter is the blur of the shadow. A value of 0 would be a hard edge, the larger the values are the softer the edge. You set the value to 3 for a soft edge.
    CGContextSetFillColorWithColor(context, self.lightColor.CGColor);
    CGContextFillRect(context, self.coloredBoxRect);
    CGContextRestoreGState(context);
    
    drawGlossAndGradient(context, self.coloredBoxRect, self.lightColor.CGColor, self.darkColor.CGColor);
    CGContextSetStrokeColorWithColor(context, self.darkColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, rectFor1PxStroke(self.coloredBoxRect));
}

-(void) layoutSubviews{
    CGFloat coloredBoxMargin = 6.0;
    CGFloat coloredBoxHeight = 40.0;
    self.coloredBoxRect = CGRectMake(coloredBoxMargin, coloredBoxMargin, self.bounds.size.width-coloredBoxMargin*2, coloredBoxHeight);
    
    CGFloat paperMargin = 9.0;
    self.paperRect = CGRectMake(paperMargin, CGRectGetMaxY(self.coloredBoxRect), self.bounds.size.width-paperMargin*2, self.bounds.size.height-CGRectGetMaxY(self.coloredBoxRect));
    
    self.titleLabel.frame = self.coloredBoxRect;
}


@end


















































