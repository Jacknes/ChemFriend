//
//  molarHeat.m
//  ElementQuiz
//
//  Created by Jack Pascoe on 12/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "molarHeat.h"

@interface molarHeat ()
@property (weak, nonatomic) IBOutlet UITextField *massText;
@property (weak, nonatomic) IBOutlet UITextField *specificText;
@property (weak, nonatomic) IBOutlet UITextField *tempChangeText;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UITextField *deltaHText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *negativeSwitch;


@end



@implementation molarHeat
int negative = -1;


- (void)viewDidLoad
{
    
  //  [self.massText setDelegate:self.massText];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}





- (IBAction)calcPressed:(id)sender
{
    float mass = [self.massText.text floatValue];
    float specific = [self.specificText.text floatValue];
    float temp = [self.tempChangeText.text floatValue];
    
    float result = -(mass * specific * temp * negative);
    
    self.deltaHText.text = [NSString stringWithFormat:@"%f", result];
    
    
    
    
    
    
    
    
    
}
- (IBAction)negativeStateChanged:(id)sender {
    
    if ([self.negativeSwitch selectedSegmentIndex] == 0) {
        
       negative = -1;
        
        
    }

    
    
    
    else if ([self.negativeSwitch selectedSegmentIndex] == 1) {
        
        negative = 1;
        
        
    }
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [self.massText resignFirstResponder];
    return YES;
}



@end