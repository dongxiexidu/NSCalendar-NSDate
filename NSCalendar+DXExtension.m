
#import "NSCalendar+DXExtension.h"

#define ios(version) ([UIDevice currentDevice].systemVersion.doubleValue >= (version))
@implementation NSCalendar (DXExtension)

+ (instancetype)calendar
{
    // 此方法是iOS8才有,因此要判断,否则运行到iOS8以下系统会报错
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }else{
        // 此方法运行到iOS9系统,偶尔会出问题;
        return [NSCalendar currentCalendar];
    }
}
@end
