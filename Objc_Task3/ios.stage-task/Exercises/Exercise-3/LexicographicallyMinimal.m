#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2
{
    NSMutableString *firstMutableString = [NSMutableString stringWithString:string1];
    NSMutableString *secondMutableString = [NSMutableString stringWithString:string2];
    NSMutableString *resultString = [[NSMutableString alloc] init];
    
    while ((firstMutableString.length != 0) && (secondMutableString.length != 0))
    {
        [firstMutableString characterAtIndex:0];
        
        if ([firstMutableString UTF8String] [0] <= [secondMutableString UTF8String] [0])
        {
            [resultString appendString: [firstMutableString substringToIndex: 1]];
            firstMutableString = [firstMutableString substringFromIndex: 1];
        }
        else
        {
            [resultString appendString: [secondMutableString substringToIndex: 1]];
            secondMutableString = [secondMutableString substringFromIndex: 1];
        }
    }
    
    if (firstMutableString.length == 0)
    {
        [resultString appendString: secondMutableString];
    }
    else
    {
        [resultString appendString: firstMutableString];
    }
    
    return resultString;
    

}

@end

