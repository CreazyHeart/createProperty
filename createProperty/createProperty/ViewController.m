//
//  ViewController.m
//  createProperty
//
//  Created by tuoshi on 2017/6/7.
//  Copyright © 2017年 hushanxin. All rights reserved.
//

#import "ViewController.h"
#import "NSDictionary+Property.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *dicStringTextField;

@property (weak, nonatomic) IBOutlet UITextView *propertyTextField;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)createProperty {
    
    if (!self.dicStringTextField.text.length) {
        return;
    }
    // 获取文件全路径
    
    // 文件全路径
    NSDictionary *dict = [self dictionaryWithJsonString:self.dicStringTextField.text];
    
    // 设计模型,创建属性代码 => dict
    self.propertyTextField.text = [dict createPropertyCode];
    
}

- (IBAction)copyString {
    
    UIPasteboard*pasteboard = [UIPasteboard generalPasteboard];
    
    pasteboard.string=self.propertyTextField.text;
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    
    return dic;
    
}


@end
