//
//  QSTimelineMarker.h
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+timeline.h"

typedef NS_ENUM(NSUInteger, QSTimelineRange) {
    QSTimelineYear,
    QSTimelineMonth,
    QSTimelineDay,
};

@interface QSTimelineMarker : NSObject

@property(nonatomic, assign, readonly) BOOL isLabelVisible;
@property(nonatomic, assign, readonly) BOOL isKey;
@property(nonatomic, assign) QSTimelineRange range;
@property(nonatomic, assign) CGSize size;
@property(nonatomic, strong) UIColor *color;
@property(nonatomic, strong) UIFont *font;
@property(nonatomic, copy) NSString *text;
@property(nonatomic, assign) CGFloat padding;
@property(nonatomic, strong) NSDate *date;

-(instancetype)initWithDate:(NSDate *)date
                   birthday:(NSDate *)birthday
                      range:(QSTimelineRange)range;

@end
