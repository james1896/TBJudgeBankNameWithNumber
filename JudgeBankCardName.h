//
//  JudgeBankCardName.h
//  CardNumberTest
//
//  Created by toby on 08/09/2017.
//  Copyright © 2017 贾萍. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@interface JudgeBankCardName : NSObject

+ (void)returnbankNameWithCardNumber:(NSString *)number returnShowLable:(UILabel *)lab;

+ (BOOL)JudgeBankCardNumberWithtextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
@end
