//
//  volume.m
//  ElementQuiz
//
//  Created by Jack Pascoe on 13/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//



#import "volume.h"

@interface volume ()
@property (weak, nonatomic) IBOutlet UITextField *valueText;
@property (weak, nonatomic) IBOutlet UIButton *calcButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *resultText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSelect;
@property (weak, nonatomic) IBOutlet UISegmentedControl *conditionSelect;
@property (weak, nonatomic) IBOutlet UITextView *scenarioText;

@property(strong, nonatomic) NSString * conditionStr;
@property(strong, nonatomic) NSString * resultStr;


@end



@implementation volume

float condition = 24.79; // Because the segment display is automatically on RTP

float result = 0.0; // Initialises a starting value for result. 



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.conditionStr = @"room temperature and pressure (25 Degrees, 298K)"; // Sets the conditionstr initially as the user may not change the state.
    [self.valueText becomeFirstResponder];
}

// STP - 22.71L/mol

// RTP - 24.79L/mol


- (IBAction)volumeCalcPressed:(id)sender
{
    float value;
    value = [self.valueText.text floatValue];
    
    if (value == 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Please ensure you have entered data into the value field and that this data is appropriate (eg. 10.45)"
                                                       delegate:self
                                              cancelButtonTitle:@"Okay" // Alerts the user that the data they have entered is not formatted correctly or missing.
                                              otherButtonTitles:nil];
        [alert show];
        self.valueText.text = @"";
        
    }
    
    else {
        if ([self.unitSelect selectedSegmentIndex] == 0) {
            
            
            
            result = (value/condition);
            self.resultStr = [NSString stringWithFormat:@"%f", result];
            
            
            
            self.resultText.text = [NSString stringWithFormat:@"%f", result];
            self.resultLabel.text = @"Moles";
            
            self.scenarioText.text =  [NSString stringWithFormat:@"%s%@%s%@", "The number of moles in your volume of gas at ", self.conditionStr, " is ", self.resultStr];
            
            /*  [NSString stringWithFormat:@"%s", "You're volume of gas at " + self.conditionStr + "is" + self.resultStr]; */
            
            
            
        }
        
        else if ([self.unitSelect selectedSegmentIndex] == 1){
            
            float value;
            
            value = [self.valueText.text floatValue];
            result = (value * condition);
            self.resultStr = [NSString stringWithFormat:@"%f", result];
            self.resultText.text = [NSString stringWithFormat:@"%f", result];
            self.resultLabel.text = @"Litres";
            self.scenarioText.text =  [NSString stringWithFormat:@"%s%@%s%@", "The number of litres of your gas at ", self.conditionStr, " is ", self.resultStr];
            
            
        }
    }
 
    
    
   // [self.valueText resignFirstResponder];

    
}

/*- (IBAction)resignKeyboard:(id)sender {
    [self.valueText resignFirstResponder];
} */

- (IBAction)conditionChanged:(id)sender
{
    if ([self.conditionSelect selectedSegmentIndex] == 1) {
        condition = 22.71; // Sets the condition as STP
        self.conditionStr = @"standard temperature and pressure (0 degrees, 273K)";
        
    }
    
    else if ([self.conditionSelect selectedSegmentIndex] == 0) {
        condition = 24.79; // Sets the condition as RTP
        self.conditionStr = @"room temperature and pressure (25 Degrees, 298K)";
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end