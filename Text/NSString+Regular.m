//
//  NSString+Regular.m
//  Text
//
//  Created by 柯南 on 2021/7/26.
//

#import "NSString+Regular.h"

@implementation NSString (Regular)

- (BOOL)inputIsValid{
    NSString *regex = @"[0-9a-zA-Z\u4e00-\u9fa5\\.\\*\\)\\(\\+\\$\\[\\?\\\\\\^\\{\\|\\]\\}%%%@\'\",。‘、-【】·！_——=:;；<>《》‘’“”!#~]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    return  isMatch;
}
@end
