//
//  QSTimelineGesture.h
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QSTimelineGestureDelegate <UIGestureRecognizerDelegate>

@end

@interface QSTimelineGesture : UIPinchGestureRecognizer

@property(nonatomic, weak) id <QSTimelineGestureDelegate> qs_delegate;

@end
