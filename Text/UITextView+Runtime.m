//
//  UITextView+Runtime.m
//  Text
//
//  Created by 柯南 on 2021/7/26.
//

#import "UITextView+Runtime.h"
#import <objc/runtime.h>
#import "NSString+Regular.h"

static const char * key = "name";//必须用char *，用NSString会报错

@implementation UITextView (Runtime)
// set方法
- (void)setUserName:(NSString *)userName
{
    // 让这个字符串与当前对象产生联系
    /*
     param1:object:给哪个对象添加属性
     param2:key:属性名称
     param3:value:属性值
     param4:policy:保存策略
     */
    objc_setAssociatedObject(self,key, userName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
 
// get 方法
- (NSString *)userName
{
    return objc_getAssociatedObject(self, key);
}

+ (void)load{
    NSLog(@"runtime");
//    unsigned int count = 0;
//        Ivar *vars = class_copyIvarList([UITextView class], &count);
//        
//        for (int i = 0; i < count; i++) {
//            Ivar var = vars[i];
//            NSLog(@"%s", ivar_getName(var));
//        }
//        free(vars);
    
    SEL originSel = @selector(shouldChangeTextInRange:replacementText:);
    SEL swizzleSel  = @selector(swizzle_textView:shouldChangeTextInRange:replacementText:);
    
    Method originalMethod = class_getInstanceMethod([self class], @selector(shouldChangeTextInRange:replacementText:));
    
    Method swizzleMethod = class_getInstanceMethod([self class], @selector(swizzle_textView:shouldChangeTextInRange:replacementText:));
        
    BOOL didAddMethod = class_addMethod([self class],originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod([self class], swizzleSel, method_getImplementation(originalMethod), method_getTypeEncoding(swizzleMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
    
}

- (BOOL)swizzle_textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    NSLog(@"runtime text %@",text);
    return false;

    if ([text inputIsValid]) {
        return false;
    }
    
    return [self swizzle_textView:textView shouldChangeTextInRange:range replacementText:text];
}

    
 
@end
