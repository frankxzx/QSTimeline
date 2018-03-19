//
//  QSTimelineGesture.m
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import "QSTimelineGesture.h"

@interface QSTimelineGesture()

@property(nonatomic, assign) CGFloat lastScale;

@end

@implementation QSTimelineGesture

-(id)initWithTarget:(id)target action:(SEL)action{
    if ((self = [super initWithTarget:target action:action])){
        
    }
    return self;
}

-(void)reset{
    // so simple there's no reset
}

@end
