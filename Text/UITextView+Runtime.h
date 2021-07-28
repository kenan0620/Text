//
//  UITextView+Runtime.h
//  Text
//
//  Created by 柯南 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (Runtime)
- (BOOL)swizzle_textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
