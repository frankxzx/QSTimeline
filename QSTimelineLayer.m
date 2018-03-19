//
//  QSTimelineLayer.m
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import "QSTimelineLayer.h"

@implementation QSTimelineLayer

-(void)display {
    [super display];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self drawLayer];
    [CATransaction commit];
}

-(void)drawLayer {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    QSTimelineMarker *previousMarker;
    CGFloat position = 0;
    for (QSTimelineMarker *marker in self.markers) {
        if (previousMarker) {
            position += marker.padding;
        }
        [self drawMarkerWith:marker atPosition:position inContext:context];
        previousMarker = marker;
    }
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage *img = [newImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.contents = (__bridge id)img.CGImage;
}

-(void)drawMarkerWith:(QSTimelineMarker *)marker atPosition:(CGFloat)position inContext:(CGContextRef)context {
    NSDictionary *textAttributes = [self textAttributesWith:marker.font color:marker.color];
    CGSize textSize = [marker.text sizeWithAttributes:textAttributes];
    
    CGRect markerRect = [self markRectWith:position marker:marker];
    CGRect markerTextRect = [self markTextRectWith:position textSize:textSize marker:marker];
    
    CGContextSetFillColorWithColor(context, marker.color.CGColor);
    CGContextFillRect(context, markerRect);
    if (marker.isLabelVisible) {
        [marker.text drawInRect:markerTextRect withAttributes:textAttributes];
    }
}

-(CGRect)markRectWith:(CGFloat)position marker:(QSTimelineMarker *)marker {
    return CGRectMake(position - (marker.size.width/2),
                      (self.frame.size.height - marker.size.height),
                      marker.size.width,
                      marker.size.height);
}

-(CGRect)markTextRectWith:(CGFloat)position textSize:(CGSize)textSize marker:(QSTimelineMarker *)marker {
    return CGRectMake(position - (textSize.width/2),
                      0,
                      textSize.width,
                      textSize.height);
}

-(void)reload {
    [self setNeedsDisplay];
}

-(NSDictionary *)textAttributesWith:(UIFont *)font color:(UIColor *)color {
    return @{
             NSFontAttributeName: font,
             NSForegroundColorAttributeName: color
             };
}

@end
