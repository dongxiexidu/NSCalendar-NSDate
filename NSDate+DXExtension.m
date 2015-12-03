

#import "NSDate+DXExtension.h"

#import "NSCalendar+DXExtension.h"

@interface NSDate ()

@end

@implementation NSDate (DXExtension)

static NSDateFormatter *formatter_;
static  NSCalendar *calendar_;

// 第一次使用这个类的时候调用
+ (void)initialize
{
    formatter_ = [[NSDateFormatter alloc] init];
    calendar_ = [NSCalendar calendar];
}
- (BOOL)isToday
{
    formatter_.dateFormat = @"yyyyMMdd";
    
    NSString *selfDay = [formatter_ stringFromDate:self];
    NSString *nowDay = [formatter_ stringFromDate:[NSDate date]];
    
    return [selfDay isEqualToString:nowDay];
}

- (BOOL)isYesterday
{
    formatter_.dateFormat = @"yyyyMMdd";
    
    NSString *selfDay = [formatter_ stringFromDate:self];
    NSString *nowDay = [formatter_ stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [formatter_ dateFromString:selfDay];
    NSDate *nowDate = [formatter_ dateFromString:nowDay];
    
    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmp = [calendar_ components:units fromDate:nowDate toDate:selfDate options:0];
    
    return cmp.year == 0 && cmp.month == 0 && cmp.day == 1;
}

- (BOOL)isTomorrow
{
    formatter_.dateFormat = @"yyyyMMdd";
    
    NSString *selfDay = [formatter_ stringFromDate:self];
    NSString *nowDay = [formatter_ stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [formatter_ dateFromString:selfDay];
    NSDate *nowDate = [formatter_ dateFromString:nowDay];
    
    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmp = [calendar_ components:units fromDate:nowDate toDate:selfDate options:0];
    
    return cmp.year == 0 && cmp.month == 0 && cmp.day == -1;
}

- (BOOL)isThisYear
{
    formatter_.dateFormat = @"yyyy";
    NSString *selfYear = [formatter_ stringFromDate:self];
    NSString *currentYear = [formatter_ stringFromDate:[NSDate date]];
    
    return [selfYear isEqualToString:currentYear];
}

//- (BOOL)isThisYear
//{
//    NSCalendar *calendar = [NSCalendar calendar];
//    NSInteger currentYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
//    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
//
//    // 这个不是字符串的比较,是变量比较,直接比较指针;
//    return currentYear == selfYear;
//}

//- (BOOL)isToday
//{
//    NSCalendar *calendar = [NSCalendar calendar];
//    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
//    NSDateComponents *nowComponents = [calendar components:units fromDate:[NSDate date]];
//    NSDateComponents *selfComponents = [calendar components:units fromDate:self];
//
//    return nowComponents.year == selfComponents.year || nowComponents.month == selfComponents.month || nowComponents.day == selfComponents.day;
//}

- (BOOL)isInOneMinute
{
    formatter_.dateFormat = @"yyyyMMddHHmm";
    
    NSString *selfSecond = [formatter_ stringFromDate:self];
    NSString *nowSecond = [formatter_ stringFromDate:[NSDate date]];
    
    return [selfSecond isEqualToString:nowSecond];
}

- (BOOL)isInOneHour
{
    formatter_.dateFormat = @"yyyyMMddHH";
    
    NSString *selfHour = [formatter_ stringFromDate:self];
    NSString *nowHour = [formatter_ stringFromDate:[NSDate date]];
    
    return [selfHour isEqualToString:nowHour];
    
}

@end
