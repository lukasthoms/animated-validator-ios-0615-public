//
//  ValidatorViewController.m
//  AnimatedValidator
//
//  Created by Al Tyus on 5/12/14.
//  Copyright (c) 2014 al-tyus.com. All rights reserved.
//

#import "ValidatorViewController.h"
#import "Constants.h"

@interface ValidatorViewController ()<UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *emailConfirmTextField;
@property (nonatomic, weak) IBOutlet UITextField *phoneTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordConfirmTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) NSArray *textFieldArray;

@end

@implementation ValidatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.submitButton.accessibilityLabel = SUBMITBUTTON;
    self.emailTextField.accessibilityLabel = EMAILTEXTFIELD;
    self.emailConfirmTextField.accessibilityLabel = EMAILCONFIRMTEXTFIELD;
    self.phoneTextField.accessibilityLabel = PHONETEXTFIELD;
    self.passwordTextField.accessibilityLabel = PASSWORDTEXTFIELD;
    self.passwordConfirmTextField.accessibilityLabel = PASSWORDCONFIRMTEXTFIELD;
    self.emailTextField.delegate = self;
    self.emailConfirmTextField.delegate = self;
    self.phoneTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.passwordConfirmTextField.delegate = self;
    self.textFieldArray = @[self.emailTextField, self.emailConfirmTextField, self.phoneTextField, self.passwordTextField, self.passwordConfirmTextField];
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if ([textField.text isEqualToString:@""]) {
        
        [UIView animateKeyframesWithDuration:0.5 delay:0 options:0 animations:^{
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
                textField.backgroundColor = [UIColor redColor];
            }];
            [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
                textField.backgroundColor = [UIColor whiteColor];
            }];
        } completion:^(BOOL finished) { }];
        
//        [UIView animateWithDuration:0.25 animations:^{
//            textField.backgroundColor = [UIColor redColor];
//
//        }completion:^(BOOL finished) {
//            [UIView animateWithDuration:0.25 animations:^{
//                textField.backgroundColor = [UIColor whiteColor];
//            }];
//        }];
        NSString *fixThis = [NSString stringWithFormat:@"Please fill this out: %@",textField.placeholder];
        if (![textField.placeholder containsString:@"Please"]) {
            textField.placeholder = fixThis;
        }

        return NO;
    } else {
        return YES;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}


@end
