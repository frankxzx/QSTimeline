//
//  QSTimelineScrollView.h
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QSTimelineLayer.h"
#import "QSTimelineGesture.h"

@interface QSTimelineScrollView : UIControl <UIScrollViewDelegate>

@property(nonatomic, strong) NSMutableArray <QSTimelineMarker *> *markers;
@property(nonatomic, strong) QSTimelineLayer *timelineLayer;
@property(nonatomic, strong, readonly) QSTimelineGesture *gestureRecognizer;

@end
