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
// Outlets established to allow manipulation of onscreen views
@property (weak, nonatomic) IBOutlet UITextField *massText;
@property (weak, nonatomic) IBOutlet UITextField *specificText;
@property (weak, nonatomic) IBOutlet UITextField *tempChangeText;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UITextField *deltaHText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *negativeSwitch;




@end



@implementation molarHeat


int negative = -1; // Declaration of the negative state variable.



- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self.massText becomeFirstResponder]; // Makes the keyboard open when the view is loaded
    
    // Do any additional setup after loading the view, typically from a nib.
}







- (IBAction)specificCalcPressed:(id)sender
{
    
    // Sets locally scoped variables from the text field outlets
    float mass = [self.massText.text floatValue];
    float specific = [self.specificText.text floatValue];
    float temp = [self.tempChangeText.text floatValue];
    float deltaH = [self.deltaHText.text floatValue];
    
    
    
    // Determines which field is missing for calculation, could have been performed with a case where statement, however in this case would have resulted in the same number of lines of code.
    
    // For each, a different arrangement of the same formula is applied according to what is missing.
    
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
    
    
    // This statement checks if any two variables are missing at once, causing the calculation to not work.
    
    if ((mass == 0 && specific == 0) || (mass == 0 && temp == 0) || (mass == 0 && deltaH == 0) || (specific = 0 && temp == 0) || (specific == 0 && deltaH == 0) || (deltaH == 0 && temp ==0)){
        
        
        // If any two are, a notification is sent to the user to review their data entry or format
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Please ensure you have entered data into at least three fields and that this data is appropriate (eg. 10.45)"
                                                       delegate:self
                                              cancelButtonTitle:@"Okay" // Alerts the user that the data they have entered is not formatted correctly or missing.
                                              otherButtonTitles:nil];
        [alert show];
        self.deltaHText.text = @"";
        
    }
    
    
  
    
}
- (IBAction)negativeStateChanged:(id)sender { // Method that responds to a change in the segment control indicating a postive or negative temperature change.
    
    if ([self.negativeSwitch selectedSegmentIndex] == 0) {
        
       negative = -1; // Applies the appropriate value
        
        
    }

    
    else if ([self.negativeSwitch selectedSegmentIndex] == 1) {
        
        negative = 1; // Applies the appropriate value
        
        
    }
}






@end