//
//  volume.m
//  ElementQuiz
//
//  Created by Jack Pascoe on 13/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//



#import "volume.h"

@interface volume ()

// Outlets that allow for the manipulation of screen elements
@property (weak, nonatomic) IBOutlet UITextField *valueText;
@property (weak, nonatomic) IBOutlet UIButton *calcButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *resultText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSelect;
@property (weak, nonatomic) IBOutlet UISegmentedControl *conditionSelect;
@property (weak, nonatomic) IBOutlet UITextView *scenarioText;

// Sets fixed variables
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
    [self.valueText becomeFirstResponder]; // Opens the keyboard for the first textfield when the page is opened
}

// STP - 22.71L/mol
// RTP - 24.79L/mol


- (IBAction)volumeCalcPressed:(id)sender { // Method called when the calculate button is pressed
    
    
    
    float value; // Creates a float variable for later use
    
    value = [self.valueText.text floatValue]; // The above variable is then set as the text within the value textbox
    
    if (value == 0){ // If not value has been input this alert will inform the user, suggesting fixes
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Please ensure you have entered data into the value field and that this data is appropriate (eg. 10.45)"
                                                       delegate:self
                                              cancelButtonTitle:@"Okay" // Alerts the user that the data they have entered is not formatted correctly or missing.
                                              otherButtonTitles:nil];
        [alert show]; // Displays the alert
        self.valueText.text = @""; // Resets the value textfield
        
    }
    
    else { // Occurs if the value is anything but 0
        
        if ([self.unitSelect selectedSegmentIndex] == 0) { // Checks what state the unitSelect segment control is and responds accordingly.
            
            
            result = (value/condition); // Performs the appropriate calculation.
            
            
            self.resultLabel.text = @"Moles"; // Changes the unit description accordingly.
            
            self.scenarioText.text =  [NSString stringWithFormat:@"%s%@%s%@", "The number of moles in your volume of gas at ", self.conditionStr, " is ", self.resultStr]; // Adds the result data to the scenario text field
            
        
            
        }
        
        else if ([self.unitSelect selectedSegmentIndex] == 1){
            
           
            result = (value * condition); // Performs the appropriate calculation. 

            self.resultLabel.text = @"Litres"; // Changes the unit description accordingly
            self.scenarioText.text =  [NSString stringWithFormat:@"%s%@%s%@", "The number of litres of your gas at ", self.conditionStr, " is ", self.resultStr]; // Adds the result data to the scenario text field
            
            
        }
        
        
        self.resultStr = [NSString stringWithFormat:@"%f", result]; // Assigns the result and places that in the result textfield
        self.resultText.text = [NSString stringWithFormat:@"%f", result];
        
    }
 
    
    
 

    
}




- (IBAction)conditionChanged:(id)sender { // Method that occurs when there is a change in state from the segment controller
    
    if ([self.conditionSelect selectedSegmentIndex] == 1) { // If the STP setting is chosen the variables are changed accordingly
        condition = 22.71; // Sets the condition as STP
        self.conditionStr = @"standard temperature and pressure (0 degrees, 273K)";
        
    }
    
    else if ([self.conditionSelect selectedSegmentIndex] == 0) { // If the RTP setting is chosen the variables are changed accordingly to match the situation
        
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