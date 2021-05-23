#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSNumber *number = [NSNumber numberWithInteger:monthNumber - 1];
        
    if ((number.intValue < 0) || (number.intValue > 11 ))
    {
        return nil;
    }
    
    return [[dateFormatter monthSymbols]objectAtIndex: number.intValue];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date
{
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitDay fromDate:dateFromString];
    
    return (long)dateComponents.day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date
{
    NSString *dateFormat = @"dd-LLL-yyyy'";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    
    dateFormatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"E"];
    
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *nowDateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:[NSDate now]];
    NSDateComponents *givenDateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:date];
        
    if (nowDateComponents.year == givenDateComponents.year)
    {
        return nowDateComponents.weekOfYear == givenDateComponents.weekOfYear;
    }
        
    return NO;
}

@end
