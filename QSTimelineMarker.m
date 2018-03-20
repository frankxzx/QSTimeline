//
//  QSTimelineMarker.m
//  QSTimeline
//
//  Created by Xuzixiang on 2018/3/18.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import "QSTimelineMarker.h"

@interface QSTimelineMarker()

@property(nonatomic, assign) BOOL isLabelVisible;
@property(nonatomic, assign) BOOL isKey;

@end

@implementation QSTimelineMarker

-(instancetype)initWithDate:(NSDate *)date
                   birthday:(NSDate *)birthday
                      range:(QSTimelineRange)range {
    if (self = [super init]) {
        self.font = [UIFont systemFontOfSize:12];
        self.color = [UIColor whiteColor];
        self.padding = 15;
        self.date = date;
        self.range = range;
        
        NSArray *per3 = @[@3,@6,@9,@12];
        NSArray *per5 = @[@5,@10,@15,@20,@25,@30];
        
        switch (range) {
            case QSTimelineDay: {
                self.isKey = [date isFirstDayOfMonth];
                BOOL flag = [per5 containsObject:@(date.day)];
                if (self.isKey) {
                    self.text = [NSString stringWithFormat:@"%ld月", (long)date.month];
                } else if (flag) {
                    self.text = [NSString stringWithFormat:@"%ld", (long)date.day];
                }
                self.isLabelVisible = self.isKey || flag;
                break;
            }
                
            case QSTimelineMonth: {
                self.isKey = [date isJanuary];
                BOOL flag = [per3 containsObject:@(date.month)];
                if (self.isKey) {
                    self.text = [NSString stringWithFormat:@"%ld年", (long)date.year];
                } else if (flag) {
                    self.text = [NSString stringWithFormat:@"%ld", (long)date.month];
                }
                self.isLabelVisible = self.isKey || flag;
                break;
            }
                
            case QSTimelineYear:
                self.isKey = [date isDecadeOfDate:birthday];
                self.isLabelVisible = self.isKey;
                if (self.isKey) {
                    self.text = [NSString stringWithFormat:@"%ld年", (long)date.year];
                }
                break;
        }
        
        if (self.isKey) {
            self.size = CGSizeMake(2, 30);
        } else {
            self.size = CGSizeMake(2, 10);
        }
    }
    return self;
}

@end
