//
//  QSTimelineMarker.h
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, QSTimelineRange) {
    QSTimelineYear,
    QSTimelineMonth,
    QSTimelineDay,
};

@interface QSTimelineMarker : NSObject

@property(nonatomic, assign) BOOL isLabelVisible;
@property(nonatomic, assign) BOOL isKey;
@property(nonatomic, assign) QSTimelineRange type;
@property(nonatomic, assign, readonly) CGSize size;
@property(nonatomic, strong, readonly) UIColor *color;
@property(nonatomic, strong, readonly) UIFont *font;
@property(nonatomic, copy) NSString *text;
@property(nonatomic, assign) CGFloat padding;
@property(nonatomic, strong) NSDate *date;

@end
