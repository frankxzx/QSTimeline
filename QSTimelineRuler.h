//
//  QSTimelineRuler.h
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QSTimelineScrollView.h"

@class QSTimelineRuler;
@protocol QSTimelineRuler

-(void)qsTimelineRuler: (QSTimelineRuler *)ruler didScrollToDate: (NSDate *)date;

@end

@interface QSTimelineRuler : UIView

@property(nonatomic, weak) id <QSTimelineRuler> qs_delegate;
@property(nonatomic, strong) NSDate *birthday;

@end
