//
//  ShopCartCell.m
//  宠爱有家
//
//  Created by scjy on 16/5/16.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "ShopCartCell.h"
#import "UIButton+layerBorder.h"
@implementation ShopCartCell
{
    float price;
}
- (void)awakeFromNib {
    [self.chooseBtn addBorderWidth:1 borderColor:[UIColor blackColor]];
    _isSelected = NO;

    price = 599;
    
    self.costLabel.text = [NSString stringWithFormat:@"¥%.2f", price];
}

- (IBAction)chooseBtnAction:(id)sender {
    
    self.chooseBtn.selected = !self.chooseBtn.selected;
    
    [self.chooseBtn setTitle:@"√" forState:UIControlStateSelected];
    [self.chooseBtn setTitleShadowColor:[UIColor clearColor] forState:UIControlStateSelected];
    [self.chooseBtn setTitle:@"" forState:UIControlStateNormal];
    _isSelected = !_isSelected;
    if (self.isSelected == YES) {
        
        NSArray *strArr = [self.costLabel.text componentsSeparatedByString:@"¥"];
        NSString *string = [NSString string];
        for (NSString *str in strArr) {
            string = [string stringByAppendingString:str];
        }
        self.backValue([string floatValue]);
    }else{
        NSArray *strArr = [self.costLabel.text componentsSeparatedByString:@"¥"];
        NSString *string = [NSString string];
        for (NSString *str in strArr) {
            string = [string stringByAppendingString:str];
        }

        self.backValue(-[string floatValue]);
    }
    
    
    
}
- (IBAction)addBtn:(id)sender {
    int a = [self.numberTextFlied.text intValue];
    int b = a + 1;
    self.numberTextFlied.text = [NSString stringWithFormat:@"%d", b];
    self.costLabel.text = [NSString stringWithFormat:@"¥%.2f", price * b];
    //每次点击完都重新划线
    [self setNeedsDisplay];
    if (_isSelected == YES) {

        self.backValue(price);
    }
}
- (IBAction)downBtn:(id)sender {
    if ([self.numberTextFlied.text intValue] <= 0) {
        return;
    }
    int a = [self.numberTextFlied.text intValue];
    int b = a - 1;
    self.numberTextFlied.text = [NSString stringWithFormat:@"%d", b];
    self.costLabel.text = [NSString stringWithFormat:@"¥%.2f", price * b];
    //每次点击完都重新划线
    [self setNeedsDisplay];
    if (_isSelected == YES) {
       self.backValue(- price);
    }

}

- (void)drawRect:(CGRect)rect
{
    if (self.numberTextFlied.text.intValue == 1) {
        self.downBtn.userInteractionEnabled = NO;
        self.downBtn.alpha = 0.4;
    }else{
        self.downBtn.userInteractionEnabled = YES;
        self.downBtn.alpha = 1;
    }

}
- (IBAction)pushBtn:(id)sender {
    _push();
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self setNeedsDisplay];
    NSString *str = [textField.text stringByAppendingString:string];
    self.costLabel.text = [NSString stringWithFormat:@"¥%.2f", price * str.floatValue];
    
    if(textField.text.length==0)
    {
        if (string.intValue == 0)
        {
            return NO;
        }
    }
    
    return [self validateNumber:string];
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    self.costLabel.text = [NSString stringWithFormat:@"¥%.2f", price * textField.text.floatValue];
    return YES;
}
//让textfield只能输入数字的方法
- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
        
    }

    return res;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.numberTextFlied resignFirstResponder];
    self.costLabel.text = [NSString stringWithFormat:@"¥%.2f", price * self.numberTextFlied.text.floatValue];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
