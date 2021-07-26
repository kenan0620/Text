//
//  NSString+Regular.m
//  Text
//
//  Created by 柯南 on 2021/7/26.
//

#import "NSString+Regular.h"

@implementation NSString (Regular)
- (BOOL)hasEmoji{
    NSString *uniStr = [NSString stringWithUTF8String:[self UTF8String]];
    NSData *uniData = [uniStr dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *emojiText = [[NSString alloc] initWithData:uniData encoding:NSUTF8StringEncoding];
    BOOL result = [emojiText hasPrefix:@"\\u23"] ||
    [emojiText hasPrefix:@"\\u26"] ||
    [emojiText hasPrefix:@"\\u27"] ||
    [emojiText hasPrefix:@"\\u32"] ||
    [emojiText hasPrefix:@"\\ud83c"]||
    [emojiText hasPrefix:@"\\ud83d"] ||
    [emojiText hasPrefix:@"\\ud83e"] ||
    [emojiText containsString:@"\\ufe0f"];
    
    return result;
}
@end
