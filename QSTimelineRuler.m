//
//  QSTimelineRuler.m
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import "QSTimelineRuler.h"
#import "QSTimelinePointerView.h"

@interface QSTimelineRuler()

@property(nonatomic, strong) QSTimelineScrollView *scrollView;
@property(nonatomic, strong) QSTimelinePointerView *pointerView;

@end

@implementation QSTimelineRuler

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

-(void)initialize {
    self.scrollView = [[QSTimelineScrollView alloc]init];
    self.pointerView = [[QSTimelinePointerView alloc]init];
    
    [self addSubview:self.scrollView];
    [self addSubview:self.pointerView];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
}

@end
