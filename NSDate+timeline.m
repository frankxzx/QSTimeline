//
//  NSDate+timeline.m
//  RKMultiUnitRuler_Example
//
//  Created by Xuzixiang on 2018/3/20.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import "NSDate+timeline.h"

@implementation NSDate (timeline)

-(BOOL)isFirstDayOfMonth {
    return self.day == 1;
}

-(BOOL)isJanuary {
    return self.month == 1;
}

-(BOOL)isDecadeOfDate:(NSDate *)date {
    return (self.year - date.year) % 10 == 0;
}

+(NSArray <NSDate *>*)datesFrom:(NSDate *)fromDate
                             to:(NSDate *)toDate
                      increment:(NSDateComponents *)increment {
    NSMutableArray *dates = [NSMutableArray array];
    NSDate *currentDate = fromDate;
    while ([currentDate isEarlierThanOrEqualTo:toDate]) {
        [dates addObject:currentDate];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        currentDate = [calendar dateByAddingComponents:increment toDate:currentDate options:0];
    }
    return dates;
}

@end

@implementation NSDateComponents (timeline)

+(instancetype)yearsWithCount:(NSInteger)count {
    NSDateComponents *components = [[NSDateComponents alloc]init];
    [components setValue:count forComponent:NSCalendarUnitYear];
    return components;
}

+(instancetype)daysWithCount:(NSInteger)count {
    NSDateComponents *components = [[NSDateComponents alloc]init];
    [components setValue:count forComponent:NSCalendarUnitDay];
    return components;
}

+(instancetype)monthsWithCount:(NSInteger)count {
    NSDateComponents *components = [[NSDateComponents alloc]init];
    [components setValue:count forComponent:NSCalendarUnitMonth];
    return components;
}

@end
