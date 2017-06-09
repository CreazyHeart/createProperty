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
//    /Users/tuoshi/Desktop/property.txt
    
    NSString *path = @"/Users/tuoshi/Desktop/property.txt";
    
    // 设计模型,创建属性代码 => dict
    NSString *propertyCode =  [dict createPropertyCode];
    NSLog(@"%@",propertyCode);
    
    [propertyCode writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
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
