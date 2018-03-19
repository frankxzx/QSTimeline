//
//  QSTimelineScrollView.m
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import "QSTimelineScrollView.h"

@interface QSTimelineScrollView() <UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) QSTimelineGesture *gestureRecognizer;
@property(nonatomic, assign) CGFloat lastScale;
@property(nonatomic, assign) CGFloat currentScale;

@end

@implementation QSTimelineScrollView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

-(void)initialize {
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    [self setUpPinchGesture: self.scrollView];
    
    self.timelineLayer = [[QSTimelineLayer alloc]init];
    [self.layer addSublayer:self.timelineLayer];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.timelineLayer.frame = [self timelineLayerFrame];
    self.scrollView.contentSize = CGSizeMake(self.timelineLayer.frame.size.width, self.frame.size.height);
}

-(CGRect)timelineLayerFrame {
    NSArray <QSTimelineMarker *>*markers = self.timelineLayer.markers;
    if (markers && markers.count > 0) {
        CGFloat padding =  markers.firstObject.padding;
        CGFloat width = markers.count * padding;
        return CGRectMake(0, 0, width, self.frame.size.height);
    }
    return CGRectZero;
}

-(void)setUpPinchGesture:(UIScrollView *)scrollView {
    self.gestureRecognizer = [[QSTimelineGesture alloc]initWithTarget:self action:@selector(pinch:)];
    for (UIGestureRecognizer *pinch in self.gestureRecognizers) {
        if ([pinch isKindOfClass:[UIPinchGestureRecognizer class]]) {
            pinch.enabled = NO;
        }
    }
    [scrollView addGestureRecognizer:self.gestureRecognizer];
}

-(void)pinch:(QSTimelineGesture *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
            
        case UIGestureRecognizerStateChanged:
            self.lastScale = sender.scale;
            [self pinchDidZoom:sender];
            break;
            
        case UIGestureRecognizerStateCancelled:
            
            break;
            
        case UIGestureRecognizerStateFailed:
            
            break;
            
        case UIGestureRecognizerStatePossible:
            
            break;
            
        case UIGestureRecognizerStateEnded:
            [self resetPinchScale];
            
            break;
    }
}

-(void)pinchDidZoom:(QSTimelineGesture *)sender {
    self.currentScale = sender.scale - self.lastScale;
    [self paddingIncrease:self.currentScale];
}

-(void)paddingIncrease:(CGFloat)scale {
    
    [self.timelineLayer reload];
}

-(void)resetPinchScale {
    self.lastScale = 1.0;
}

-(void)setCurrentScale:(CGFloat)currentScale {
    CGFloat minScale = 0.8;
    CGFloat maxScale = 1.2;
    if (_currentScale < minScale) {
        _currentScale = minScale;
        return;
    }
    if (_currentScale > maxScale) {
        _currentScale = maxScale;
        return;
    }
    _currentScale = currentScale;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

@end
