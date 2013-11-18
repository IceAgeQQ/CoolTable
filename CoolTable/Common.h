//
//  Common.h
//  CoolTable
//
//  Created by Chao Xu on 13-11-18.
//  Copyright (c) 2013年 Chao Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject
CGRect rectFor1PxStroke(CGRect rect);
void drawLinearGradient(CGContextRef context,CGRect rect,CGColorRef startColor,CGColorRef endColor);//a global function
@end
