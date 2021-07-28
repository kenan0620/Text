//
//  UIViewController+Runtime.m
//  Text
//
//  Created by 柯南 on 2021/7/26.
//

#import "UIViewController+Runtime.h"
#import <objc/runtime.h>
@implementation UIViewController (Runtime)

+ (void)load{
    NSLog(@"VC runtime");

    Method originalMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
    
    Method swizzleMethod = class_getInstanceMethod([self class], @selector(swizzleviewDidLoad));
        
//    method_exchangeImplementations(originalMethod, swizzleMethod);
}
- (void)swizzleviewDidLoad{
    NSLog(@"VC runtime text  %@",@"");
    self.view.backgroundColor = [UIColor brownColor];
    [self swizzleviewDidLoad];
}

@end
