//
//  QSTimelinePointerView.m
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import "QSTimelinePointerView.h"

@implementation QSTimelinePointerView

-(CALayer *)layer {
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = 54.0;
    CGFloat h1 = h + 4;
    
    UIBezierPath *bezier2Path = [[UIBezierPath alloc]init];
    [bezier2Path moveToPoint:CGPointMake(w/2, 0)];
    [bezier2Path addLineToPoint:CGPointMake(w/2, h)];
    bezier2Path.lineWidth = 2 * [UIScreen mainScreen].scale;
    bezier2Path.lineCapStyle = kCGLineCapSquare;
    [bezier2Path closePath];
    
    UIBezierPath *bezier3Path = [[UIBezierPath alloc]init];
    [bezier3Path moveToPoint:CGPointMake(w/2, h1-8)];
    [bezier3Path addLineToPoint:CGPointMake(w/2 + 4.7, h1-5)];
    [bezier3Path addLineToPoint:CGPointMake(w/2 + 3, h1)];
    [bezier3Path addLineToPoint:CGPointMake(w/2 - 3, h1)];
    [bezier3Path addLineToPoint:CGPointMake(w/2 - 4.7, h1-5)];
    [bezier3Path addLineToPoint:CGPointMake(w/2, h1-8)];
    [bezier3Path closePath];
    [bezier3Path fill];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path appendPath:bezier2Path];
    [path appendPath:bezier3Path];
    
    CAShapeLayer *shape = [[CAShapeLayer alloc]init];
    shape.lineWidth = 2;
    shape.path = path.CGPath;
    shape.fillColor = [UIColor whiteColor].CGColor;
    shape.strokeColor = [UIColor whiteColor].CGColor;
    
    return shape;
}

@end
