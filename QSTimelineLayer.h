//
//  QSTimelineLayer.h
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QSTimelineMarker.h"

@interface QSTimelineLayer : CALayer

@property(nonatomic, strong) NSMutableArray <QSTimelineMarker *> *markers;

-(void)reload;

@end
