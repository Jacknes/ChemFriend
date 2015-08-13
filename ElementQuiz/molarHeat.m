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
    [self.massText becomeFirstResponder];
    
    // Do any additional setup after loading the view, typically from a nib.
}


/*- (IBAction)resignKeyboards:(id)sender {
    [self.tempChangeText resignFirstResponder];
    [self.specificText resignFirstResponder];
    [self.massText resignFirstResponder];
    [self.deltaHText resignFirstResponder];


        
}
*/



- (IBAction)specificCalcPressed:(id)sender
{
    float mass = [self.massText.text floatValue];
    float specific = [self.specificText.text floatValue];
    float temp = [self.tempChangeText.text floatValue];
    
    float deltaH = [self.deltaHText.text floatValue];
    
    
    if (deltaH == 0) {
        float result = -(mass * specific * temp * negative);
        self.deltaHText.text = [NSString stringWithFormat:@"%f", result];
    }
    
    else if (mass == 0) {
        float mass = -(deltaH / (specific * temp * negative));
        self.massText.text = [NSString stringWithFormat:@"%f", mass];
    }
    
    else if (specific == 0) {
        float specific = -(deltaH / (mass * temp * negative));
        self.specificText.text = [NSString stringWithFormat:@"%f", specific];
        
    }
    
    else if (temp == 0) {
        float temp = -(deltaH / (mass * specific * negative));
        self.tempChangeText.text = [NSString stringWithFormat:@"%f", temp];
    }
    
    if ((mass == 0 && specific == 0) || (mass == 0 && temp == 0) || (mass == 0 && deltaH == 0) || (specific = 0 && temp == 0) || (specific == 0 && deltaH == 0) || (deltaH == 0 && temp ==0)){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Please ensure you have entered data into at least three fields and that this data is appropriate (eg. 10.45)"
                                                       delegate:self
                                              cancelButtonTitle:@"Okay" // Alerts the user that the data they have entered is not formatted correctly or missing.
                                              otherButtonTitles:nil];
        [alert show];
        self.deltaHText.text = @"";
        
    }
    
    
  
    
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