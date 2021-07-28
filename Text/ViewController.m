//
//  ViewController.m
//  Text
//
//  Created by 柯南 on 2021/7/26.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate, UITextFieldDelegate>
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

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    NSLog(@"1-- text:%@; range:%ld, %ld",text,range.location,range.length);
    
    NSString *uniStr = [NSString stringWithUTF8String:[text UTF8String]];
    NSData *uniData = [uniStr dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *emojiText = [[NSString alloc] initWithData:uniData encoding:NSUTF8StringEncoding];
    NSLog(@"text: %@,emojiText:%@",text,emojiText);
    if (![self inputIsValid:text]) {
        return false;
    }
    return  true;
    
}


- (BOOL)inputIsValid:(NSString *)string{
    NSString *regex = @"[0-9a-zA-Z\u4e00-\u9fa5\\.\\*\\)\\(\\+\\$\\[\\?\\\\\\^\\{\\|\\]\\}%%%@\'\",。‘、-【】·！_——=:;；<>《》‘’“”!#~]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:string];
    return  isMatch;
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
