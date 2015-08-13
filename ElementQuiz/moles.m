

//
//  ViewController.m
//  MoleCalc
//
//  Created by Jack Pascoe on 1/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//

#import "moles.h"

@interface moles ()

// Establishes the outlets allowing for manipulation and interaction of the views in the storyboard
@property (weak, nonatomic) IBOutlet UITextField *massText;
@property (weak, nonatomic) IBOutlet UITextField *molarText;
@property (weak, nonatomic) IBOutlet UIButton *calcButton;
@property (weak, nonatomic) IBOutlet UITextField *resultText;
@end

@implementation moles

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.massText becomeFirstResponder]; // Opens the keyboard for the mass textfield as soon as the view loads.
}



- (IBAction)moleCalcPressed:(id)sender // Method run when the calculate button is pressed
{
    // Sets localised variables from the textfields within the view
    float mass = [self.massText.text floatValue];
    float molar = [self.molarText.text floatValue];
    float result = [self.resultText.text floatValue];
    

    
    // If statement structure that determines which variable is missing and applying the correct formula
    
    if (result == 0) {
        float result = (mass / molar);
        self.resultText.text = [NSString stringWithFormat:@"%f", result];
    }
    
    else if (mass == 0) {
        float mass = (molar * result);
        self.massText.text = [NSString stringWithFormat:@"%f", mass];
    }
    
    else if (molar == 0) {
        float molar = (mass / result);
        self.molarText.text = [NSString stringWithFormat:@"%f", molar];
        
    }
   
    
    
    
    // If statement that determines that only one variable is missing, allowing it to function correctly - if not, it informs the user to check there data input and the format of said data.
    
    if ((result == 0 && mass == 0) || (result == 0 && molar == 0) || (molar == 0 && mass == 0)){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Please ensure you have entered data into at least two fields and that this data is appropriate (eg. 10.45)"
                                                       delegate:self
                                              cancelButtonTitle:@"Okay" // Alerts the user that the data they have entered is not formatted correctly or missing.
                                              otherButtonTitles:nil];
        [alert show];
        self.resultText.text = @""; // Resets the result textfield
        
    }

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
