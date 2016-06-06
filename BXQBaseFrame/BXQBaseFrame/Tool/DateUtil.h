//
//  DateUtil.h
//  MyCalendar
//
//  Created by jh niu on 12-8-21.
//  Copyright (c) 2012年 sunday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateUtil : UIViewController{
    
}
//获取农历
+(NSString*)getChineseCalendarWithDate:(NSDate *)date;
//获取当前周的第一天
+(NSDate *)beginningOfWeek:(NSDate *)date;
//返回当前周的周末
+(NSDate *)endOfWeek:(NSDate *)date;
//获取根据天数前后日期
+ (NSDate *)dateAfterDay:(int)day :(NSDate *)today;
 
//该日期是该年的第几周
+(int)getWeekOfYear:(NSDate *)date;
//获取年
+(NSUInteger)getYear:(NSDate *)date;
+ (NSUInteger)getDay:(NSDate *)today;
+ (NSDate *)dateFromString:(NSString *)string :(NSString *)stringtype;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
//农历节日
+(NSString *)getLunarHoliDayDate:(NSDate *)date;
//获取月
+(NSUInteger)getMonth:(NSDate *)date;
+(NSString *)getLunarSpecialDate:(NSDate *)date;
+(NSString*)getChineseCalendarWithfullDate:(NSDate *)date;
//返回该月的第一天
+ (NSDate *)beginningOfMonth:(NSDate *)date;
//该月的最后一天
+(NSDate *)endOfMonth:(NSDate *)date;
+ (NSDate *)dateafterMonth:(int)month :(NSDate *)date;

// 根据日期显示星期
+(NSString *)getXingqi:(NSDate *)date;
// 根据日期显示中文时间
+(NSString *)getTimeWithDate:(NSDate *)date andType:(NSString *)string;

//得到消除时差差异后的本地date string. 返回值如： "2013-05-20 10:54:13 +0000"
+(NSDate *)getLocaleDateStr:(NSDate *)date;
//比较两天的前后
+(NSComparisonResult)Date1:(NSString *)date1 Date2:(NSString *)date2;
// 获取前一天
+(NSDate *)lastDate:(NSDate *)date;
// 获取后一天
+(NSDate *)nextDate:(NSDate *)date;
// 获取前一个星期
+(NSDate *)lastWeek:(NSDate *)date;
// 获取后一个星期
+(NSDate *)nextWeek:(NSDate *)date;
// 获取前一个月
+(NSDate *)lastMonth:(NSDate *)date;
// 获取后一个月
+(NSDate *)nextMonth:(NSDate *)date;

/**
 *  判断是今天还是昨天
 */
+(NSString*)compareDate:(NSDate*)date;

@end
