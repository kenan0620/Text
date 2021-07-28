//
//  NSString+Regular.h
//  Text
//
//  Created by 柯南 on 2021/7/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Regular)
/**
 输入是否有效
 
 有效内容为:中文、数字、字母、常用符号
 */
- (BOOL)inputIsValid;
@end

NS_ASSUME_NONNULL_END
