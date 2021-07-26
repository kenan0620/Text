//
//  ViewController.m
//  Text
//
//  Created by 柯南 on 2021/7/26.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) UITextView *textView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.textView];
    [self.view addSubview:self.textView1];

}

#pragma mark - UITextViewDelegate


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return  true;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    return  true;
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (textView == self.textView1){
        return  true;
    }
//    NSLog(@"1-- text:%@; range:%ld, %ld",text,range.location,range.length);
    BOOL isMap = [self isEmojiMap:text];
    if (isMap) {
        return false;
    }
//    NSLog(@"正则结果是:%@",result? @"true": @"false");
        NSString *uniStr = [NSString stringWithUTF8String:[text UTF8String]];
        NSData *uniData = [uniStr dataUsingEncoding:NSNonLossyASCIIStringEncoding];
        NSString *emojiText = [[NSString alloc] initWithData:uniData encoding:NSUTF8StringEncoding];
        NSLog(@"text: %@,emojiText:%@",text,emojiText);
    return  true;
    
}
- (void)textViewDidChange:(UITextView *)textView{
    
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
//    NSLog(@"2-- textView.text:%@;",textView.text);

}

- (BOOL)isEmojiMap:(NSString *)string{
    NSString *uniStr = [NSString stringWithUTF8String:[string UTF8String]];
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

#pragma mark - UILzay
- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.font = [UIFont systemFontOfSize:18];
        _textView.frame = CGRectMake(10, 200, 300, 200);
        _textView.delegate = self;
    }
    
    return  _textView;
}

- (UITextView *)textView1{
    if (!_textView1) {
        _textView1 = [[UITextView alloc] init];
        _textView1.font = [UIFont systemFontOfSize:18];
        _textView1.frame = CGRectMake(10, 450, 300, 200);
        _textView1.delegate = self;
    }
    
    return  _textView1;
}


@end
