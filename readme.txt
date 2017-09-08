//
//  ViewController.m
//  CardNumberTest
//
//  Created by JP on 16/10/24.
//  Copyright © 2016年 JP. All rights reserved.
//

#import "ViewController.h"
#import "JudgeBankCardName.h"
@interface ViewController ()<UITextFieldDelegate>
{
//    NSArray* bankName;
//    NSArray* bankBin;
    
}
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end

@implementation ViewController
- (IBAction)transfer:(id)sender {
    
//    [JudgeBankCardName returnbankNameWithCardNumber:self.textField.text returnShowLable:_resultLabel];
    [JudgeBankCardName returnbankNameWithCardNumber:@"6227001541800361839" returnShowLable:_resultLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
//    [self returnBankName:@"你的银行卡号"];
}



-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
   return [JudgeBankCardName JudgeBankCardNumberWithtextField:textField shouldChangeCharactersInRange:range replacementString:string];
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
