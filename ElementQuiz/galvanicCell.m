

//
//  ViewController.m
//  MoleCalc
//
//  Created by Jack Pascoe on 1/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "galvanicCell.h"

@interface galvanicCell ()

// Outlets that allow manipulation and data collection from the various views on screen
@property (weak, nonatomic) IBOutlet UITextField *metal1Text;
@property (weak, nonatomic) IBOutlet UITextField *metal2Text;
@property (weak, nonatomic) IBOutlet UITextField *cathodeText;
@property (weak, nonatomic) IBOutlet UITextField *anodeText;
@property (weak, nonatomic) IBOutlet UITextField *voltageText;



// Fixed variables and data structures defined to hold data
@property(strong, nonatomic) NSArray* elements;
@property(strong, nonatomic) NSDictionary * voltages;

@end

@implementation galvanicCell



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     self.elements = @[@"potassium", @"barium", @"calcium", @"sodium", @"magnesium", @"aluminium", @"manganese", @"zinc", @"iron II", @"nickel", @"tin", @"lead", @"hydrogen", @"copper II", @"copper", @"iodine", @"iron III", @"silver", @"bromine", @"chlorine", @"fluorine"]; // Creates the array of elements used to determine cathode/anode

    NSString * path = [[NSBundle mainBundle] pathForResource:@"voltages" ofType:@"plist" inDirectory:nil];
    self.voltages = [NSDictionary dictionaryWithContentsOfFile:path]; // Creates a dictionary of metals and voltages
    
    
    
    [self.metal1Text becomeFirstResponder]; // Opens the keyboard for the first textfield
   
    
}





- (IBAction)galvanicCalculatePress:(id)sender { // Method that occurs when the calculate button is pressed
    
    
    // Sets local variables that have the white space trimmed from the end of them
    
    NSString *metal1 = [self.metal1Text.text stringByTrimmingCharactersInSet:
     [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *metal2 = [self.metal2Text.text stringByTrimmingCharactersInSet:
                        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // Defines localised variables that can be used later
    NSNumber *volt1;
    NSNumber *volt2;
    NSNumber *voltage;
    
    
    
    [self.metal1Text resignFirstResponder]; // Resigns the two keyboards
    [self.metal2Text resignFirstResponder];
    
    
    // Defines local variables for comparison
    int location1 = 0;
    int location2 = 0;
    
    
    
    for (int x = 0; x < [self.elements count]; x++)// Generates a random array of symbols
    {
        
        // As the string of elements is in order of reactivity, which ever metal has a lower index is the more reactive and as such is the anode - this portion of code however just finds the index and stores the location
        
        if([metal1 isEqualToString:[self.elements objectAtIndex:x]]){
            location1 = x;
            
        }
        
        else if([metal2 isEqualToString:[self.elements objectAtIndex:x]]){
            location2 = x;
        }
        
        
        
        
        
    }
    
    volt1 = [self.voltages objectForKey:metal1]; // Voltages gathered here
    volt2 = [self.voltages objectForKey:metal2];
    
    // The locations are then compared and data is then extrapolated from them, as the more reactive metal will be the anode.
    
    if (location1 > location2){
        
        
        self.cathodeText.text = metal1;
        self.anodeText.text = metal2;
        

        voltage = @([volt1 floatValue] - [volt2 floatValue]); // The voltage is then determined
        self.voltageText.text = [NSString stringWithFormat:@"%@", voltage]; // The voltage textfield is then set as the correct value.
   
    }
    
    
    
    else if (location1 < location2){ // The inverse method from above
        
        self.cathodeText.text = metal2;
        self.anodeText.text = metal1;
        
        
        voltage = @([volt2 floatValue] - [volt1 floatValue]);
        self.voltageText.text = [NSString stringWithFormat:@"%@", voltage];
        
    }
    
    
    
    
    // Method that occurs if either the metal cannot be found within the array or the values are the same - eg the same metal.
    
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Ensure that the metals you've input are one of the included metals and that they are spelt correctly. A list of appropriate metals can be found in the user manual."
                                                       delegate:self
                                              cancelButtonTitle:@"Okay" // Alert to help the user fix the problem
                                              otherButtonTitles:nil];
        [alert show];
        [self.metal1Text becomeFirstResponder]; // Brings the keyboard back up to allow for changes
        
        
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
