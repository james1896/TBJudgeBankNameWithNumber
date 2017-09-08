//
//  JudgeBankCardName.m
//  CardNumberTest
//
//  Created by toby on 08/09/2017.
//  Copyright © 2017 贾萍. All rights reserved.
//

#import "JudgeBankCardName.h"

@implementation JudgeBankCardName

+ (void)returnbankNameWithCardNumber:(NSString *)number returnShowLable:(UILabel *)lab{
    NSArray *nums = [number componentsSeparatedByString:@" "];
    NSMutableString *bankNumber = [[NSMutableString alloc]initWithCapacity:0];
    for(NSString *tmp in nums){
        [bankNumber appendString:tmp];
    }
    
    if(bankNumber.length<=0 || bankNumber.length<16 || bankNumber.length>19) {
        return ;
    }
    if ([self returnBankName:bankNumber showlab:lab].length>0) {
        lab.text = [self returnBankName:bankNumber showlab:lab];
    }

}

+ (BOOL)JudgeBankCardNumberWithtextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *text = [textField text];
    
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *newString = @"";
    while (text.length > 0) {
        
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        newString = [newString stringByAppendingString:subString];
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    
    // 限制长度
    if (newString.length >= 24) {
        return NO;
    }
    
    [textField setText:newString];
    
    return NO;
}

+ (NSString *)returnBankName:(NSString*) idCard showlab:(UILabel *)lab{
    
    if(idCard==nil || idCard.length<16 || idCard.length>19){
        lab.text = @"卡号不合法";
        return @"";
        
    }
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"bank" ofType:@"plist"];
    NSDictionary* resultDic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSArray *bankBin = resultDic.allKeys;
    
    //6位Bin号
    NSString* cardbin_6 = [idCard substringWithRange:NSMakeRange(0, 6)];
    //8位Bin号
    NSString* cardbin_8 = [idCard substringWithRange:NSMakeRange(0, 8)];
    
    if ([bankBin containsObject:cardbin_6]) {
        return [resultDic objectForKey:cardbin_6];
    }else if ([bankBin containsObject:cardbin_8]){
        return [resultDic objectForKey:cardbin_8];
    }else{
        lab.text = @"plist文件中不存在请自行添加对应卡种";
        return @"";
    }
    return @"";
    
}
@end
