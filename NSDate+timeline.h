//
//  NSDate+timeline.h
//  RKMultiUnitRuler_Example
//
//  Created by Xuzixiang on 2018/3/20.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+DateTools.h"

@interface NSDate (timeline)

-(BOOL)isFirstDayOfMonth;
-(BOOL)isJanuary;
-(BOOL)isDecadeOfDate:(NSDate *)date;
+(NSArray <NSDate *>*)datesFrom:(NSDate *)fromDate
                             to:(NSDate *)toDate
                      increment:(NSDateComponents *)increment;

@end

@interface NSDateComponents (timeline)

+(instancetype)yearsWithCount:(NSInteger)count;
+(instancetype)daysWithCount:(NSInteger)count;
+(instancetype)monthsWithCount:(NSInteger)count;

@end
